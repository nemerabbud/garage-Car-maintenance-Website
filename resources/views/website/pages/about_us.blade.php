@extends('website.layouts.websiteLayouts')


@section('title',$page->title)
@section('keywords',$page->keywords)
@section('content')

    <section class="section-site-page wow fadeInUp">
        <div class="container">
            <div class="content-about">
                <div class="list-about">
                    <div class="sec-title">
                        <h2 class="my-5">{{$page->title}}</h2>
                        <div class="lead">
                            {!! $page->description !!}
                        </div>
                    </div>
                    <div class="image-about my-5">
                        <figure>
                            <img src="{{$page->image_url}}"  class="img-fluid" style="width:100%" alt="" />
                        </figure>
                    </div>
                </div>

            </div>
        </div>
    </section>
@endsection
