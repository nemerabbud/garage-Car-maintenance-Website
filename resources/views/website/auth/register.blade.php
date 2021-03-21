@extends('website.layouts.websiteLayouts')
@section('title',__('website.signup'))

@section('content')
    <section class="section-site-page pd100 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="container">
            <div class="content-sign">
                <div class="cont-left">
                    <div class="box-sign">
                        <div class="sec-title">
                            <p> @lang('website.You have an account')<br />@lang('website.Sign in to your account')</p>
                            <a href="{{route('website.login')}}">@lang('website.signin')</a>
                        </div>
                    </div>
                </div>
                <div class="cont-right">
                    <div class="sec-head">
                        <h2>@lang('website.signup')</h2>
                    </div>
                    <form class="form-sign" method='post' action="{{route('website.register')}}">
                        @csrf
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="@lang('website.full_name')" name="name" value="{{old('name')}}"  />
                            <i class="ti-user"></i>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="@lang('website.mobile')" name="mobile" value="{{old('mobile')}}" />
                            <img src="{{website_assets('/')}}images/phone.svg" />
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="@lang('website.email')" name="email"  value="{{old('email')}}" />
                            <i class="ti-email"></i>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="@lang('website.password')" name="password" />
                            <i class="ti-eye"></i>
                        </div>
                        <div class="form-group">
                            <button class="btn-log"><i class="ti-user"></i>@lang('website.signup')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--End Section-home-slider-->

@endsection
