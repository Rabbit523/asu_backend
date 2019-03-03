<?php

namespace App\DataTables;

use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Services\DataTable;

use App\Channel;

class ChannelsDataTable extends DataTable
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
        ->editColumn('meta.is_public', function ($channel) {
            return $channel->meta['is_public'] 
                ? 'Yes' 
                : 'No';
        })
        ->editColumn('meta.custom_type', function ($channel) {
            return $channel->meta['custom_type'];
        })
        ->addColumn('tags', function ($channel) {
            return $channel->tagsWithType('channel')->map(function($tag) {
                return $tag->name;
            })->implode('<br>');
        })
        ->addColumn('users_suscribed', function ($channel) {
            return $channel->meta['member_count'];
        })
        ->addColumn('created_at', function ($channel) {
            return $channel->created_at->format('m-d-Y');
        })
        ->addColumn('required', function ($channel) {
            return $channel->required ? 'Yes' : 'No';
        })
        ->addColumn('action', function ($channel) {
            $action = Auth::user()->can('channel.update') ?
                '<button type="button" dusk="edit-button" class="btn btn-primary btn-xs margin-bottom-xs" data-toggle="modal" data-target="#edit-modal"><b>'
                    . trans("messages.edit") .
                '</b></button>'
            : 
                '';
            $action .= Auth::user()->can('channel.destroy') ?
                '<form class="form-group" action="'. route('dashboard.channel.destroy', $channel->id) .'" method="POST">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="' . csrf_token() . '" >
                    <button type="submit" dusk="delete-button" class="btn btn-xs btn-danger btn-delete-confirm"><b>' . trans('messages.delete') . '</b></button>
                </form>'
            :
                '';
            return $action;
        })->rawColumns([ 'tags', 'action' ]);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Channel $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Channel $model)
    {
        return $model->newQuery()->select(
            'id', 
            'name',
            'meta', 
            'created_at',
            'required'
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
                'data' => 'meta.is_public',
                'title' => 'Public?',
            ],
            [
                'data' => 'tags',
                'title' => 'Tags',
            ],
            [
                'data' => 'meta.custom_type',
                'title' => 'Access Code',
            ],
            [
                'data' => 'users_suscribed',
                'title' => 'Users in channel',
            ],
            [
                'data' => 'created_at',
                'title' => 'Posted At',
            ],
            [
                'data' => 'required',
                'title' => 'Required?',
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
        return 'Channels_' . date('YmdHis');
    }
}
