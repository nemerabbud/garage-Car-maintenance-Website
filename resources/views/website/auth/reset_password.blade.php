@extends('website.layouts.websiteLayouts')

@section('title',__('website.forgotPassword'))
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
                        <h2>@lang('website.forgotPassword')</h2>
                    </div>
                    <form class="form-sign" method="post" action="{{route('password.email')}}">

                        @csrf
                        <div class="form-group mb140">
                            <input type="text" class="form-control"  name="email" required placeholder="@lang('website.email')" />
                            <i class="ti-email"></i>
                        </div>
                        <div class="form-group ">
                            <button class="btn-log"><i class="ti-back-left"></i>@lang('website.send')</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--End Section-home-slider-->

s


@endsection
