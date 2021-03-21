<?php


use App\Models\Language;
use App\Models\Setting;
use App\User;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;



function settings()
{
    $minutes = 24;
    return Cache::remember('settings', $minutes, function () {

        return Setting::first();
    });


}

function setting_value($key)
{

    $settings = settings();
//    $setting = Setting::where('key', $key)->first();
//
//    if (in_array($key, Setting::files_name) && !empty($setting) && !empty($setting->value))
//        return image_storage_url($setting->value);


    return $settings[$key]??null;
}


/*
function distance($lat1, $lon1, $lat2, $lon2, $unit='K') {
//    if (empty($lat1) || empty($lat2) || empty($lon1) || empty($lon2))
//        return  0 ;


    if (($lat1 == $lat2) && ($lon1 == $lon2)) {
        return 0;
    }
    else {
        $theta = $lon1 - $lon2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;
        $unit = strtoupper($unit);

        if ($unit === "K") {
            return ($miles * 1.609344);
        } else if ($unit === "N") {
            return ($miles * 0.8684);
        } else {
            return $miles;
        }
    }
}*/

function storeImage($image, $folder_name, $old_image = null)
{

    if (is_file($image)) {
        @Storage::delete($old_image);
        @Storage::delete('/thumbnail/' . $old_image);
        $new_image = $image->store($folder_name);
        $thumbnailImage = \Intervention\Image\Facades\Image::make($image);
        $thumbnailPath = storage_path('app/public') . '/thumbnail/';

        /// create folder if not  exist
        Storage::makeDirectory('thumbnail/' . $folder_name, 0775, true);

        $thumbnailImage->resize(800, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $thumbnailImage->save($thumbnailPath . $new_image);


    } else
        $new_image = $image;


    return $new_image;

}

function post($url, $data, $headerArray = array())
{
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    if (array() === $headerArray)
        curl_setopt($curl, CURLOPT_HTTPHEADER, ["Content-type:application/json;charset='utf-8'", "Accept:application/json"]);

    $output = curl_exec($curl);
    curl_close($curl);
    return $output;
}

function can($permission)
{
    //  $user = auth()->user();

    $userCheck = auth()->guard('admin')->check();
    $user = '';

    if ($userCheck == false) {
        return redirect('admin/login');
    } else {
        $user = auth()->guard('admin')->user();
    }


    /*
        $users = User::where('status', 1)->get();
        $users->map(function ($item, $key) {
            return ucfirst($item->name);
        });
        dd($users);
    */


    if ($user->id == 1) {
        return true;
    }

//Cache::forget('permissions_' . $user->id);

    $minutes = 5;


    $permissions = Cache::remember('permissions_' . $user->id, $minutes, function () use ($user) {

        return explode(',', $user->permission->permission);

    });

//    dd([$permissions,array_flatten($permissions)]);
//    $permissions = array_flatten($permissions);
    return in_array($permission, $permissions);

    //@if(can('reservations.panel'))
}

function admin_assets($dir)
{
    return url('/admin_assets/assets/' . $dir);
}

function website_assets($dir)
{
    return url('/website/' . $dir);
}

function image_storage_url($dir)
{
    return url('/storage/' . $dir);
}

function image_url($dir)
{
    return url('/images/' . $dir);
}

function getLocal()
{
    return app()->getLocale();
}

function mainResponse($status, $message, $data, $code, $key, $validator)
{
    try {
        $result['status'] = $status;
        $result['code'] = $code;
        $result['message'] = $message;

        if ($validator && $validator->fails()) {
            $errors = $validator->errors();
            $errors = $errors->toArray();
            $message = '';
            foreach ($errors as $key => $value) {
                $message .= $value[0] . ',';
            }
            $result['message'] = $message;
            return response()->json($result, $code);
        } elseif (!is_null($data)) {


            if ($status) {
                if ($data != null && array_key_exists('data', $data)) {
                    $result[$key] = $data['data'];
                } else {
                    $result[$key] = $data;
                }
            } else {
                $result[$key] = $data;
            }
        }
        return response()->json($result, $code);
    } catch (Exception $ex) {
        return response()->json([
            'line' => $ex->getLine(),
            'message' => $ex->getMessage(),
            'getFile' => $ex->getFile(),
            'getTrace' => $ex->getTrace(),
            'getTraceAsString' => $ex->getTraceAsString(),
        ], $code);
    }
}

function convertAr2En($string)
{
    $persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    $arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    $num = range(0, 9);
    $convertedPersianNums = str_replace($persian, $num, $string);
    $englishNumbersOnly = str_replace($arabic, $num, $convertedPersianNums);
    return $englishNumbersOnly;
}


function random_number($digits)
{
    return str_pad(rand(0, pow(10, $digits) - 1), $digits, '0', STR_PAD_LEFT);
}

function type()
{
    return [__('common.store'), __('common.product'), __('common.url')];
}

function position()
{
    return [__('common.site'), __('common.mobile')];
}

function typeArrive()
{


    return [
        '1' => __('print.delivery'),
        '2' => __('print.pickup'),
        '3' => __('print.both')
    ];

}

function optionArrive()
{


    return [

        '1' => __('print.have_delivery_team'),
        '2' => __('print.link_delivery_company'),
        '3' => __('print.both')
    ];

}


/**
 * $msg_type 1 => msg
 * $msg_type 2 => order
 *
 * accepted format  $messages as = [
 * en =>[
 * 'title'=>'notify title en',
 * 'message'=>'notify message en',
 * ],
 * ar =>[
 * 'title'=>'notify title ar',
 * 'message'=>'notify message ar',
 * ],
 * ......etc ]
 **/
function sendNotificationsToManyLanguageDevices($tokens, $messages, $msg_type = 1 ,$target_id = null)
{
    if ($tokens->count() > 0) {
        $languages = Language::pluck('lang'); // fetch language
        foreach ($languages as $lang) {
            $notify_data = $messages[$lang]; ///send token to devices according  to device language
            $tokens->where('lang', $lang)->pluck('fcm_token')->chunk(900)->each(function ($items) use ($notify_data, $msg_type,$target_id) {
                if (count($items) > 0)
                    sendNotificationToUsers($items->toArray(), $notify_data['message'], $msg_type, $target_id, $notify_data['title']);
            });


        }//end for each
    }/// end if statement

}// end function

function sendNotificationToUsers($tokens, $message, $msgType = "1", $target_id = null, $title = "Weenah")
{
    try {
        $headers = [
            'Authorization: key=' . env("FireBaseKey"),
            'Content-Type: application/json'
        ];

        if (!empty($tokens)) {

            $data = [
                "registration_ids" => $tokens,
                "data" => [
                    'body' => $message,
                    'type' => "notify",
                    'title' => $title,
                    'target_id' => $target_id,
                    'msgType' => $msgType,// 1=>msg , 2=>order
                    'badge' => 1,
                    "click_action" => 'FLUTTER_NOTIFICATION_CLICK',
                    'icon' => 'myicon',//Default Icon
                    'sound' => 'mySound'//Default sound
                ],
                "notification" => [
                    'body' => $message,
                    'type' => "notify",
                    'title' => $title,
                    'target_id' => $target_id,
                    'msgType' => $msgType,// 1=>msg , 2=>order
                    'badge' => 1,
                    "click_action" => 'FLUTTER_NOTIFICATION_CLICK',
                    'icon' => 'myicon',//Default Icon
                    'sound' => 'mySound'//Default sound
                ]
            ];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
            $result = curl_exec($ch);
            curl_close($ch);
            // $resultOfPushToIOS = "Done";
            //   return $result; // to check does the notification sent or not
        }
        //   return $resultOfPushToIOS." ".$resultOfPushToAndroid;
        //    return $result;
    } catch (\Exception $ex) {
        return $ex->getMessage();
    }


}

function slugURL($title)
{
    $WrongChar = array('@', '؟', '.', '!', '?', '&', '%', '$', '#', '{', '}', '(', ')', '"', ':', '>', '<', '/', '|', '{', '^');

    $titleNoChr = str_replace($WrongChar, '', $title);
    $titleSEO = str_replace(' ', '-', $titleNoChr);
    return $titleSEO;
}

//function make_slug($string, $separator = '-')
//{$string = trim($string);
//    $string = mb_strtolower($string, 'UTF-8');
//
//    // Make alphanumeric (removes all other characters)
//    // this makes the string safe especially when used as a part of a URL
//    // this keeps latin characters and Persian characters as well
//    $string = preg_replace("/[^a-z0-9_\s-ءاآؤئبپتثجچحخدذرزژسشصضطظعغفقكگلمنوی]/u", '', $string);
//
//    // Remove multiple dashes or whitespaces or underscores
//    $string = preg_replace("/[\s-_]+/", ' ', $string);
//
//    // Convert whitespaces and underscore to the given separator
//    $string = preg_replace("/[\s_]/", $separator, $string);
//
//    return $string;
//}
function pointInPolygon($point, $polygon)
{
    //  pointOnVertex = true;

    // Transform string coordinates into arrays with x and y values
    $point = pointStringToCoordinates($point);
    $vertices = array();
    foreach ($polygon as $vertex) {
        $vertices[] = pointStringToCoordinates($vertex);
    }

    // Check if the point sits exactly on a vertex
    if (pointOnVertex($point, $vertices) == true) {
        return true;
    }

    // Check if the point is inside the polygon or on the boundary
    $intersections = 0;
    $vertices_count = count($vertices);

    for ($i = 1; $i < $vertices_count; $i++) {
        $vertex1 = $vertices[$i - 1];
        $vertex2 = $vertices[$i];
        if ($vertex1['y'] == $vertex2['y'] and $vertex1['y'] == $point['y'] and $point['x'] > min($vertex1['x'], $vertex2['x']) and $point['x'] < max($vertex1['x'], $vertex2['x'])) { // Check if point is on an horizontal polygon boundary
            return true;
        }
        if ($point['y'] > min($vertex1['y'], $vertex2['y']) and $point['y'] <= max($vertex1['y'], $vertex2['y']) and $point['x'] <= max($vertex1['x'], $vertex2['x']) and $vertex1['y'] != $vertex2['y']) {
            $xinters = ($point['y'] - $vertex1['y']) * ($vertex2['x'] - $vertex1['x']) / ($vertex2['y'] - $vertex1['y']) + $vertex1['x'];
            if ($xinters == $point['x']) { // Check if point is on the polygon boundary (other than horizontal)
                return true;
            }
            if ($vertex1['x'] == $vertex2['x'] || $point['x'] <= $xinters) {
                $intersections++;
            }
        }
    }
    // If the number of edges we passed through is odd, then it's in the polygon.
    if ($intersections % 2 != 0) {
        return true;
    } else {
        return false;
    }
}

function pointOnVertex($point, $vertices)
{
    foreach ($vertices as $vertex) {
        if ($point == $vertex) {
            return true;
        }
    }

}

function pointStringToCoordinates($pointString)
{
    $coordinates = explode(" ", $pointString);
    return array("x" => $coordinates[0], "y" => $coordinates[1]);
}




