<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Spatie\QueryBuilder\Filter;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

use App\User;
use App\Channel;
use App\SendBird\ChannelClient;
use App\Filters\CategoryFilter;
use App\Http\Requests\Api\ValidateChannel;
use App\Exceptions\Users\UserNotFoundException;
use App\Http\Resources\Channel\ChannelResource;
use App\Http\Requests\Api\ValidateChannelUpdate;
use App\Http\Requests\Api\ValidateChannelInvite;
use App\Http\Resources\Channel\ChannelCollection;

class ChannelController extends Controller
{
    protected $channelClient;

    function __construct()
    {
        $this->channelClient = new ChannelClient();
        $this->middleware('verifychannelownersip', ['only' => ['update']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $urls = $this->getAssociatedChannels();

        $maxResults = request('page', Channel::PAGINATION)['max-results'];

        $query = QueryBuilder::for(Channel::class)
                ->allowedFilters(
                    Filter::exact('id'),
                    Filter::partial('name'),
                    Filter::custom('category', CategoryFilter::class)
                )
                ->byUser($urls)
                ->select('id', 'name', 'meta')
                ->jsonPaginate($maxResults);

        return new ChannelCollection($query);
    }

    public function getAssociatedChannels() {
        $response = $this->channelClient->list(request()->user()->email, [
            "show_empty" => TRUE
        ]);

        return array_column($response, "url");
    }

    /**
     * Joins an specific user to a channel
     *
     * @return \Illuminate\Http\Response
     */
    public function join(Request $request, Channel $channel)
    {
        $user = $request->user();

        $response = $this->channelClient->join($channel->meta['url'],
        [
            'user_id' => $user->email
        ]);

        $channel->forceFill([
            'meta->member_count' => $response['member_count'],
            'meta->joined_member_count' => $response['joined_member_count']
        ])->save();

        return response(null, 200);
    }

    /**
     * Joins an specific user to a channel
     *
     * @return \Illuminate\Http\Response
     */
    public function invite(ValidateChannelInvite $request, Channel $channel)
    {
        $user = $request->user();

        $response = $this->channelClient->invite($channel->meta['url'],
        [
            'user_ids' => [$user->email]
        ]);

        $channel->forceFill([
            'meta->member_count' => $response['member_count'],
            'meta->joined_member_count' => $response['joined_member_count']
        ])->save();

        return response(null, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ValidateChannel $request)
    {
        $channel = Channel::create(
            array_merge(
                [
                    'owner_id' => $request->user()->id
                ],
                $request->only('name')
            )
        );

        $channel->tags()->sync($request->tags);

        $response = $this->channelClient->store([
            'name' => $channel->name,
            'is_public' => $request->is_public
        ]);

        $meta = array_merge(
            [
                'access_code' => get_access_code("CH-$channel->id")
            ],
            $response
        );

        $channel->meta = $meta;
        $channel->save();

        return response(null, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Channel $channel)
    {
        if ($channel) {
            ChannelResource::withoutWrapping();
            return new ChannelResource($channel);
        }

        throw new ChannelNotFoundException();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateChannelUpdate $request, Channel $channel)
    {
        $channel->update($request->only('name'));

        if($request->has('tags')) {
            $channel->tags()->sync($request->tags);
        }

        $response = $this->channelClient->update([
            'name' => $channel->name,
            'is_public' => $request->is_public
        ], $channel->meta['url']);

        $channel->meta = $response;
        $channel->save();

        return response(null, 200);
    }

    /**
     * Remove the specified resource from storage.
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
