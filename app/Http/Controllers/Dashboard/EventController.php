<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Event;
use App\DataTables\EventsDataTable;
use App\Http\Requests\ValidateEvent;

class EventController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:event.index');
         $this->middleware('permission:event.store', ['only' => ['store']]);
         $this->middleware('permission:event.update', ['only' => ['update', 'show']]);

         $this->middleware('permission:event.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return EventDataTable $dataTable
     */
    public function index(EventsDataTable $dataTable) 
    {
        return $dataTable->render('events.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Event $event)
    {
        return response()
             ->json([
                 'name' => $event->name,
                 'address' => $event->address,
                 'city' => $event->city,
                 'state' => $event->state,
                 'zip_code' => $event->zip_code,
                 'date' => $event->date,
                 'time' => $event->time,
                 'description' => $event->description,
                 'tags' => $event->tagsWithType('event')->map(function($tag) {
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
     * @param ValidateEvent  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ValidateEvent $request) 
    {
        $event = Event::create($request->all());

        $event->tags()->sync($request->tags);
        
        if ($request->has('picture')) {
            $event
            ->addMediaFromRequest('picture')
            ->sanitizingFileName(function($fileName) {
                return strtolower(str_replace(['#', '/', '\\', ' '], '-', $fileName));
             })
            ->toMediaCollection('images');
        }

        alert()->success(trans('messages.created'))->autoclose(3000);

        return redirect()->route('dashboard.event.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ValidateEvent  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateEvent $request, Event $event) {
        $event->update($request->all());

        $event->tags()->sync($request->tags);

        if ($request->has('picture')) {
            $event
            ->clearMediaCollection('images');
            $event
            ->addMediaFromRequest('picture')
            ->sanitizingFileName(function($fileName) {
                return strtolower(str_replace(['#', '/', '\\', ' '], '-', $fileName));
             })
            ->toMediaCollection('images');
        }

        alert()->success(trans('messages.updated'))->autoclose(3000);

        return redirect()->route('dashboard.event.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Event $event) 
    {
        $event->delete();

        alert()->success(trans("messages.deleted"))->autoclose(3000);

        return redirect()->route('dashboard.event.index');
    }
}
