@extends('website.layouts.websiteLayouts')

@section('title',$category->title)

@section('content')
    <div class="head-page">
        <div class="container">
            <div class="head-title">
                <h3>@lang('website.garages')</h3>
                <form  >
                    <input type="text"  name="search" class="form-control" placeholder="Search" value="{{old('search',request()->search)}}"/>
                    <button><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
    </div>
    <!--End head-page-->

    <section class="section-site-page wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="container">
            <div class="owl-carousel">


                @foreach($category->services as $service )
                    <div class="item ">
                        <a  href="{{route('website.category_garages',['category_slug'=>$category->slug,'service_id'=>$service->id])}}">

                        <div class="box-filter-gr {{\request()->service_id == $service->id?"active":""}} text-dark">

                            <img src="{{$service->image_url}}"/>
                            <h5 class="">
                                    {{$service->title}}
                            </h5>

                        </div>
                        </a>

                    </div>

                @endforeach

            </div>
            <div class="flex-garage">
                @foreach($garages as $item)
                    @component('website.components.garage',['item'=>$item])
                    @endcomponent
                @endforeach


            </div>
        </div>
    </section>
    <!--End Section-home-slider-->
@endsection

@push('js')
    <script>

        $('.owl-carousel').owlCarousel({
            margin: 10,
            loop: true,
            autoWidth: true,
        })

    </script>

@endpush
