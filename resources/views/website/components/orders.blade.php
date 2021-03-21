@foreach($orders as $order)
    <div class="box-order wow fadeInUp " data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="top-order">
            <h4>@lang('website.order_number') : {{$order->id}}</h4>
            <time><i
                    class="fa fa-clock-o"></i> {{\Carbon\Carbon::parse($order->created_at)->format('d/m/Y')}}
            </time>
        </div>
        <p>{{$order->garage->user->name}}</p>
        <div class="bt-order">
            <ul>
                @foreach($order->services as $service )
                    <li><img src="{{$service->image_url}}" width="35px"/>
                        <h5>{{$service->title}}</h5></li>
                @endforeach
            </ul>
            <a class="{{$order->status === 'waiting'?'waiting':($order->status === 'accepted'?'complete':'closed')}}"
               data-toggle="modal"
               data-target="#order-status{{$order->id}}">@lang("website.$order->status")
                <img
                    src="{{website_assets('/')}}/images/back-white.svg"/></a>

        </div>
    </div>


@endforeach

