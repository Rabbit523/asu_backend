<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Channel;
use App\Category;
use App\SendBird\ChannelClient;
use App\SendBird\OpenChannelClient;
use App\DataTables\ChannelsDataTable;
use App\Http\Requests\ValidateChannel;

class ChannelController extends Controller
{
    protected $channelClient;
    protected $openChannelClient;

    function __construct()
    {
        $this->channelClient = new ChannelClient();
        $this->openChannelClient = new OpenChannelClient();

        $this->middleware('permission:channel.index');
        $this->middleware('permission:channel.store', ['only' => ['store', 'show']]);
        $this->middleware('permission:channel.update', ['only' => ['update']]);

        $this->middleware('permission:channel.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return ChannelsDataTable $dataTable
     */
    public function index(ChannelsDataTable $dataTable)
    {
        $categories = Category::pluck('name', 'id');

        return $dataTable->render('channels.index', [
            'categories' => $categories
        ]);
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Channel $channel)
    {
        return response()
             ->json([
                 'name' => $channel->name,
                 'is_public' => $channel->meta['is_public'],
                 'tags' => $channel->tagsWithType('channel')->map(function($tag) {
                    return [
                        'text' => $tag->name,
                        'id' => $tag->id
                    ];
                 }),
                 'category' => $channel->category->id,
                 'required' => $channel->required
             ]);
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
            $request->only('name', 'required')
        );

        $channel->tags()->sync($request->tags);

        if(boolval($request->is_public)){
            $response = $this->openChannelClient->store([
                'name' => $channel->name,
                //'is_public' => boolval($request->is_public)
            ]);
        }
        else{
            $response = $this->channelClient->store([
                'name' => $channel->name,
                'is_public' => boolval($request->is_public)
            ]);
        }

        $response['access_code'] = get_access_code("CH-$channel->id");

        $channel->meta = $response;
        $channel->save();

        alert()->success(trans('messages.created'))->autoclose(3000);

        return redirect()->route('dashboard.channel.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Channel  $channel
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateChannel $request, Channel $channel)
    {
        $response = $this->channelClient->update($channel->meta['channel_url'],
        [
            'name' => $request->name,
            'is_public' => boolval($request->is_public)
        ]);

        $channel->update(array_merge($request->all(), ['meta' => $response]));
        $channel->tags()->sync($request->tags);

        alert()->success(trans('messages.updated'))->autoclose(3000);

        return redirect()->route('dashboard.channel.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Channel  $channel
     * @return \Illuminate\Http\Response
     */
    public function destroy(Channel $channel)
    {
        $statusCode = $this->channelClient->delete($channel->meta['channel_url']);

        if ($statusCode == 200) {
            $channel->delete();

            alert()->success(trans("messages.deleted"))->autoclose(3000);
        }

        return redirect()->route('dashboard.channel.index');
    }
}
