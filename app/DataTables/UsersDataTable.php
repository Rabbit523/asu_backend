<?php

namespace App\DataTables;

use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Services\DataTable;

use App\User;
use Carbon\Carbon;

class UsersDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
    */
    
    public function dataTable($query)
    {
        return datatables($query)
        ->addColumn('action', function ($user) {
            $action = Auth::user()->can('user.password-reset') ?
                '<button type="button" dusk="edit-button" class="btn btn-primary btn-xs margin-bottom-xs btn-reset-password" data-toggle="modal" data-target="#password-reset-modal">
                    <b>'. trans('messages.password-reset') .'</b>
                </button>'
            : 
                '';
            
            $action .= Auth::user()->can('user.block') ?
                $user->isBanned() ?
                        '<a class="btn btn-primary btn-xs margin-right-xs btn-block-confirm" href="'. route('dashboard.user.block',  ['user' => $user->id]) .'">
                            <b>'. trans('messages.unlock') .'</b>
                        </a>'
                    :
                        '<a class="btn btn-primary btn-xs margin-right-xs btn-block-confirm" href="'. route('dashboard.user.block',  ['user' => $user->id]) .'">
                            <b>'. trans('messages.block') .'</b>
                        </a>'
            :
                '';
            $action .= Auth::user()->can('user.destroy') ?
                '<form class="form-group" action="'. route('dashboard.user.destroy', $user->id) .'" method="POST">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="' . csrf_token() . '" >
                    <button type="submit" class="btn btn-xs btn-danger btn-delete-confirm">
                        <b>' . trans('messages.delete') . '</b>
                    </button>
                </form>'
            :
                '';
            return $action;
        })
        ->addColumn('status', function ($user) {
            $userReports = $user->reports()->count();

            return $user->isBanned() || $userReports > 0 ?
                        '<span class="label label-danger">' . trans('messages.statuses.blocked-reported') . '</span>'
                        :
                        '<span class="label label-success">' . trans('messages.statuses.normal') . '</span>';
        })
        ->editColumn('created_at', function(User $user) {
            return $user->created_at ? $user->created_at->diffForHumans() : '';
        })
        ->editColumn('last_login_at', function(User $user) {
            return $user->last_login_at ? $user->last_login_at->diffForHumans() : '';
        })
        ->filterColumn('banned_at', function($query, $keyword) {
            if (contains_word('blocked', $keyword)) {
                $query->onlyBanned();
            } else if (contains_word('reported', $keyword)) {
                $query->whereHas('roles', function ($query) {
                    $query->where('roles.name', 'user');
                })->has('reports');
            } else if (contains_word('normal', $keyword)) {
                $query->whereHas('roles', function ($query) {
                    $query->where('roles.name', 'user');
                })->doesntHave('reports')->withoutBanned();
            }
        })
        ->filterColumn('profile.student_id', function($query, $keyword) {
            $query->where('profile', 'like',  '%'.$keyword.'%');
        })
        ->filterColumn('profile.major', function($query, $keyword) {
            $query->where('profile', 'like',  '%'.$keyword.'%');
        })
        ->filterColumn('profile.location', function($query, $keyword) {
            $query->where('profile', 'like',  '%'.$keyword.'%');
        })
        ->rawColumns([ 'status', 'action' ]);
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\User $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(User $model)
    {
        return $model->newQuery()->users()->select(
            'id', 
            'name', 
            'email', 
            'profile',
            'created_at',
            'last_login_at',
            'banned_at'
        );
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
                        'dom'     =>    '<"row"<"col-sm-6 margin-bottom-md"B>>' .
                                        '<"row"<"col-sm-6"l><"col-sm-6"f>>' .
                                        '<"row"<"col-sm-12"tr>>' .
                                        '<"row"<"col-sm-5"i><"col-sm-7"p>>',
                        'lengthMenu' => [ 5, 10, 25, 50 ],
                        'buttons' => ['csv', 'excel', 'print', 'reset', 'reload'],
                        'createdRow' => 'function(row, data, index) {
                            $("td", row).eq(0).addClass("v-align-middle bg-success text-center");
                        }',
                        'stateSave' => true,
                        'order' => [0, 'asc']
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
                'data' => 'email',
                'title' => 'Email',
            ],
            [
                'data' => 'profile.graduation_date',
                'title' => 'Graduation Date',
                'orderable'  => false,
                'searchable' => false,
            ],
            [
                'data' => 'profile.student_id',
                'title' => 'Student ID',
            ],
            [
                'data' => 'profile.major',
                'title' => 'Major',
            ],
            [
                'data' => 'profile.location',
                'title' => 'Location',
            ],
            [
                'data' => 'created_at',
                'title' => 'Created At',
            ],
            [
                'data' => 'last_login_at',
                'title' => 'Last Login At',
            ],
            [
                'data' => 'banned_at',
                'visible' => false,
            ],
            [
                'data' => 'status',
                'title' => 'Status',
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
        return 'users_' . time();
    }
}