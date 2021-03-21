<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class AuthUserMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next ,$role="")
    {

        if ( Auth::guard('web')->check()  && (

                empty($role) ||
                Auth::guard('web')->user()->role == $role
            )) {

            return $next($request);

        }

        abort(403);

    }
}
