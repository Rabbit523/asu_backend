<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\User;
use App\Complaint;
use App\Transformers\UserTransformer;
use App\DataTables\ComplaintsDataTable;
use Illuminate\Foundation\Console\Presets\React;

class ComplaintController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:complaint.index');
         $this->middleware('permission:complaint.show-user')->only('showUser');
         $this->middleware('permission:complaint.show-content')->only('showContent');
    }

    /**
     * Display a listing of the resource.
     *
     * @return ComplaintDataTable $dataTable
     */
    public function index(ComplaintsDataTable $dataTable) 
    {
        return $dataTable->render('complaints.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showUser($id)
    {
        $user = User::select('id', 
                            'name',
                            'email', 
                            'profile', 
                            'created_at', 
                            'last_login_at')
                    ->find($id);
                    
        return fractal($user, new UserTransformer())->respond(200);

    }

    public function showContent($id)
    {
        $post = Complaint::find($id)->bannable;

        return response()
             ->json($post);
    }
}
