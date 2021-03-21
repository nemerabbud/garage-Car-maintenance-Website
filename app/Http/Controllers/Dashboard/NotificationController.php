<?php

namespace App\Http\Controllers\Dashboard;


use App\Models\Notification;
use App\Models\Notify;
use Illuminate\Http\Request;

use App\User;

use App\Models\Token;

//use Mail;


class NotificationController extends SupperController
{

    public function __construct()
    {
        parent::__construct();
        $this->path = "admin.notifications";
    }

    public function index(Request $request)
    {
        $items = Notification::query()->orderBy('id', 'Desc')->get();

        return view("{$this->path}.home", [
            'items' => $items,
        ]);
    }


    public function create()
    {

        return view("{$this->path}.create");
    }

    public function store(Request $request)
    {


        $data = $request->only('ar', 'en');

        if ($request->user_type === 'garage_owners')
            $users = User::where('role', 'garage')->get();
        elseif ($request->user_type === 'customers')
            $users = User::where('role', 'customer')->get();
        else
            $users = User::all();


        $users_ids = $users->pluck('id')->toArray();

        $notifications_user = [];
        foreach ($users_ids as $id) {
            $notify = $data;
            $notify['user_id'] = $id;
            $notifications_user [] = $notify;

            Notify::create($notify);

        }


        $tokens = Token::acceptNotification()->whereIn('user_id', $users_ids)->get();


        Notification::create($data);


//        Notification::send($users, new AdminNotification($data)); // send admin notification to selected users

        /// helper function to send many notification according to device language
        sendNotificationsToManyLanguageDevices($tokens, $data, 1); // order notification


        return redirect()->back()->with('status', __('cp.create'));
    }


        public function destroy($id)
        {
            $notifications = Notification::query()->findOrFail($id);
            if ($notifications->delete()) {
                return 'success';
            }
            return 'fail';
        }


}
