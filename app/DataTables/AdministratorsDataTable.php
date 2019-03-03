<?php

namespace App\DataTables;

use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Services\DataTable;

use App\User;

class AdministratorsDataTable extends DataTable
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
        ->addColumn('roles', function (User $user) {
            return $user->roles->map(function($role) {
                return '<span class="label label-success" data-id='. $role->id .'>' . humanize($role->name) . '</span>';
            })->implode('<br>');
        })
        ->addColumn('action', function ($user) {
            return Auth::user()->can('admin.destroy') ?
                '<form class="form-group" action="'. route('dashboard.admin.destroy', $user->id) .'" method="POST">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="' . csrf_token() . '" >
                    <button type="submit" dusk="delete-button" class="btn btn-xs btn-danger btn-delete-confirm"><b>' . trans("messages.delete") . '</b></button>
                </form>'
            :
                '';
        })->rawColumns([ 'roles', 'action' ]);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\User $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(User $model)
    {
        return $model
                ->with('roles')
                ->newQuery()
                ->administrators()
                ->select('users.id', 'users.name', 'users.email');
    }

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
                        'dom'     =>    "<'row margin-bottom-md'<'col-sm-112'B>>" .
                                        "<'row'<'col-sm-12'l>>" .
                                        "<'row'<'col-sm-12'f><'col-sm-12'rt>>" .
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
                'searchable' => true
            ],
            [
                'data' => 'name',
                'title' => 'Name',
            ],
            [
                'data' => 'email',
                'title' => 'Email',
            ],
            [
                'data' => 'roles',
                'title' => 'Roles',
                'name' => 'roles.name',
                'orderable'  => false,
                'searchable' => false,
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
        return 'administrators_' . time();
    }
}