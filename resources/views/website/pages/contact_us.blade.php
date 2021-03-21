@extends('website.layouts.websiteLayouts')

@section('title',__('website.contact'))

@section('content')

    <section class="section-site-page wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="bg-contact "></div>
        <div class="container ">
            <div class="flex-contact">
                <div class="contact_info_box wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.600s">
                    <ul>
                        <li class="li_location">
                            <i class="fa fa-map-marker"></i>
                            <div class="sec-title">
                                <h6>@lang('website.address')</h6>
                                <p>{{setting_value('address')}}</p>
                            </div>
                        </li>
                        <li class="li_phone">
                            <i class="fa fa-phone"></i>
                            <div class="sec-title">
                                <h6>@lang('website.phone')</h6>
                                <p>{{setting_value('mobile')}}</p>
                            </div>
                        </li>
                        <li class="li_email">
                            <i class="fa fa-envelope"></i>
                            <div class="sec-title">
                                <h6>@lang('website.email')</h6>
                                <p>{{setting_value('email')}}</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="contact_left">
                    <div class="sec-head">
                        <h2>Contact Us</h2>
                    </div>
                    <form class="form_contact" action="{{route('website.create_contact_us')}}" method="post">
                        @csrf
                        <div class="form-group wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
                            <input type="text"  name="name" required class="form-control" placeholder="@lang('website.full_name')" id="Name">
                        </div>
                        <div class="form-group wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.600s">
                            <input type="email" name="email" required class="form-control" placeholder="@lang('website.email')" id="Email">
                        </div>
                        <div class="form-group wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.600s">
                            <input type="text" name="mobile" required class="form-control" placeholder="@lang('website.mobile')" id="mobile">
                        </div>
                        <div class="form-group mb40 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.700s">
                            <textarea class="form-control"  required name="description" placeholder="@lang('website.message')" id="Message"></textarea>
                        </div>
                        <button type="submit" class="btn btn-log wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.750s">Send</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--End section-site-page-->

@endsection
