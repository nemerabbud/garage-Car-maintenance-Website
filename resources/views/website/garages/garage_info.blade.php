@extends('website.layouts.websiteLayouts')

@section('title',$garage->name)

@section('content')
    <section class="section-slide-details">
        <div class="container">
            <div class="block-product-slide">
                <div class="slider slider-for">

                    @foreach($garage->images as $image)
                        <div class="pro-slide-item">
                            <div class="pro--Thumb slider-for__item ex1" data-src="{{$image->image_url}}">
                                <img src="{{$image->image_url}}" alt=""/>
                            </div>
                        </div>
                    @endforeach


                </div>

                <div class="slider slider-nav clearfix">

                    @foreach($garage->images as $image)
                        <div class="sp-nav">
                            <img src="{{$image->image_url}}" alt="" class="img-responsive">
                        </div>
                    @endforeach

                </div>
            </div>
            <div class="bottom-slide-pro clearfix">
                <div class="lo-gar">
                    <figure>
                        <img src="{{$garage->user->image_url}}"/>
                    </figure>
                    <span>{{$garage->category->title}}</span>
                    <h2>{{$garage->name}}</h2>
                </div>
                <div class="title-gar">
                    <p>{{$garage->description}}</p>
                </div>
            </div>
        </div>
    </section>
    <!--End Section-home-slider-->

    <section class="section-data-gar">
        <div class="container">
            <div class="action-gar">
                <div class="location-gar">
                    <figure>
                        <i class="fa fa-map-marker"></i>
                    </figure>
                    <div class="sec-title">
                        <h5>@lang('website.address')</h5>
                        <p>{{$garage->address}}</p>
                    </div>
                </div>
                <div class="rate-gar">
                    <figure>
                        <h4>{{$garage->rate}}</h4>
                    </figure>
                    <div class="sec-title">
                        <div class="rate">
                            <span class="fa fa-star {{$garage->rate>0?"checked":""}}"></span>
                            <span class="fa fa-star {{$garage->rate>1?"checked":""}}"></span>
                            <span class="fa fa-star {{$garage->rate>2?"checked":""}}"></span>
                            <span class="fa fa-star {{$garage->rate>3?"checked":""}}"></span>
                            <span class="fa fa-star {{$garage->rate>4?"checked":""}}"></span>

                        </div>
                        <p>{{$garage->count_reviewers}} @lang('website.number of reviewers')</p>
                    </div>
                </div>
                <div class="contact-gar">
                    <figure>
                        <i class="fa fa-phone"></i>
                    </figure>
                    <div class="sec-title">
                        <h5>@lang('website.number contact')</h5>
                        <p>{{$garage->user->mobile}}</p>
                    </div>
                </div>
            </div>
            <div class="service-gar">
                <div class="sec-head">
                    <h4><img src="{{website_assets('/')}}/images/repairing-service.png"/>@lang('website.Services provided') :</h4>
                </div>
                <div class="owl-carousel" id="service-slider">
                    @foreach($garage->services as $service)

                        <div class="item">
                            <div class="box-mascara">
                                <figure>
                                    <img src="{{$service->image_url}}"/>
                                </figure>
                                <h5>{{$service->title}}</h5>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
            <div class="type-car">
                <div class="sec-head">
                    <h4><img src="{{website_assets('/')}}/images/sports-car.png"/>@lang('website.Types of cars') :</h4>
                </div>
                <div class="owl-carousel" id="cars-slider">
                    @foreach($garage->carTypes as $carType)

                        <div class="item">
                            <div class="box-mascara">
                                <h4>{{$carType->title}}</h4>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
            <div class="testimon-gar">
                <div class="sec-head">
                    <h4><i class="fa fa-star"></i> Customer Opinions :</h4>
                </div>
                <div class="owl-carousel" id="customer-slider">

                    @foreach($garage->reviews as $review)
                        <div class="item">
                            <div class="box-mascara">
                                <i class="fa fa-quote-left"></i>
                                <p>{{$review->content}}</p>
                                <h6>{{$review->user->name}}</h6>
                            </div>
                        </div>

                    @endforeach

                </div>
            </div>

            @if(auth()->check())
                <a href="{{route('website.create_order',[$garage->id , $garage->slug])}}"
                   class="btn-reservation"><i class="fa fa-calendar-o"></i>@lang('website.Make an appointment')</a>

            @endif
        </div>
    </section>
@endsection

@push('js')
    <script type="text/javascript">
        var check = false;
        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
            arrows: false,
            asNavFor: '.slider-nav'
        });
        $('.slider-nav').slick({

            slidesToShow: 4,
            slidesToScroll: 1,
            autoplay: false,
            asNavFor: '.slider-for',
            dots: false,
            focusOnSelect: true,
            centerMode: true,
            vertical: true,
            responsive: [
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 3,
                        vertical: false,
                        centerMode: true,
                    }
                }
            ],
            speed: 1000,
            autoplaySpeed: 2000,
            useTransform: true,
            cssEase: 'cubic-bezier(0.645, 0.045, 0.355, 1.000)',
            prevArrow: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
            nextArrow: "<i class='fa fa-angle-right' aria-hidden='true'></i>"
        });
    </script>


@endpush
