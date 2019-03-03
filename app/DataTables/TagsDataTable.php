<?php

namespace App\DataTables;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Services\DataTable;

use App\Tag;

class TagsDataTable extends DataTable
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
        ->addColumn('name', function ($tag) {
            return $tag->name;
        })
        ->addColumn('type', function ($tag) {
            return strtoupper($tag->type);
        })
        ->addColumn('related', function ($tag) {
            return ('App\\'. Str::singular(ucfirst($tag->type)))::withAllTags($tag->name, $tag->type)->count();
        })
        ->addColumn('action', function ($tag) {
            $action = Auth::user()->can('tag.update') ?
                '<button type="button" dusk="edit-button" class="btn btn-primary btn-xs margin-bottom-xs" data-toggle="modal" data-target="#edit-modal"><b>'
                    . trans("messages.edit") .
                '</b></button>'
            :
                "";
            $action .= Auth::user()->can('tag.destroy') ?
                '<form class="form-group" action="'. route('dashboard.tag.destroy', $tag->id) .'" method="POST">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="' . csrf_token() . '" >
                    <button type="submit" dusk="delete-button" class="btn btn-xs btn-danger btn-delete-confirm"><b>' . trans('messages.delete') . '</b></button>
                </form>'
            :
                '';
            return $action;
        })->rawColumns([ "action" ]);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Tag $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Tag $model)
    {
        return $model->newQuery()->select(
            'id',
            'name',
            'type'
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
                'orderable' => false,
                'searchable' => false
            ],
            [
                'data' => 'name',
                'title' => 'Name',
                'orderable' => false,
                'searchable' => true
            ],
            [
                'data' => 'type',
                'title' => 'Type',
                'orderable' => false,
                'searchable' => true
            ],
            [
                'data' => 'related',
                'title' => 'Related',
                'orderable' => false,
                'searchable' => false
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
        return 'Tags_' . date('YmdHis');
    }
}
