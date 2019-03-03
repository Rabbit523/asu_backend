<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Mail;

use App\Role;
use App\User;
use App\Mail\WelcomeMail;
use App\Http\Requests\StoreAdministrator;
use App\DataTables\AdministratorsDataTable;

class AdminController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:admin.index');
         $this->middleware('permission:admin.store', ['only' => ['store']]);

         $this->middleware('permission:admin.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(AdministratorsDataTable $dataTable) 
    {
        $roles = Role::pluck('name', 'id');

        return $dataTable->render('admins.index', ['roles' => $roles ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreAdministrator $request) 
    {
        $user = User::create($request->all());
        $role = Role::findOrFail($request->role);

        $user->assignRole($role);

        $this->sendWelcomeMail($user, $request->password);

        alert()->success(trans('messages.created'))->autoclose(3000);

        return redirect()->route('dashboard.admin.index');
    }
    
    private function sendWelcomeMail($user, $password) 
    {
        Mail::to($user['email'])->send(new WelcomeMail($user, $password));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) 
    {
        $user = User::find($id);
        $user->delete();

        alert()->success(trans('messages.deleted'))->autoclose(3000);

        return redirect()->route('dashboard.admin.index');
    }
}
