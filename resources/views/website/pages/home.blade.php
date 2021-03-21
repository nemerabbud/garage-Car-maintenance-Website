@extends('website.layouts.websiteLayouts')

@section('title',__('website.home'))

@section('content')

    <section class="section-home-slide wow fadeInUp">
        <div class="owl-carousel" id="home-slider">
            <div class="item" style="background:url({{website_assets('/')}}/images/home-slider.png)"></div>
            <div class="item" style="background:url({{website_assets('/')}}/images/home-slider.png)"></div>
        </div>
        <div class="content-home-slide">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="h-s-txt">
                            <h1>The best location to get your vehicle fast.</h1>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="h-s-thumb">
                            <span>Car maintenance</span>
                            <h3>Download the maintenance app</h3>
                            <strong>Weenha</strong>
                            <ul class="btn-download-app wow fadeInUp animated" data-wow-duration="1s" data-wow-delay="0.500s">
                                <li>
                                    <a href="{{setting_value('play_store_url')}}" target="_blank" class="google_store">
                                        <i class="fa fa-android"></i>
                                        <div class="sec-title">
                                            <span>@lang('website.Get It From')</span>
                                            <p> @lang('website.Google_Store')</p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="{{setting_value('app_store_url')}}" target="_blank" class="app_store">
                                        <i class="fa fa-apple"></i>
                                        <div class="sec-title">
                                            <span>@lang('website.Get It From')</span>
                                            <p> @lang('website.Apple_Store')</p>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--End Section-home-slider-->

    <section class="section-special-garages">
        <div class="container">
            <div class="sec-head wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                <h2>Special garages</h2>
            </div>
            <div class="owl-carousel" id="garages-slider">
                @foreach($garages as $garage)
                <div class="item">
                    <div class="pro-item">
                        <a href="#" class="proThumb">
                            <img src="{{$garage->user->image_url}}" alt="" class="img-responsive Thumb-main">
                        </a>
                        <div class="proTxt">
                            <h5><a href="#">{{$garage->name}}</a></h5>
                        </div>
                        <div class="over-pr">
                            <h4>{{$garage->name}}</h4>
                            <p>
                                <i class="fa fa-map-marker"></i>
                                {{$garage->address}}
                            </p>
                            <a class="btn-details" href="{{route('website.garage_info',[$garage,$garage->slug])}}"><img src="{{website_assets('/')}}/images/back.svg" /> Details</a>
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </div>
    </section>
    <!--End special-garages-->

    <section class="section-categoris">
        <div class="container">
            <div class="sec-head wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                <h2>@lang('website.categories')</h2>
            </div>
            <div class="row">

                @foreach($categories as  $category)
                    @component('website.components.category',['item'=>$category])
                    @endcomponent

                @endforeach

            </div>
        </div>

        <div class="text-center">
            <a href="{{route('website.categories')}}" class="text-center text-primary"> @lang('website.view_all')</a>

        </div>
    </section>
    <!--End Latest-categoris-->

    <section class="section-download-app">
        <div class="container">
            <div class="content-download">
                <div class="title-download">
                    <div class="sec-head wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                        <h2>@lang('website.downloadApp')</h2>
                    </div>
                    <p>{{setting_value('download_app_text')}}</p>
                    <p>{{setting_value('download_app_text')}}</p>
                    <ul class="btn-download-app wow fadeInUp animated" data-wow-duration="1s" data-wow-delay="0.500s">
                        <li>
                            <a href="#" class="google_store">
                                <i class="fa fa-android"></i>
                                <div class="sec-title">
                                    <span>@lang('website.Get It From')</span>
                                    <p> @lang('website.Google_Store')</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="app_store">
                                <i class="fa fa-apple"></i>
                                <div class="sec-title">
                                    <span>@lang('website.Get It From')</span>
                                    <p> @lang('website.Apple_Store')</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="img-moc wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                    <img src="{{website_assets('/')}}/images/mockup.png" />
                </div>
            </div>
            <div class="box-sub-site">
                <ul>
                    <li>
                        <figure>
                            <img src="{{website_assets('/')}}/images/cogwheel.svg" />
                        </figure>
                        <div class="sec-title">
                            <h2>{{{$count_services??0}}}</h2>
                            <p>@lang('website.Total Service')</p>
                        </div>
                    </li>
                    <li>
                        <figure>
                            <img src="{{website_assets('/')}}/images/user.svg" />
                        </figure>
                        <div class="sec-title">
                            <h2>{{$count_user}}</h2>
                            <p>Total User</p>
                        </div>
                    </li>
                    <li>
                        <figure>
                            <img src="{{website_assets('/')}}/images/star.svg" />
                        </figure>
                        <div class="sec-title">
                            <h2>{{setting_value('rate_number')??0}}</h2>
                            <p>@lang('website.rate_number')</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <!--End download-app-->
@endsection
