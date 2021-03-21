@extends('website.layouts.websiteLayouts')
@section('title',__('website.signin'))

@section('content')
    <section class="section-site-page pd100 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="container">
            <div class="content-sign">
                <div class="cont-left">
                    <div class="box-sign">
                        <div class="sec-title">
                            <p> @lang('website.You have an account')?<br />@lang('website.createNewAccount') </p>
                            <a href="{{route('website.register')}}">@lang('website.signup')</a>
                        </div>
                    </div>
                </div>
                <div class="cont-right">
                    <div class="sec-head">
                        <h2>@lang('website.signin')</h2>
                    </div>
                    <form class="form-sign" method="post" action="{{route('website.login')}}">
                        @csrf
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="@lang('website.email')"  name="email"/>
                            <i class="ti-email"></i>
                        </div>
                        <div class="form-group mb140">
                            <input type="password" class="form-control" placeholder="@lang('website.password')" name="password" />
                            <i class="ti-eye"></i>
                        </div>
                        <div class="form-group">
                            <button class="btn-log"><i class="ti-user"></i>@lang('website.signin')</button>
                        </div>
                        <a href="{{route('password.request')}}" class="forgot-pass">@lang('website.forgotPassword')?</a>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--End Section-home-slider-->


@endsection
