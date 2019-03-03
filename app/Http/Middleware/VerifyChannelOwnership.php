<?php

namespace App\Http\Middleware;

use Closure;
use App\Exceptions\Channels\ChannelNotOwnedException;

class VerifyChannelOwnership
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->user()->is($request->channel->owner)) {
            return $next($request);
        }
        
        throw new ChannelNotOwnedException('channel_not_owned');
    }
}
