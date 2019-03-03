<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Job;
use App\DataTables\JobsDataTable;
use App\Http\Requests\ValidateJob;

class JobController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:job.index');
         $this->middleware('permission:job.store', ['only' => ['store']]);
         $this->middleware('permission:job.update', ['only' => ['update', 'show']]);

         $this->middleware('permission:job.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return JobsDataTable $dataTable
     */
    public function index(JobsDataTable $dataTable) 
    {
        return $dataTable->render('jobs.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Job $job)
    {
        return response()
             ->json([
                 'title' => $job->title,
                 'address' => $job->address,
                 'city' => $job->city,
                 'state' => $job->state,
                 'zip_code' => $job->zip_code,
                 'description' => $job->description,
                 'company' => $job->company,
                 'url' => $job->url,
                 'tags' => $job->tagsWithType('job')->map(function($tag) {
                    return [
                        'text' => $tag->name,
                        'id' => $tag->id
                    ];
                 }),
             ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param ValidateJob  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ValidateJob $request) 
    {
        $job = Job::create($request->all());

        $job->tags()->sync($request->tags);

        alert()->success(trans('messages.created'))->autoclose(3000);

        return redirect()->route('dashboard.job.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ValidateJob  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateJob $request, Job $job) 
    {
        $job->update($request->all());

        $job->tags()->sync($request->tags);

        alert()->success(trans('messages.updated'))->autoclose(3000);

        return redirect()->route('dashboard.job.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Job $job) 
    {
        $job->delete();

        alert()->success(trans("messages.deleted"))->autoclose(3000);

        return redirect()->route('dashboard.job.index');
    }
}
