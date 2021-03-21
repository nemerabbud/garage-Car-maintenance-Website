@foreach($orders as $order)
    <div class="modal fade order-status" id="order-status{{$order->id}}" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="head-form text-center">
                    <div class="title">
                        <p>@lang('website.order_number'): {{$order->id}}</p>
                        <span>@lang('website.'.$order->status)</span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="contentorder-status">
                    <div class="date-book">
                        <div>
                            <p><i class="fa fa-calendar-o"></i> @lang('website.Date Book')</p>
                            <time>{{\Carbon\Carbon::parse($order->date)->format('d/m/Y')}}</time>
                        </div>
                        <div>
                            <p><i class="fa fa-clock-o"></i> @lang('website.Time Book')</p>
                            <time>{{\Carbon\Carbon::parse($order->time)->format('g:i A')}}</time>
                        </div>
                    </div>
                    <div class="ph-order-status">
                        <p>{{$order->description}} </p>
                        <time><i class="fa fa-clock-o"></i>{{\Carbon\Carbon::parse($order->date)->format('d/m/Y')}}
                        </time>
                    </div>
                    <div class="service-book">
                        <p>@lang('website.Services provided') :</p>
                        <ul class="list-service-provid">
                            @foreach($order->services as $service )

                                <li>
                                    <figure>
                                        <img src="{{$service->image_url}}"/>
                                    </figure>
                                    <p>{{$service->title}}</p>
                                </li>
                            @endforeach

                        </ul>
                    </div>
                    <div class="service-book">
                        <p>@lang('website.images') :</p>
                        <div class="images-service-stu">
                            @foreach($order->images as $image)
                                <figure>
                                    <img src="{{$image->image_url}}"/>
                                </figure>
                            @endforeach

                        </div>
                    </div>

                    @if(auth()->user()->role == 'customer')
                        <div class="service-book">
                            <p>@lang('website.Data Garage') :</p>
                            <div class="data-garage">
                                <figure>
                                    <img src="{{$order->garage->user->image_url}}"/>
                                </figure>
                                <div class="sec-title">
                                    <span>{{$order->garage->name}}</span>
                                    <h4>{{$order->garage->description}}</h4>
                                </div>
                            </div>
                        </div>
                        @if($order->status !=='waiting' && !$order->is_reviewed )
                            <div class="rate-garage">
                                <a class="btn-rate" data-toggle="modal" data-target="#rate-gr{{$order->id}}"><i
                                        class="fa fa-star"></i> @lang('website.rate_garage')</a>
                            </div>

                        @endif

                    @else

                        <div class="service-book">
                            <p>@lang('website.data_user'):</p>
                            <div class="data-owner-order">
                                <div class="sec-title">
                                    <span>{{$order->user->name}}</span>
                                    <ul class="list-owner-order">
                                        <li>
                                            <span class="fa fa-phone"></span>
                                            <p>{{$order->user->mobile}}</p>
                                        </li>
                                        <li>
                                            <span class="fa fa-envelope"></span>
                                            <p>{{$order->user->email}}</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        @if($order->status ==='waiting')
                            <ul class="order-action">
                                <li class="accept-order"><a onclick="event.preventDefault();
                                        document.getElementById('accept-order{{$order->id}}').submit();">@lang('website.accept')</a>
                                </li>
                                <li class="reject-order"><a data-toggle="modal" data-target="#reject-order{{$order->id}}" >@lang('website.reject')</a></li>
                            </ul>

                            <form id="accept-order{{$order->id}}"
                                  action="{{ route('website.accept_order',$order->id) }}" method="POST"
                                  class="d-none">
                                @csrf
                            </form>

                        @endif
                    @endif
                </div>
            </div>
        </div>

    </div>
    @if(auth()->user()->role == 'customer' && $order->status !=='waiting' && !$order->is_reviewed )

        <div class="modal fade" id="rate-gr{{$order->id}}" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="head-form text-center">
                        <div class="title">
                            <p>@lang('website.rate_garage')</p>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form-st1" action="{{route('website.order_rate')}}" method="post">
                        @csrf
                        <input type="hidden" name="order_id" value="{{$order->id}}">
                        <input type="hidden" name="garage_id" value="{{$order->garage->id}}">
                        <div class="form-group">
                            <div id="full-stars-example-two">
                                <div class="rating-group">
                                    <input disabled checked class="rating__input rating__input--none" name="rating3"
                                           id="rating3-none" value="0" type="radio">
                                    <label aria-label="1 star" class="rating__label" for="rating3-1"><i
                                            class="rating__icon rating__icon--star fa fa-star"></i></label>
                                    <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
                                    <label aria-label="2 stars" class="rating__label" for="rating3-2"><i
                                            class="rating__icon rating__icon--star fa fa-star"></i></label>
                                    <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
                                    <label aria-label="3 stars" class="rating__label" for="rating3-3"><i
                                            class="rating__icon rating__icon--star fa fa-star"></i></label>
                                    <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
                                    <label aria-label="4 stars" class="rating__label" for="rating3-4"><i
                                            class="rating__icon rating__icon--star fa fa-star"></i></label>
                                    <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
                                    <label aria-label="5 stars" class="rating__label" for="rating3-5"><i
                                            class="rating__icon rating__icon--star fa fa-star"></i></label>
                                    <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        <textarea class="form-control" name="content" required
                                  placeholder="@lang('website.write_review')"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn-submit">@lang('website.review')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    @elseif(auth()->user()->role == 'garage' && $order->status ==='waiting')
        <div class="modal fade" id="reject-order{{$order->id}}" role="dialog">

            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="head-form text-center">
                        <div class="title">
                            <p>@lang('website.reject')</p>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form-st1" action="{{route('website.reject_order',$order->id)}}"
                          method="post">
                        @csrf

                        <div class="form-group">
                                         <textarea class="form-control" name="rejected_message" required
                                                   placeholder="@lang('website.rejected_message')"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit"
                                    class="btn-submit">@lang('website.reject')</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    @endif
@endforeach
