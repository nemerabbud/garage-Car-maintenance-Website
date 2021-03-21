@extends('website.layouts.websiteLayouts')
@section('title',__('website.my_orders'))

@section('content')

<section class="section-site-page wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
    <div class="container">
        <div class="row column-reverse">
            <aside class="col-md-4">
                <div class="box-aside-pro list-profile">
                    <figure class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                        <img class="auth_user_image" src="{{auth()->user()->image_url}}" />
                    </figure>
                    <h2 class="wow fadeInUp auth_user_name" data-wow-duration="1s" data-wow-delay="0.550s">{{auth()->user()->name}}</h2>

                    @if(auth()->user()->role==="garage")
                    <div class="monthly-package">
                        <p>{{auth()->user()->garage->plan->title}}</p>
                        <h2>{{auth()->user()->garage->ammount??auth()->user()->garage->plan->price}}$</h2>
                        <ul class="list-date">
                            <li>
                                <i class="fa fa-clock-o"></i>
                                <div class="sec-title">
                                    <span>@lang('website.from')</span>
                                    <time>{{\Carbon\Carbon::parse(auth()->user()->garage->start_date)->format('d/m/Y')}} </time>
                                </div>
                            </li>
                            <li>
                                <i class="fa fa-clock-o"></i>
                                <div class="sec-title">
                                    <span>@lang('website.to')</span>
                                    <time>{{\Carbon\Carbon::parse(auth()->user()->garage->end_date)->format('d/m/Y')}}</time>
                                </div>
                            </li>
                        </ul>
                    </div>

                    @endif

                    <ul class="contact-data wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                        <li>
                            <figure>
                                <i class="fa fa-envelope"></i>
                            </figure>
                            <div class="sec-title">
                                <p>@lang('website.email')</p>
                                <span class="auth_user_email">{{auth()->user()->email}}</span>
                            </div>
                        </li>
                        <li>
                            <figure>
                                <i class="fa fa-phone"></i>
                            </figure>
                            <div class="sec-title">
                                <p>@lang('website.phone')</p>
                                <span class="auth_user_mobile">{{auth()->user()->mobile}}</span>
                            </div>
                        </li>
                    </ul>
                    <ul class="list-action wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                        <li class="edit-pro"><a class="edit_profile_action"><i class="fa fa-pencil"></i>@lang('website.Edit your profile')</a></li>
                      <li class="change-pass"><a class="change-password-action"><i class="fa fa-lock"></i>@lang('website.changePassword')</a></li>
                    </ul>
                </div>
            </aside>
            <div class="col-md-8">
                <div class="all-order">
                    <div class="sec-head wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                        <h4>@lang('website.Booking Requests')</h4>
                    </div>
                    <div class="content-order">

                        @if($orders->count()>0)
                            <div id="orders_list">
                            @component('website.components.orders',['orders'=>$orders])
                            @endcomponent
                            </div>
                        @if($orders->lastPage()>1)
                                <a class="btn-more" id="load_more_orders">@lang('website.load_more')  <i class=" fa fa-arrow-down"></i>  </a>
                            @endif

                        @else
                            <p class="lead text-center"> @lang('website.no-orders')</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<section id="my_orders_modal">
@component('website.components.orders_modal',['orders'=>$orders])
@endcomponent
</section>



@endsection
<!--End Section-home-slider-->


@push('js')
    <script>
        var  next_page_url ="{{$orders->nextPageUrl()}}" ;
        $(document).on('click','#load_more_orders',function () {

            $('#load_more_orders i').addClass('fa-spinner fa-spin').removeClass('fa-arrow-down');
            if(next_page_url)
            $.get(next_page_url ,function (response) {

                $('#orders_list').append(response.orders);
                $('#my_orders_modal').append(response.orders_modal);

                next_page_url =response.next_page_url;
                if(!next_page_url)
                $('#load_more_orders').hide();

                $('#load_more_orders i').removeClass('fa-spinner fa-spin').addClass('fa-arrow-down');

            });
        })
    </script>con
@endpush()
