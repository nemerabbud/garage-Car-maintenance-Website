@extends('website.layouts.websiteLayouts')

@section('title',__('website.categories'))

@section('content')


    <section class="section-site-page wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
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

        {!! $categories->links() !!}

    </section>
    <!--End Section-home-slider-->
@endsection


