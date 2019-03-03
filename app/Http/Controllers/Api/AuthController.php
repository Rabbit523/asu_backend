<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Password;

use App\User;
use App\Role;
use App\Channel;
use App\Http\LoginProxy;
use App\SendBird\UserClient;
use App\SendBird\ChannelClient;
use App\Http\Requests\Api\ValidateLogin;
use App\Http\Requests\Api\ValidateSignUp;

class AuthController extends Controller
{
    private $loginProxy;
    protected $userClient;
    protected $channelClient;

    public function __construct(LoginProxy $loginProxy)
    {
        $this->loginProxy = $loginProxy;
        $this->userClient = new UserClient();
        $this->channelClient = new ChannelClient();
    }

    /**
     * Create user and create token
     *
     * @param  [string] name
     * @param  [string] email
     * @param  [string] password
     * @param  [string] password_confirmation
     * @return [string] access_token
     * @return [string] expires_at
     */
    public function signup(ValidateSignUp $request)
    {
        $user = User::create(
            $request->only('email', 'password')
        );
        $role = Role::where('name', $request->get('role'))->first();
        $user->assignRole($role);

        $response = $this->userClient->store([
            "user_id" => $user->email,
            "nickname" => $user->email,
            "profile_url" => "",
            "issue_access_token" => false
        ]);

        $user->meta = $response;
        $user->save();

        $channels = Channel::where('required', true)
                    ->where('meta->is_public', true);

        $channels->each(function ($channel) use($user) {
            $this->channelClient->join($channel->meta['url'], [
                'user_id' => $user->email
            ]);
        });

        return response($this->loginProxy->attemptLogin($request));
    }

    /**
     * Login user and create token
     *
     * @param  [string] email
     * @param  [string] password
     * @return [string] access_token
     * @return [string] expires_at
     */
    public function login(ValidateLogin $request)
    {
        return response($this->loginProxy->attemptLogin($request));
    }

    public function refresh(Request $request)
    {
        return response($this->loginProxy->attemptRefresh());
    }

    public function logout()
    {
        $this->loginProxy->logout();

        return response(null, 204);
    }

    public function sendResetLinkEmail(Request $request)
    {
        $response = Password::broker()->sendResetLink(
            $request->only('email')
        );

        return $response == Password::RESET_LINK_SENT
            ? response(['resetSent' => true])
            : response(['resetSent' => false]);
    }

    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function user(Request $request)
    {
        return response()->json($request->user());
    }
}
