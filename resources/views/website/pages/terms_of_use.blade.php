@extends('website.layouts.websiteLayouts')


@section('title',__('website.terms'))
@section('keywords',$page->keywords)
@section('content')


    <section class="section-site-page pd100 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="container">
            <div class="content-page-site">
                <div class="head-page-site">
                    <span>@lang('website.terms')</span>
                    <h2>{{$page->title}}</h2>
                </div>
                <div>
                    {!! $page->description !!}
                </div>
            </div>
        </div>
    </section>
    <!--End Section-home-slider-->

@endsection
