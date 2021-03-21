
<div class="box-gar">
    <figure>
        <img src="{{$item->user->image_url}}" />
        <div class="over-gr">
            <a class="btn-details" href="{{route('website.garage_info',[$item,$item->slug])}}"><img src="{{website_assets('/')}}/images/back.svg" /> @lang('website.details')</a>
        </div>
    </figure>
    <div class="sec-title">
        <h4>{{$item->name}}</h4>
        <p>
            <i class="fa fa-map-marker"></i>
            {{$item->address}}
        </p>
    </div>
</div>
