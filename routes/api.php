<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});


Route::namespace('API')->group(function () {

    Route::post('reset_password', 'AuthController@reset_password');
    Route::get('get_pages', 'SettingController@get_pages');
    Route::get('get_setting', 'SettingController@get_setting');
    Route::get('get_ads', 'SettingController@get_ads');
    Route::get('get_plans', 'SettingController@get_plans');
    Route::get('get_sliders', 'SettingController@get_sliders');
    Route::get('get_categories', 'CategoryController@get_categories');
    Route::get('get_category_services/{category}', 'CategoryController@get_category_services');

    Route::post('create_contact_us', 'ContactUsController@create_contact_us');

    Route::middleware('APIUser')->group(function () {

        Route::post('logout', 'AuthController@logout');
        Route::post('update_fcm_token', 'AuthController@update_fcm_token');
        Route::get('get_notification', 'UserController@get_notification');
        Route::post('change_password', 'UserController@changePassword');


        Route::get('get_user_info', 'UserController@get_user_info');

        Route::get('garage/get_orders', 'OrderController@get_orders')->middleware('ActiveGarage');
        Route::get('garage/get_order_info/{order_id}', 'OrderController@get_order_info')->middleware('ActiveGarage');
        Route::post('login', 'AuthController@login')->withoutMiddleware(['APIUser']);

        Route::middleware('APIUser:customer')->prefix('customer')->group(function () {

            Route::post('register', 'AuthController@register')->withoutMiddleware(['APIUser', 'APIUser:customer']);
            Route::post('update_user_profile', 'UserController@update_user_profile');
            Route::get('get_all_garages', 'GarageController@get_all_garages')->withoutMiddleware(['APIUser', 'APIUser:customer']);
            Route::get('get_garage_info/{garage}', 'GarageController@get_garage_info')->withoutMiddleware(['APIUser', 'APIUser:customer']);
            Route::get('get_garage_reviews/{garage}', 'GarageController@get_garage_reviews')->withoutMiddleware(['APIUser', 'APIUser:customer']);
            Route::post('create_order', 'OrderController@create_order');
            Route::post('create_review', 'GarageController@create_review');


        });


        Route::prefix('garage')->middleware('APIUser:garage')->group(function () {
            Route::post('create_garage_request', 'GarageRequestController@create_garage_request')->withoutMiddleware(['APIUser', 'APIUser:garage']);

//            Route::post('login', 'AuthController@garage_login')->withoutMiddleware(['APIUser', 'APIUser:garage']);

            Route::get('get_user_garage_info', 'GarageController@get_user_garage_info');
            Route::post('active_garage/{plan}', 'GarageController@active_garage');
            Route::post('update_garage_profile', 'UserController@update_garage_profile');

            Route::post('order/{order_id}/accept', 'OrderController@accept_order')->middleware('ActiveGarage');
            Route::post('order/{order_id}/reject', 'OrderController@reject_order')->middleware('ActiveGarage');
            Route::get('get_car_types', 'SettingController@get_carTypes')->withoutMiddleware(['APIUser', 'APIUser:garage']);


        });


    });

    Route::get('customer/get_garage_in_services', 'GarageController@get_garage_to_services');


});
