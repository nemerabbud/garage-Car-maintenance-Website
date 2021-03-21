@extends('website.layouts.websiteLayouts')

@section('title',__('website.forgotPassword'))
@section('content')


    <section class="section-site-page pd100 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="container">
            <div class="content-sign">

                <div class="cont-right m-auto">
                    <div class="sec-head">
                        <h2>@lang('website.forgotPassword')</h2>
                    </div>
                    <form class="form-sign" method="post" action="{{route('password.update')}}">

                        @csrf
                        <input type="hidden" name="token" value="{{ $token }}" >

                        <div class="form-group">
                            <input type="text" class="form-control @error('email') is-invalid @enderror"  name="email" required placeholder="@lang('website.email')"
                                    value="{{ $email ?? old('email') }}"  autocomplete="email" autofocus
                            />
                            <i class="ti-email"></i>
                            @error('email')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>
                        <div class="form-group ">
                            <input type="password" class="form-control @error('password') is-invalid @enderror"   name="password" required placeholder="@lang('website.password')"

                            />
                            <i class="ti-eye"></i>
                            @error('password')
                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                            @enderror
                        </div>
                        <div class="form-group ">
                            <input type="password" class="form-control"  name="password_confirmation" required placeholder="@lang('website.confirmPassword')"

                            />
                            <i class="ti-eye"></i>

                        </div>
                        <div class="form-group ">
                            <button class="btn-log"><i class="ti-back-left"></i>@lang('website.changePassword')</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--End Section-home-slider-->

    s


@endsection
