<?php


namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Spatie\QueryBuilder\Filter;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

use App\Job;
use App\Filters\CategoryFilter;
use App\Filters\Jobs\NameFilter;
use App\Http\Resources\Job\JobResource;
use App\Exceptions\Job\JobNotFoundException;

class JobController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $maxResults = request('page', Job::PAGINATION)['max-results'];
        $fields = comma_separated_to_array(request()->query('fields')['jobs']);
 
        $query = QueryBuilder::for(Job::class)
                ->allowedFilters(
                    Filter::exact('id'),
                    Filter::partial('state'),
                    Filter::partial('company'),
                    Filter::custom('name', NameFilter::class),
                    Filter::custom('category', CategoryFilter::class)
                )
                ->allowedSorts('state', 'company')
                ->with('tags')
                ->jsonPaginate($maxResults);
                
        return JobResource::collection($query)->hide($fields);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Job $job)
    {
        if ($job) {
            $fields = comma_separated_to_array(request()->query('fields')['jobs']);
     
            JobResource::withoutWrapping();
            return JobResource::make($job)->hide($fields);
        }

        throw new JobNotFoundException();
    }
}