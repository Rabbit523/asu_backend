<?php

namespace App\DataTables;

use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Services\DataTable;

use App\Job;

class JobsDataTable extends DataTable
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
        ->editColumn('url', function ($job) {
            return "<a href='$job->url' target='_blank'>$job->url</a>";
        })
        ->addColumn('location', function ($job) {
            return $job->location;
        })
        ->addColumn('action', function ($job) {
            $action = Auth::user()->can('job.update') ?
                '<button type="button" dusk="edit-button" class="btn btn-primary btn-xs margin-bottom-xs" data-toggle="modal" data-target="#edit-modal"><b>'
                    . trans("messages.edit") .
                '</b></button>'
            : 
                "";
            $action .= Auth::user()->can('job.destroy') ?
                '<form class="form-group" action="'. route('dashboard.job.destroy', $job->id) .'" method="POST">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="' . csrf_token() . '" >
                    <button type="submit" dusk="delete-button" class="btn btn-xs btn-danger btn-delete-confirm"><b>' . trans('messages.delete') . '</b></button>
                </form>'
            :
                '';
            return $action;
        })->rawColumns([ "url", "action" ]);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Job $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Job $model)
    {
        return $model->newQuery()->select(
            'id', 
            'title', 
            'description',
            'city',
            'state',
            'zip_code',
            'company', 
            'url', 
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
                'data' => 'title',
                'title' => 'Title',
            ],
            [
                'data' => 'description',
                'title' => 'Description',
            ],
            [
                'data' => 'location',
                'title' => 'Location',
            ],
            [
                'data' => 'company',
                'title' => 'Company',
            ],
            [
                'data' => 'url',
                'title' => 'URL',
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
        return 'Jobs_' . date('YmdHis');
    }
}
