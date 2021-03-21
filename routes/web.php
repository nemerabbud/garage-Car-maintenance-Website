<?php

use App\Models\Category;
use App\Models\Garage;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('fill_count', function () {
    $services = \App\Models\Service::active()->get();
    $category = \App\Models\Category::active()->get();

    $category->each(function ($category) use ($services){

        $category->update(['count_services' => $services->where('category_id', $category->id)->count()]);

    });



});





Route::get('migrate', function () {
    \Illuminate\Support\Facades\Artisan::call('migrate');
});
Route::get('seed', function () {
    \Illuminate\Support\Facades\Artisan::call('db:seed');
});
Route::get('storage/link', function () {
    \Illuminate\Support\Facades\Artisan::call('storage:link');
});

//ADMIN AUTH ///
//Route::redirect('/', '/admin');


Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath']
    ], function () { //...

    Route::prefix('api')->group(function (){
        Route::get('payment-page/{finance}', 'PaymentController@api_payment_page')->name('api_payment_page');
        Route::get('payment/{finance}', 'PaymentController@api_payment');
        Route::get('payment/success/{finance}', 'PaymentController@api_payment_success')->name('api_success_payment_page');
        Route::get('payment/failed/{finance}', 'PaymentController@api_payment_failed')->name('api_failed_payment_page');

    });

    Route::get('payment-page/{finance}', 'PaymentController@payment_page')->name('payment_page');
    Route::get('payment/{finance}', 'PaymentController@payment');
    Route::get('payment/success/{finance}', 'PaymentController@payment_success')->name('success_payment_page');
    Route::get('payment/failed/{finance}', 'PaymentController@payment_failed')->name('failed_payment_page');



    /***
     * start website route
     */
    Route::get('/payment', 'PaymentController@payment');
    Route::get('/payment/success', 'PaymentController@success');
    Route::get('/payment/failed', 'PaymentController@failed');


    Route::get('password/reset', 'Website\Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request'); //done step 1
    Route::post('password/email', 'Website\Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email'); // step 2
    Route::get('password/reset/{token}', 'Website\Auth\ResetPasswordController@showResetForm')->name('password.reset');//done step 3
    Route::post('password/reset', 'Website\Auth\ResetPasswordController@reset')->name('password.update');//done step 4

    Route::namespace('Website')->name('website.')->group(function () {
        Route::get('/login', 'Auth\LoginController@showLoginForm');
        Route::post('/login', 'Auth\LoginController@login')->name('login');
        Route::get('/register', 'Auth\RegisterController@showRegistrationForm');
        Route::post('/register', 'Auth\RegisterController@register')->name('register');

        Route::get('/login', 'Auth\LoginController@showLoginForm');
        Route::post('/login', 'Auth\LoginController@login')->name('login');
//        Route::post('/reset_password', 'Auth\ForgotPasswordController@sendResetLinkEmail');
//        Route::post('/reset_password', 'Auth\ForgotPasswordController@send_email');

        Route::get('/garage_request','GarageRequestController@showGarageRequestForm')->name('create_garage_request');
        Route::post('/garage_request','GarageRequestController@create_garage_request');


        Route::middleware('AuthUser')->group(function () {
            Route::post('/logout', 'Auth\LoginController@logout')->name('logout');
            Route::put('/changePassword', 'UserController@changePassword')->name('change_password');
            Route::get('/my_orders', 'OrderController@my_orders')->name('my_orders')->middleware('WebActiveGarage');

            Route::middleware('AuthUser:garage')->group(function () {
                Route::post('/accept_order/{order}', 'OrderController@accept_order')->name('accept_order')->middleware('WebActiveGarage');
                Route::post('/reject_order/{order}', 'OrderController@reject_order')->name('reject_order')->middleware('WebActiveGarage');
                Route::put('/update_garage_profile', 'UserController@update_garage_profile')->name('update_garage_profile');
                Route::post('/active_garage', 'UserController@active_garage')->name('active_garage');


            });



            Route::middleware('AuthUser:customer')->group(function () { // start customer middleware
                Route::put('/update_profile', 'UserController@update_user_profile')->name('update_profile');
                Route::post('/order_rate', 'OrderController@order_rate')->name('order_rate');

                /// if  user is garage owner
                Route::get('/create_order/{garage}/{garage_slug}', 'OrderController@create_order_form')->name('create_order');
                Route::post('/create_order/{garage}/{garage_slug}', 'OrderController@create_order');

            });///end customer middleware

        });



        Route::get('/','AppController@home')->name('home');

        Route::get('contact_us','AppController@contact_us')->name('contact_us');
        Route::post('create_contact_us','AppController@create_contact_us')->name('create_contact_us');
        Route::get('pages/{page:name}', 'AppController@pages')->name('pages');
        Route::get('/categories', 'CategoryController@categories')->name('categories');
        Route::get('/category/{category_slug}', 'CategoryController@index')->name('category_garages');
        Route::get('/garage/{garage}/{garage_slug?}', 'GarageController@index')->name('garage_info');
        Route::get('/garages', 'GarageController@all_garages')->name('garages');

    });
    /***
     * end website route
     */


    Route::get('get_category_services/{category?}', 'Dashboard\CategoryController@get_category_services')->name('get_category_services');


    Route::prefix('admin')->group(function () {
        Route::redirect('/', '/admin/login');
        Route::get('/login', 'AdminAuth\LoginController@showLoginForm')->name('login');
        Route::post('/login', 'AdminAuth\LoginController@login')->name('admin.login');
        Route::post('/logout', 'AdminAuth\LoginController@logout')->name('admin.logout');


            Route::name('admin.')->namespace('Dashboard')->middleware(['auth:admin'])->group(function () {
                Route::post('/changeStatus/{model}', 'HomeController@changeStatus');


                Route::get('home', 'HomeController@home')->name('home');

                Route::get('edit_profile', 'AuthController@edit_profile_page')->name('edit_profile');
                Route::put('edit_profile', 'AuthController@edit_profile');
                Route::get('edit_password', 'AuthController@edit_password_page')->name('edit_password');
                Route::put('edit_password', 'AuthController@edit_password');

                /// start users  route
                Route::middleware('AdminPermission:users')->group(function () {

                    Route::resource('users', 'UserController')->except('show');
                    Route::get('/users/{user}/edit_password', 'UserController@edit_password')->name('users.edit_password');
                    Route::post('/users/{user}/edit_password', 'UserController@update_password')->name('users.edit_password');

                });
                /// end users route

                /// start plan  route
                Route::resource('plans', 'PlanController')->except('show', 'destroy')->middleware('AdminPermission:plans');

                /// end plan route
                /// start pages  route
                Route::resource('pages', 'PagesController')->except('show', 'destroy','create', 'store')->middleware('AdminPermission:pages');

                /// end pages route

                /// start admin route

                Route::resource('admins', 'AdminController')->except('show', 'destroy');
                Route::get('/admins/{admin}/edit_password', 'AdminController@edit_password')->name('admins.edit_password');
                Route::post('/admins/{admin}/edit_password', 'AdminController@update_password')->name('admins.edit_password');
                /// end admin route

                /// start category route
                Route::resource('categories', 'CategoryController')->except('show', 'destroy')->middleware('AdminPermission:categories');
                /// end category route

                /// start services route
                Route::resource('services', 'ServicesController')->except('show', 'destroy')->middleware('AdminPermission:services');
                /// end services route
                /// start advertisements route
                Route::resource('advertisements', 'AdvertisementsController')->except('show', 'destroy')->middleware('AdminPermission:advertisements');
                /// end advertisements route
                ///
                    /// start sliders route
                Route::resource('sliders', 'SliderController')->except('show', 'destroy')->middleware('AdminPermission:sliders');
                /// end sliders route

                Route::resource('carTypes', 'CarTypesController')->except('show')->middleware('AdminPermission:car-type');

                /// start contact  us


                Route::middleware('AdminPermission:contact-us')->group(function () {

                    Route::get('contacts', 'ContactUsController@index')->name('contacts.index');
                    Route::delete('contacts/{contactUs}', 'ContactUsController@destroy')->name('contacts.destroy');
                    Route::get('viewMessage/{contactUs}', 'ContactUsController@show')->name('contacts.show');

                });



                /// end  contact  us
                /// start notifications
                Route::resource('notifications', 'NotificationController')->except('show','edit', 'update')->middleware('AdminPermission:notifications');

                /// end  notifications

                /// start  garage  route

                Route::middleware('AdminPermission:garages')->group(function () {
                    Route::resource('garage', 'GarageController')->except('show', 'destroy');
                    Route::get('/garage/{user}/edit_password', 'GarageController@edit_password');
                    Route::get('/garage/{garage}/orders', 'GarageController@getOrders')->name('garage.getOrders');
                });


                /// end garage route
                /// start  garage-requests route
                Route::resource('garageRequests', 'GarageRequestController')->middleware('AdminPermission:garage-requests')->except('create', 'edit', 'destroy', 'store');

                /// end garage-requests route
                  /// start  orders route
                Route::resource('orders', 'OrderController')->middleware('AdminPermission:orders')->except('create', 'edit', 'update', 'destroy', 'store');

                /// end orders route

                //////
                Route::resource('settings', 'SettingController')->only('index', 'store')->middleware('AdminPermission:settings');


            });


    });


});
