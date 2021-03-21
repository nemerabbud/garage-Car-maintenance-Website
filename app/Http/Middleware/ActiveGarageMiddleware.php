<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class ActiveGarageMiddleware

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

        $user  = auth()->user();
        if ( $user->role === 'garage' && $user->garage->status === 'not_active') {
            return redirect()->to('/')->with('error','please activate your account');//response(['status' => false, 'code' => 403, 'message' => __('api.not_access')]);

        }
        return $next($request);


    }
}
