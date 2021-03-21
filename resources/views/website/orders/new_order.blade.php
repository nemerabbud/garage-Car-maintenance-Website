@extends('website.layouts.websiteLayouts')
@section('title',__('website.Make an appointment'))

@section('content')


<section class="section-site-page wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
    <div class="container">
        <form class="form-reservation" action="{{route('website.create_order',[$garage->id,slugURL($garage->user->name)])}}"
              method="post" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <input type="date" class="form-control" placeholder="Date Reservation" name="date" required />
            </div>
            <div class="form-group">
                <input type="time" class="form-control" placeholder="Time Reservation" name="time" required/>
            </div>
            <div class="form-group">
                <input type="file" name="images[]" id="gallery-photo-add" class="form-control inputfile" multiple>
                <label for="gallery-photo-add">
                    <span class="archive-name">@lang('website.images')</span>
                    <span class="btn-inputfile"><i class="fa fa-image"></i></span>
                </label>
            </div>
            <div class="gallery">

            </div>
            <div class="form-group">
                <textarea class="form-control" placeholder="@lang('website.description')" name="description"></textarea>
                <i class="fa fa-commenting"></i>
            </div>
            <div class="services-res">
                <div class="sec-head">
                    <h3><img src="{{website_assets('/')}}/images/cogwheel.svg" /> @lang('website.services') :</h3>
                </div>
                <ul class="Choose-pro">

                    @foreach($garage->services as $service)
                    <li>
                        <div class="inputGroup">
                            <input id="checkbox{{$loop->index}}" name="services_ids[]" value="{{$service->id}}" type="checkbox"/>
                            <label for="checkbox{{$loop->index}}"><img src="{{$service->image_url}}" /> <span>{{$service->title}}</span></label>
                        </div>
                    </li>

                    @endforeach

                </ul>
            </div>
            <button class="btn-reservation"><i class="fa fa-calendar-o"></i>Make an appointment</button>
        </form>
    </div>
</section>
<!--End Section-home-slider-->


@endsection
