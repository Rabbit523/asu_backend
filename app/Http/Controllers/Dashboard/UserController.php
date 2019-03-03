<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Mail;

use App\User;
use App\Mail\WelcomeMail;
use App\DataTables\UsersDataTable;
use App\Http\Requests\ValidateUser;

class UserController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:user.index');

         $this->middleware('permission:user.block', ['only' => ['block']]);
         $this->middleware('permission:user.password-reset', ['only' => ['passwordReset']]);
         $this->middleware('permission:user.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(UsersDataTable $dataTable) 
    {
        return $dataTable->render('users.index');
    }

    /**
     * Reset the specified resource password on storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function passwordReset(ValidateUser $request) 
    {
        $user = User::where('email', $request->get('email'))->first();
        $user->fill($request->only('password'))->save();

        $this->sendWelcomeMail($user, $request->password);

        alert()->success(trans('messages.updated'))->autoclose(3000);

        return redirect()->route('dashboard.user.index');
    }
    
    private function sendWelcomeMail($user, $password) 
    {
        Mail::to($user['email'])->send(new WelcomeMail($user, $password));
    }

    /**
     * Block the specified resource on storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function block($id) 
    {      
        $user = User::find($id);

        if ($user->isNotBanned()) {
            $message = 'blocked';
            $user->ban();
        }else {
            $message = 'unlocked';
            $user->unban();
        }
        
        alert()->success(trans('messages.'.$message))->autoclose(3000);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) 
    {   
        User::find($id)->delete();

        alert()->success(trans('messages.deleted'))->autoclose(3000);

        return redirect()->route('dashboard.user.index');
    }
}
