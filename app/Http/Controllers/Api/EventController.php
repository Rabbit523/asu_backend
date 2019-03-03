<?php


namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Spatie\QueryBuilder\Filter;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

use App\Event;
use App\Filters\CategoryFilter;
use App\Http\Resources\Event\EventResource;
use App\Exceptions\Event\EventNotFoundException;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $maxResults = request('page', Event::PAGINATION)['max-results'];
        $fields = comma_separated_to_array(request()->query('fields')['events']);
 
        $query = QueryBuilder::for(Event::class)
                ->allowedFilters(
                    Filter::exact('id'),
                    Filter::partial('name'),
                    Filter::custom('category', CategoryFilter::class)
                )
                ->defaultSort('date', 'time')
                ->allowedSorts('date', 'time')
                ->with('tags')
                ->jsonPaginate($maxResults);
                
        return EventResource::collection($query)->hide($fields);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Event $event)
    {
        $fields = comma_separated_to_array(request()->query('fields')['events']);
    
        EventResource::withoutWrapping();

        return EventResource::make($event)->hide($fields);
    }

    public function follow(Event $event) {
        $user = request()->user();
        
        $user->events()->save($event, [
            'followed_at' => Carbon::now()->toDateTimeString()
        ]);

        return response()->json(["status" => true], 200);
    }

    public function unfollow(Event $event) {
        $user = request()->user();
        
        $user->events()->detach($event->id);

        return response()->json(["status" => false], 200);
    }

    public function attendance(Event $event) {
        $user = request()->user();

        $user->events()->save($event, [
            'followed_at' => null,
            'confirmed_at' => Carbon::now()->toDateTimeString()
        ]);

        $event->increment("attendees");

        return response()->json(["status" => true], 200);
    }
}