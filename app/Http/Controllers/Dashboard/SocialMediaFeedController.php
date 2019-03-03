<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\SocialMediaFeed;
use App\DataTables\SocialMediaFeedsDataTable;
use App\Http\Requests\ValidateSocialMediaFeed;

class SocialMediaFeedController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:feed.index');
         $this->middleware('permission:feed.store', ['only' => ['store']]);
         $this->middleware('permission:feed.update', ['only' => ['update']]);

         $this->middleware('permission:feed.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return SocialMediaFeedsDataTable $dataTable
     */
    public function index(SocialMediaFeedsDataTable $dataTable) 
    {
        return $dataTable->render('feeds.index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param ValidateSocialMediaFeed  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ValidateSocialMediaFeed $request) 
    {
        SocialMediaFeed::create($request->all());

        alert()->success(trans('messages.created'))->autoclose(3000);

        return redirect()->route('dashboard.feed.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ValidateSocialMediaFeed  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateSocialMediaFeed $request, SocialMediaFeed $feed) 
    {
        $feed->update($request->all());

        alert()->success(trans('messages.updated'))->autoclose(3000);

        return redirect()->route('dashboard.feed.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(SocialMediaFeed $feed) 
    {
        $feed->delete();

        alert()->success(trans("messages.deleted"))->autoclose(3000);

        return redirect()->route('dashboard.feed.index');
    }
}
