<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Spatie\QueryBuilder\Filter;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;
use App\Exceptions\Users\UserNotFoundException;

use App\User;
use App\SendBird\UserClient;
use App\Http\Requests\Api\ValidateProfile;
use App\Http\Resources\Profile\ProfileResource;
use App\Http\Resources\Profile\ProfileCollection;

class ProfileController extends Controller
{
    protected $userClient;

    public function __construct()
    {
        $this->userClient = new UserClient();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $maxResults = request('page', User::PAGINATION)['max-results'];

        $query = QueryBuilder::for(User::class)
                ->allowedFilters(
                    Filter::exact('id'),
                    Filter::partial('name')
                )
                ->users()
                ->select('id', 'name', 'profile')
                ->with('tags')
                ->jsonPaginate($maxResults);

        return new ProfileCollection($query);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::users()->select('id', 'name', 'profile')->find($id);

        if ($user) {
            ProfileResource::withoutWrapping();
            return new ProfileResource($user);
        }

        throw new UserNotFoundException('user_not_found', $id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateProfile $request, $id)
    {
        $user = User::users()->select('id', 'name', 'email', 'profile')->find($id);
        
        if ($user) {
            $profile = array_merge($user->profile, $request->except('name', 'interests'));

            $user->tags()->sync($request->interests);

            $user->profile = $profile;
            
            if($request->has('name')) {
                $user->name = $request->get('name');
                $response = $this->userClient->update([
                    "nickname" => $user->name,
                ],  $user->email);
            }

            $user->save();

            ProfileResource::withoutWrapping();
            return new ProfileResource($user); 
        }

        throw new UserNotFoundException('user_not_found', $id);
    }

    public function interests(Request $request, $id)
    {
        $user = User::users()->find($id);

        if ($user) {
            $user->tags()->sync($request->interests);

            return response(null, 200);
        }

        throw new UserNotFoundException('user_not_found', $id);
    }
}
