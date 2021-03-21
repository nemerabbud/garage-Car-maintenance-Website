<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="{{setting_value('description')}}"
          name="description"/>
    <title>{{setting_value('title')}} - @yield('title')</title>

    <!-- Stylesheets -->
    <link href="{{website_assets('/')}}/css/bootstrap.min.css" rel="stylesheet">
    <link href="{{website_assets('/')}}/css/font-awesome.css" rel="stylesheet">
    <link href="{{website_assets('/')}}/css/themify-icons.css" rel="stylesheet">
    <link href="{{website_assets('/')}}/css/owl.carousel.min.css" rel="stylesheet">
    <link href="{{website_assets('/')}}/css/owl.theme.default.min.css" rel="stylesheet">

    <link href="{{website_assets('/')}}/css/slick.css" rel="stylesheet">

    <link href="{{website_assets('/')}}/css/animate.css" rel="stylesheet" type="text/css"/>
    <link href="{{website_assets('/')}}/css/style.css" rel="stylesheet">

    <!-- Responsive -->
    <link href="{{website_assets('/')}}/css/responsive.css" rel="stylesheet">

    <script src="{{website_assets('/')}}/js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="mobile-menu">
    <div class="menu-mobile">
        <div class="brand-area">
            <a href="index.html">
                <img src="{{website_assets('/')}}/images/logo.svg" alt="logo">
            </a>
        </div>
        <div class="mmenu">
            <ul>

                <li><a href="{{url('/')}}">@lang('website.home')</a></li>
                <li><a href="{{route('website.garages')}}">@lang('website.garages')</a></li>
                <li><a href="{{route('website.pages','about_us')}}">@lang('website.about_us')</a></li>
                <li><a href="{{route('website.contact_us')}}">@lang('website.contact')</a></li>
            </ul>
        </div>
    </div>
    <div class="m-overlay"></div>
</div>
<!--End Mobile-menu-->

<div class="main-wrapper">


    <header id="header" class="{{request()->routeIs('website.home')?"":"header-page"}} ">
        <div class="header-bottom">
            <div class="container">
                <div class="logo_site">
                    <a href="{{url('/')}}"><img src="{{website_assets('/')}}/images/logo.svg" alt="logo"
                                              class="img-responsive"></a>
                </div>
                <ul class="main_menu clearfix">
                    <li><a href="{{url('/')}}">@lang('website.home')</a></li>
                    <li><a href="{{route('website.garages')}}">@lang('website.garages')</a></li>
                    <li><a href="{{route('website.pages','about_us')}}">@lang('website.about_us')</a></li>
                    <li><a href="{{route('website.contact_us')}}">@lang('website.contact')</a></li>
                </ul>
                <button type="button" class="hamburger is-closed">
                    <span class="hamb-top"></span>
                    <span class="hamb-middle"></span>
                    <span class="hamb-bottom"></span>
                </button>
                <div class="he_content_right clearfix">
                    <ul class="user_cart clearfix">

                        @if(auth()->check())
                            <li class="m_prof dropdown">
                                <a data-toggle="dropdown">
                                    <img class="auth_user_image" src="{{auth()->user()->image_url}}" alt="shipping">
                                    <small class="auth_user_name">{{auth()->user()->name}} </small>
                                </a>
                                <div class="dropdown-menu">
                                    <div class="dt-pro">
                                        <figure>
                                            <img class="auth_user_image" src="{{auth()->user()->image_url}}"/>
                                        </figure>
                                        <div class="title-pro">
                                            <h6 class="auth_user_name">{{auth()->user()->name}}</h6>
                                            <p class="auth_user_email">{{auth()->user()->email}}</p>
                                        </div>
                                    </div>
                                    <ul class="option-pro">
                                        <li><a href="{{route('website.my_orders')}}"><img
                                                    src="{{website_assets('/')}}/images/order.svg"/> @lang('website.myorder')
                                            </a>
                                        </li>
                                        <li><a class="change-password-action" href="#"><img
                                                    src="{{website_assets('/')}}/images/locked-padlock.svg"/> @lang('website.changePassword')
                                            </a></li>
                                        <li><a class="edit_profile_action" href="#">
{{--                                                <img                    src="{{website_assets('/')}}/images/user.svg"/>--}}
                                                <i class="fa fa-pencil text-danger pr-3"></i>

                                                @lang('website.Edit your profile')
                                            </a></li>

                                        @if(auth()->user()->role === 'garage' && auth()->user()->garage->status === 'not_active' )
                                        <li><a  data-toggle="modal" data-target="#active-garage">
                                                <i class="fa fa-dollar text-danger pr-3"></i>
                                                @lang('website.activate')
                                            </a></li>
                                        @endif
                                        <li>
                                            <a href="{{ route('website.logout') }}"
                                               onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><img
                                                    src="{{website_assets('/')}}/images/logout.svg"/> @lang('website.logout')
                                            </a>
                                        </li>
                                    </ul>

                                    <form id="logout-form" action="{{ route('website.logout') }}" method="POST"
                                          class="d-none">
                                        @csrf
                                    </form>
                                </div>

                            </li>
                        @else
                            <li>
                                <a
                                    href="{{ route('website.login') }}">
                                    @lang('website.login')
                                </a>
                            </li>
                            <li>
                                <a
                                    href="{{ route('website.create_garage_request') }}">
                                    @lang('website.create_garage')
                                </a>
                            </li>
                        @endif


                        @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                            @if(app()->getLocale() !== $localeCode)

                                <li>
                                    <a rel="alternate" hreflang="{{ $localeCode }}"
                                       href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}">
                                        {{ $properties['native'] }}
                                    </a>
                                </li>
                            @endif
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!--End header-->

    @if(session()->has('success')||session()->has('error')||count($errors->all()) > 0)



            @if(session()->has('success'))

            <div class="alert alert-success alert-dismissible fade show m-0" role="alert" style="z-index: 20;">
                @if(session()->has('success'))
                    <span> {{ session('success') }} </span>
                @endif
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            @endif
            @if(session()->has('error'))

                    <div class="alert alert-warning alert-dismissible fade show m-0" role="alert" style="z-index: 20;">
                        @if(session()->has('error'))
                            <span> {{ session('error') }} </span>
                        @endif
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

            @endif

            @if(count($errors->all()) > 0)
                <div class="alert alert-danger">
                    <ol>
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ol>
                </div>
            @endif
    @endif



    @yield('content')

    @if(auth()->check())
        @if(auth()->user()->role === 'garage' && auth()->user()->garage->status === 'not_active' )

        <div class="modal fade" id="active-garage" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-change-profile"
                          action="{{route('website.active_garage')}}"
                          method="post"
                          enctype="multipart/form-data">
                        @csrf

                        <div class="pd-form">


                                <div class="form-group">
                                    <select class="form-control " name="plan_id" required
                                            placeholder="@lang('website.plans')">
                                        @foreach(\App\Models\Plan::active()->get() as $plan)
                                            <option
                                                value="{{$plan->id}}" {{auth()->user()->garage->plan_id == $plan->id ?"selected":""}}>{{$plan->title}}</option>

                                        @endforeach

                                    </select>
                                </div>



                            <div class="form-group alert_text">

                            </div>

                            <div class="form-group">
                                <button class="btn-log"><span class="fa fa-save"></span> @lang('website.activate')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        @endif
        <div class="modal fade" id="change-profile" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-change-profile"
                          action="{{auth()->user()->role === 'customer'?route('website.update_profile'):route('website.update_garage_profile')}}"
                          method="post"
                          enctype="multipart/form-data">
                        @csrf
                        @method('put')
                        <div class="head-form text-center">
                            <div class="title">
                                <p>@lang('website.Edit your profile')</p>
                            </div>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="pd-form">
                            <div class="avatar-upload">
                                <div class="avatar-edit">
                                    <input type='file' id="imageUpload" name="image" accept=".png, .jpg, .jpeg"/>
                                    <label for="imageUpload"></label>
                                </div>
                                <div class="avatar-preview">
                                    <div id="imagePreview" class="auth_user_image"
                                         style="background-image: url({{auth()->user()->image_url}})">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control auth_user_name"
                                       placeholder="@lang('website.name')" name="name"
                                       value="{{auth()->user()->name}}"/>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control auth_user_email"
                                       placeholder="@lang('website.email')" name="email"
                                       value="{{auth()->user()->email}}"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control auth_user_mobile"
                                       placeholder="@lang('website.mobile')" name="mobile"
                                       value="{{auth()->user()->mobile}}"/>
                            </div>
                            @if(auth()->user()->role ==="garage")
                            <div class="form-group">
                                <select class="form-control category_id_modal" name="category_id" required
                                        placeholder="@lang('website.categories')">
                                    @foreach(\App\Models\Category::all() as $category)
                                        <option
                                            value="{{$category->id}}" {{auth()->user()->garage->categor_id == $category->id ?"selected":""}}>{{$category->title}}</option>

                                    @endforeach

                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control "
                                       placeholder="@lang('website.garage_name_ar')" name="ar[name]"
                                       value="{{auth()->user()->garage->translate('ar')->name}}"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control "
                                       placeholder="@lang('website.garage_name_en')" name="en[name]"
                                       value="{{auth()->user()->garage->translate('en')->name}}"/>
                            </div>  <div class="form-group">
                                <input type="text" class="form-control "
                                       placeholder="@lang('website.address_ar')" name="ar[address]"
                                       value="{{auth()->user()->garage->translate('ar')->address}}"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control "
                                       placeholder="@lang('website.address_en')" name="en[address]"
                                       value="{{auth()->user()->garage->translate('en')->address}}"/>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control"
                                          placeholder="@lang('website.description_ar')" name="ar[description]"
                                >{{auth()->user()->garage->translate('ar')->description}}</textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control"
                                          placeholder="@lang('website.description_en')" name="en[description]"
                                >{{auth()->user()->garage->translate('en')->description}}</textarea>
                            </div>

                            <div class="form-group">
                                <input type="file" name="images[]" id="gallery-photo-add" class="form-control inputfile"
                                       multiple="">
                                <label for="gallery-photo-add">
                                    <span class="archive-name">@lang('images')</span>
                                    <span class="btn-inputfile"><i class="fa fa-image"></i></span>
                                </label>
                                <div class="gallery">
                                    @foreach(auth()->user()->garage->images as $image)
                                        <img src="{{$image->image_url}}">
                                    @endforeach

                                </div>
                            </div>
                            <div class="services-res-log">
                                <div class="sec-head">
                                    <h3><img
                                            src="{{website_assets('/')}}/images/cogwheel.svg"> @lang('website.services')
                                        :</h3>
                                </div>
                                <ul class="Choose-pro services_list_modal" id="services_list_modal">

                                    @php
                                        $services = auth()->user()->garage->category->services;
                                        $select_services_ids = auth()->user()->garage->services->pluck('id')->toArray();
                                    @endphp

                                    @foreach($services as $service)
                                        <li>
                                            <div class="inputGroup">
                                                <input id="checkbox_services{{$service->id}}" name="services[]"
                                                       type="checkbox"
                                                       value="{{$service->id}}" {{in_array($service->id, $select_services_ids)?"checked":""}}>
                                                <label for="checkbox_services{{$service->id}}"><img
                                                        src="{{$service->image_url}}"> <span>{{$service->title}}</span></label>
                                            </div>
                                        </li>

                                    @endforeach

                                </ul>
                            </div>
                                <div class="services-res-log">
                                <div class="sec-head">
                                    <h3><img
                                            src="{{website_assets('/')}}/images/cogwheel.svg"> @lang('website.Types of cars')
                                        :</h3>
                                </div>
                                <ul class="Choose-pro " >

                                    @php

                                        $select_car_types = auth()->user()->garage->carTypes->pluck('id')->toArray();
                                    @endphp

                                    @foreach(\App\Models\CarType::all() as $carType)
                                        <li>
                                            <div class="inputGroup">
                                                <input id="checkbox_cartype{{$carType->id}}" name="car_types[]"
                                                       type="checkbox"
                                                       value="{{$carType->id}}" {{in_array($carType->id, $select_car_types)?"checked":""}}>
                                                <label for="checkbox_cartype{{$carType->id}}"> <span>{{$carType->title}}</span></label>
                                            </div>
                                        </li>

                                    @endforeach

                                </ul>
                            </div>


                            @endif

                            <div class="form-group alert_text">

                            </div>

                            <div class="form-group">
                                <button class="btn-log"><span class="fa fa-save"></span> @lang('website.save')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div class="modal fade" id="change-password" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-change-password" method="post">
                        @method('put')
                        @csrf
                        <div class="head-form text-center">
                            <div class="title">
                                <p>@lang('website.changePassword')</p>
                            </div>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="pd-form">
                            <div class="form-group">
                                <input type="password" required class="form-control"
                                       placeholder="@lang('website.oldPassword')" name="old_password"/>
                            </div>
                            <div class="form-group">
                                <input type="password" required class="form-control"
                                       placeholder="@lang('website.newPassword')" name="password"/>
                            </div>
                            <div class="form-group">
                                <input type="password" required class="form-control"
                                       placeholder="@lang('website.confirmPassword')" name="confirm_password"/>
                            </div>
                            <p class="form-group alert_text">
                            </p>

                            <div class="form-group">
                                <button class="btn-log" type="submit"><span class="fa fa-save"></span> @lang('website.save')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endif
    <footer id="footer">
        <div class="top-footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="logo-ft">
                            <img src="{{website_assets('/')}}/images/logo.svg" alt=""/>
                        </div>
                    </div>
                    <div class="col-lg-2 col-sm-6">
                        <div class="f-box">
                            <ul class="f-menu">
                                <li><a href="{{url('/')}}">@lang('website.home')</a></li>
                                <li><a href="">@lang('website.garages')</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="f-box">
                            <ul class="f-menu">
                                <li><a href="{{route('website.pages','about_us')}}">@lang('website.about_us')</a></li>
                                <li><a href="{{route('website.pages','privacy_policy')}}">@lang('website.privacy')</a></li>
                                <li><a href="{{route('website.pages','terms_of_use')}}">@lang('website.terms')</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="f-box">
                            <h2>@lang('website.contact')</h2>
                            <ul class="social-media">
                                <li><a href="{{setting_value('facebook')}}"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="{{setting_value('twitter')}}"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="mailto:{{setting_value('email')}}"><i class="fa fa-google"></i></a></li>
                                <li><a href="{{setting_value('instagram')}}"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer">
            <div class="container">
                <p class="copyright">
                    © all rights reserved. Weenah
                </p>
            </div>
        </div>
    </footer>
    <!--End Footer-->

</div>
<!--main-wrapper-->


<script src="{{website_assets('/')}}/js/popper.min.js"></script>
<script src="{{website_assets('/')}}/js/bootstrap.min.js"></script>
<script src="{{website_assets('/')}}/js/owl.carousel.min.js"></script>
<script src="{{website_assets('/')}}/js/wow.js"></script>
<script src="{{website_assets('/')}}/js/slick.js"></script>

<script src="{{website_assets('/')}}/js/script.js"></script>


<script>
    $(document).ready(function () {

        new WOW().init();


        @if(auth()->check())

        // Multiple images preview in browser
        function readURLMultiple(input, placeToInsertImagePreview) {

            if (input.files) {
                var filesAmount = input.files.length;

                for (i = 0; i < filesAmount; i++) {
                    var reader = new FileReader();

                    reader.onload = function (event) {
                        $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
                    }

                    reader.readAsDataURL(input.files[i]);
                }
            }

        };

        $('#gallery-photo-add').on('change', function () {
            readURLMultiple(this, '.gallery');
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                    $('#imagePreview').hide();
                    $('#imagePreview').fadeIn(650);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }


        $("#imageUpload").change(function () {
            readURL(this);
        });

        $('.change-password-action').on('click', function () {
            // $('#change-password form').reset();
            $('#change-password [type=password]').val('');
            $('#change-password').find('.alert_text').text('');
            $('#change-password').modal('show');
        });

        $('.edit_profile_action').on('click', function () {

            $('#change-profile').find('.alert_text').text('');
            $('#change-profile').modal('show');
        });
        $('select.category_id_modal').on('change', function () {

            $val = $(this).val();

            $.get("{{url('get_category_services')}}"+'/' + $val, function (response) {
                $items = "";

                response.services.forEach(function (service) {
                    $items +=
                        '<li>' +
                        '<div class="inputGroup">' +
                        '<input id="checkbox' + service.id + '" name="services_ids[]" type="checkbox" value="' + service.id + '">' +
                        '<label for="checkbox' + service.id + '"><img src="' + service.image + '"> <span>' + service.title + '</span></label>\n' +
                        '</div>' +
                        '</li>';

                });
                $('#services_list_modal').html($items)

            });

        });


        $(document).on('submit', '#change-password form', function (event) {

            event.preventDefault();
            $this = $(this);

            $this.find('button[type=submit]').attr('disabled', 'disabled');
            $this.find('button[type=submit]').append('<i class="fa fa-spinner fa-spin"></i>');

            $.post('{{route('website.change_password')}}', $this.serialize(), function (response) {


                $this.find('button[type=submit]').find('.fa-spinner').remove();

                $this.find('button[type=submit]').attr('disabled', false);
                $this.find('.alert_text').addClass('text-success').removeClass('text-danger').text(response.message);

                if (response.status == true) {
                    setTimeout(function () {

                        $('#change-password').modal('hide');

                    }, 5000);
                } else {

                }


            }).fail(function (response) {

                console.log('failed', response.responseJSON);
                $this.find('.alert_text').removeClass('text-success').addClass('text-danger').text(response.responseJSON.message);

                $this.find('button[type=submit]').find('.fa-spinner').remove();
                $this.find('button[type=submit]').attr('disabled', false)
            });


            // $('#change-password form').reset();
            // $('#change-password').modal('show');
        });


        $(document).on('submit', '#change-profile form', function (event) {
            event.preventDefault();
            var $this = $(this);

            $this.find('button[type=submit]').attr('disabled', 'disabled');
            $this.find('button[type=submit]').append('<i class="fa fa-spinner fa-spin"></i>');

            let posted_data = new FormData(this); //$(this).serialize();//new FormData(this),
            let url = $this.attr('action');

            $.ajax({
                url: url,
                data: posted_data,
                processData: false,
                contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
                type: 'POST',
                success: function (response) {

                    $this.find('button[type=submit]').find('.fa-spinner').remove();
                    $this.find('button[type=submit]').attr('disabled', false);
                    $this.find('.alert_text').addClass('text-success').removeClass('text-danger').text(response.message);

                    setTimeout(function () {

                        $('#change-profile').modal('hide');

                    }, 5000);

                    $('.auth_user_name').text(response.user.name);
                    $('.auth_user_email').text(response.user.email);
                    $('.auth_user_mobile').text(response.user.mobile);
                    $('img.auth_user_image').attr('src', response.user.image_url);
                    $('#edit-profile').modal('hide');
                },
                fail: function (response, exception) {
                    console.log('failed', response.responseJSON);
                    $this.find('.alert_text').removeClass('text-success').addClass('text-danger').text(response.responseJSON.message);

                    $this.find('button[type=submit]').find('.fa-spinner').remove();
                    $this.find('button[type=submit]').attr('disabled', false)


                }
            });


        });


        @endif


    })

</script>

@stack('js')


</body>
</html>
