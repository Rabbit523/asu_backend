<?php

namespace App\DataTables;

use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Services\DataTable;

use App\Complaint;

class ComplaintsDataTable extends DataTable
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
        ->addColumn('id', function ($complaint) {
            return $complaint->bannable->id;
        })
        ->addColumn('reported_by', function ($complaint) {
            $user = $complaint->created_by;
            
            return "<a data-toggle='modal' data-target='#show-user-modal' data-type='user' data-id='{$user->id}' href='#' >
                        {$user->name}
                    </a>";
        })
        ->addColumn('content_type', function ($complaint) {
            return str_replace('App\\', '', $complaint->bannable_type);
        })
        ->addColumn('content_reported', function ($complaint) {
            $content = $complaint->bannable;

            return "<a data-toggle='modal' data-target='#show-content-modal' data-type='content' data-id='{$content->id}' href='#' >
                        {$content->title}
                    </a>";
        })
        ->addColumn('created_at', function ($complaint) {
            return $complaint->bannable->created_at->diffForHumans();
        })
        ->addColumn('owner', function ($complaint) {
            $user = $complaint->bannable->author;

            return "<a data-toggle='modal' data-target='#show-user-modal' data-type='user' data-id='{$user->id}' href='#' >
                        {$user->name}
                    </a>";
        })
        ->addColumn('action', function ($complaint) {
            $user = $complaint->bannable->author;

            return Auth::user()->can('user.block') ?
                $user->isBanned() ?
                        '<a class="btn btn-success btn-xs margin-right-xs btn-block-confirm" href="'. route('dashboard.user.block',  ['user' => $user->id]) .'">
                            <b>'. trans('messages.unlock') .'</b>
                        </a>'
                    :
                        '<a class="btn btn-danger btn-xs margin-right-xs btn-block-confirm" href="'. route('dashboard.user.block',  ['user' => $user->id]) .'">
                            <b>'. trans('messages.block') .'</b>
                        </a>'
            :
                '';
        })
        ->filterColumn('reported_by', function($query, $keyword) {
            $query->whereHas('informants', function ($query) use ($keyword) {
                $query->where('name', 'like', '%' . $keyword . '%');
            });
        })
        ->filterColumn('content_reported', function($query, $keyword) {
            $query->whereHas('posts', function ($query) use ($keyword) {
                $query->where('title', 'like', '%' . $keyword . '%');
            });
        })
        ->filterColumn('content_reported', function($query, $keyword) {
            $query->whereHas('posts', function ($query) use ($keyword) {
                $query->where('created_at', 'like', '%' . $keyword . '%');
            });
        })
        ->filterColumn('owner', function($query, $keyword) {
            $query->whereHas('posts', function ($query) use ($keyword) {
                $query->with('author')->whereHas('author', function ($query) use ($keyword) {
                    $query->where('name', 'like', '%' . $keyword . '%');
                });
            });
        })->rawColumns([ 'reported_by', 'content_reported', 'owner', 'action' ]);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Feed $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Complaint $model)
    {
        return $model->newQuery()->with('bannable');
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
                'orderable' => false,
                'searchable' => false
            ],
            [
                'data' => 'reported_by',
                'title' => 'Reported By',
                'orderable' => false,
                'searchable' => true
            ],
            [
                'data' => 'content_type',
                'title' => 'Content Type',
                'orderable' => false,
                'searchable' => true
            ],
            [
                'data' => 'content_reported',
                'title' => 'Content Reported',
                'orderable' => false,
                'searchable' => true
            ],
            [
                'data' => 'created_at',
                'title' => 'Posted At',
                'orderable' => false,
                'searchable' => false
            ],
            [
                'data' => 'owner',
                'title' => 'Owner',
                'orderable' => false,
                'searchable' => true
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
        return 'Complaints_' . date('YmdHis');
    }
}
