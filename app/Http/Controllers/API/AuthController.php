<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserGarageResource;
use App\Http\Resources\UserResource;
use App\Models\Token;
use App\Notifications\SendNewPasswordResetRequest;
use App\User;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Password;

class AuthController extends SupperController
{

    use SendsPasswordResetEmails;

    public function __construct()
    {
        parent::__construct();


    }


    public function login(Request $request)
    {
        $response = $this->custom_validation($request->all(), User::LoginUserValidationRule);
        if ($response !== true) // if validation fail
            return $response;
        $data = $request->only('email', 'password');
        if (Auth::guard('web')->attempt($data)) {
            $user = Auth::guard('web')->user();


            if ($user->status !== "active") { // if normal user

                $massege = __('api.not_active');
                return response()->json(['status' => false, 'code' => 400, 'message' => $massege]);

            }

            Token::updateOrCreate([

                    'fcm_token' => $request->fcm_token]
                , [
                    'device_type' => $request->device_type,
                    'accept_notification' => $request->has('accept_notification') ? $request->accept_notification : true,
                    'lang' => app()->getLocale(),
                    'user_id' => $user->id
                ]);


            $token = $user->createToken('mobile');

            $user->access_token = $token->accessToken;
            //            return response(['status' => true, 'user' => new UserGarageResource($user)]);

            $message = __('api.ok');
            $code = 200;

            if ($user->role === 'garage' && $user->garage->status !== "active") {

                $message = __('api.your_subscribe_is_expired');
                $code = 201;

            }


            return response()->json(['status' => true, 'code' => $code, 'user' => new UserResource($user), 'message' => $message]);


        }


        $massege = __('api.wrong_email_or_password');
        return response()->json(['status' => false, 'code' => 400, 'message' => $massege]);
    }


    function register(Request $request)
    {

        $response = $this->custom_validation($request->all(), User::NewUserValidationRule);
        if ($response !== true)
            return $response;


        try {
            DB::beginTransaction();
            $data = $request->only('email', 'name', 'password', 'mobile');
            $data['role'] = 'customer';

            $user = User::create($data);

            Token::updateOrCreate(
                ['fcm_token' => $request->fcm_token],
                [
                    'device_type' => $request->device_type,
                    'accept_notification' => $request->has('accept_notification') ? $request->accept_notification : true,
                    'lang' => app()->getLocale(),
                    'user_id' => $user->id
                ]
            );

            $token = $user->createToken('mobile');

            $user->access_token = $token->accessToken;
            DB::commit();

            $massege = __('api.ok');


            return response()->json(['status' => true, 'code' => 200, 'user' => new UserResource($user), 'message' => $massege]);


        } catch (\Exception $exception) {
            DB::rollBack();
            $massege = __('api.whoops');
            return response()->json(['status' => false, 'code' => 400, 'message' => $massege]);
//            return response(['status' => false, 'errors' => $exception->getMessage()]);

        }


    }


    function update_fcm_token(Request $request)
    {

        $response = $this->custom_validation($request->all(), Token::FCMValidationRule);
        if ($response !== true)
            return $response;


        Token::updateOrCreate(
            ['fcm_token' => $request->fcm_token],
            [
                'device_type' => $request->device_type,
                'accept_notification' => $request->has('accept_notification') ? $request->accept_notification : true,
                'lang' => app()->getLocale(),
                'user_id' => \auth()->id()
            ]
        );
        $massege = __('api.ok');


        return response()->json(['status' => true, 'code' => 200, 'message' => $massege]);


    }

    function logout()
    {
        Token::where('user_id', \auth()->id())->delete();
        Auth::user()->token()->revoke();
        $message = 'logged out successfully';
        return response()->json(['status' => true, 'code' => 200,
            'message' => $message]);

    }


    public function sendResetLinkEmail(Request $request)
    {
        $this->validateEmail($request);

        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.
        $response = $this->broker()->sendResetLink(
            $this->credentials($request)
        );

        return $response == Password::RESET_LINK_SENT
            ? $this->sendResetLinkResponse($request, $response)
            : $this->sendResetLinkFailedResponse($request, $response);
    }
    function reset_password(Request $request)
    {


        $response = $this->custom_validation($request->all(), ['email' => 'required|email']);
        if ($response !== true)
            return $response;



        $user = User::where('email', $request->email)->first();
        if (empty($user)) {
            return response(['status' => false, 'code' => 200, 'message' => trans('api.not_found')]);
        } else {


            $response = $this->broker()->sendResetLink(
                $this->credentials($request)
            );

            return $response == Password::RESET_LINK_SENT
                ? response(['status' => true, 'code' => 200, 'message' => trans($response)])
                : response(['status' => false, 'code' => 400, 'message' => trans($response)]);


        }


    }
}
