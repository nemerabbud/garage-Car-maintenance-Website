<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class APIUserMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next, $role = "")
    {

        if (Auth::guard('api')->user() && (

                ($role === "" ) ||
                Auth::guard('api')->user()->role == $role
            )) {
            return $next($request);
        }

        return response(['status' => false, 'code' => 403, 'message' => __('api.not_access')]);
    }
}
