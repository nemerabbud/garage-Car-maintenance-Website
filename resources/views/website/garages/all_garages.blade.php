@extends('website.layouts.websiteLayouts')
@section('title',__('website.garages'))


@section('content')
    <div class="head-page">
        <div class="container">
            <div class="head-title">
                <h3>Garagat</h3>
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
            <div class="flex-garage">
                @foreach($garages as $item)
                    @component('website.components.garage',['item'=>$item])
                    @endcomponent
                @endforeach


            </div>
            {!! $garages->links() !!}

        </div>
    </section>
    <!--End Section-home-slider-->
@endsection

