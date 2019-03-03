<?php

namespace App\DataTables;

use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Services\DataTable;

use App\Event;

class EventsDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        return datatables($query)->setRowId('id')
        ->addColumn('location', function ($event) {
            return $event->location;
        })
        ->addColumn('interested', function ($event) {
            return $event->users()->interestedOnes()->count();
        })
        ->addColumn('attendees', function ($event) {
            return $event->users()->confirmedOnes()->count();
        })
        ->addColumn('picture', function ($event) {
            $pictures = $event->getMedia('images');

            if(!$pictures->isEmpty()) {
                $url = $pictures->first()->getUrl();
                
                return "<a name='picture-link' data-toggle='modal' data-target='#show-picture' data-url='{$url}' href='#' >
                         See   
                        </a>";
            }
 
        })
        ->addColumn('action', function ($event) {
            $action = '<button type="button" class="btn btn-primary btn-xs margin-bottom-xs" data-toggle="modal" data-target="#edit-modal"><b>'
                        . trans("messages.edit") .
                    '</b></button>';

            $action = Auth::user()->can('event.update') ?
                '<button type="button" dusk="edit-button" class="btn btn-primary btn-xs margin-bottom-xs" data-toggle="modal" data-target="#edit-modal"><b>'
                    . trans("messages.edit") .
                '</b></button>'
            : 
                '';
            $action .= Auth::user()->can('event.destroy') ?
                '<form class="form-group" action="'. route('dashboard.event.destroy', $event->id) .'" method="POST">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="' . csrf_token() . '" >
                    <button type="submit" dusk="delete-button" class="btn btn-xs btn-danger btn-delete-confirm"><b>' . trans('messages.delete') . '</b></button>
                </form>'
            :
                '';
            return $action;
        })->rawColumns([ 'picture', 'action' ]);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Event $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Event $model)
    {
        return $model->newQuery()->select(
            'id', 
            'name', 
            'address',
            'city',
            'state',
            'zip_code',
            'date', 
            'time', 
            'description', 
            'created_at'
        ); 
    }
    
    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
                    ->columns($this->getColumns())
                    ->minifiedAjax()
                    ->parameters([
                        'dom'     =>    "<'row'<'col-sm-6 margin-bottom-md'B>>" .
                                        "<'row'<'col-sm-6'l><'col-sm-6'f>>" .
                                        "<'row'<'col-sm-12'tr>>" .
                                        "<'row'<'col-sm-5'i><'col-sm-7'p>>",
                        'lengthMenu' => [ 5, 10, 25, 50 ],
                        'buttons' => ['csv', 'excel', 'print', 'reset', 'reload'],
                        'createdRow' => 'function(row, data, index) {
                            $("td", row).eq(0).addClass("v-align-middle bg-success text-center");
                        }',
                        'stateSave' => true,
                        'order' => [0, 'asc'],
                    ]);
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        return [
            [
                'data' => 'id',
                'title' => 'ID',
                'orderable' => true,
                'searchable' => false
            ],
            [
                'data' => 'name',
                'title' => 'Name',
            ],
            [
                'data' => 'location',
                'title' => 'Location',
            ],
            [
                'data' => 'date',
                'title' => 'Date',
            ],
            [
                'data' => 'time',
                'title' => 'Time',
            ],
            [
                'data' => 'description',
                'title' => 'Description',
            ],
            [
                'data' => 'interested',
                'title' => 'Interested',
            ],
            [
                'data' => 'attendees',
                'title' => 'Attendees',
            ],
            [
                'data' => 'picture',
                'title' => 'Picture',
            ],
            [
                'data' => 'created_at',
                'title' => 'Posted At',
            ],
            [
                'data'       => 'action',
                'title'      => '',
                'orderable'  => false,
                'searchable' => false,
                'printable'  => false, 
                'exportable' => false
            ],
        ];
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'Events_' . date('YmdHis');
    }
}
