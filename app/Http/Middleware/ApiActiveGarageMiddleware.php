<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class ApiActiveGarageMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        $user =Auth::guard('api')->user();
        if ( $user->role === 'garage' && $user->garage->status === 'not_active') {
            return response(['status' => false, 'code' => 201, 'message' => __('api.not_access')]);

        }
        return $next($request);


    }
}
