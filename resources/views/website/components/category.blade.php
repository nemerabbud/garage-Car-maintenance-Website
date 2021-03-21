<div class="col-md-3">
    <div class="box-cat wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <figure>
            <img src="{{$item->image_url}}" alt="" />
        </figure>
        <div class="sec-title">
            <h4>{{$item->title}}</h4>
            <span>{{$item->count_services}} @lang('website.service')</span>
        </div>
        <a class="btn-details" href="{{route('website.category_garages',$item->slug)}}"><img src="{{website_assets('/')}}/images/back-white.svg" /> @lang('website.details')</a>
    </div>
</div>
