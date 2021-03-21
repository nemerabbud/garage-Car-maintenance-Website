@extends('website.layouts.websiteLayouts')

@section('content')
    <section class="section-site-page pd100 wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.550s">
        <div class="container">
            <div class="content-sign">
                <div class="cont-left">
                    <div class="box-sign">
                        <div class="sec-title">
                            <p> @lang('website.You have an account')?<br/>@lang('website.createNewAccount') </p>
                            <a href="{{route('website.register')}}">@lang('website.signin')</a>
                        </div>
                    </div>
                </div>
                <div class="cont-right">
                    <div class="sec-head">
                        <h2>@lang('website.create_garage')</h2>
                    </div>
                    <form class="form-sign" method="post" action="{{route('website.create_garage_request')}}" enctype="multipart/form-data">
                        @csrf


                        <input type="hidden" id="lng" name="lng">
                        <input type="hidden" id="lat" name="lat">
                        <div class="form-group">
                            <div class="avatar-upload">
                                <div class="avatar-edit">
                                    <input type='file' id="imageUpload" name="logo" required accept=".png, .jpg, .jpeg"/>
                                    <label for="imageUpload"></label>
                                </div>
                                <div class="avatar-preview">
                                    <div id="imagePreview"
                                         style="background-image: url(http://i.pravatar.cc/500?img=7);">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="text" required class="form-control" placeholder="@lang('website.owner_name')"
                                   value="{{old('owner_name')}}" name="owner_name"/>
                            <i class="ti-user"></i>
                        </div>

                        <div class="form-group">
                            <input type="email" required class="form-control" placeholder="@lang('website.email')"
                                   name="email"
                                   value="{{old('email')}}"/>
                            <i class="ti-email"></i>
                        </div>

                        <div class="form-group">
                            <input type="text" required class="form-control" placeholder="@lang('website.mobile')" name="mobile"
                                   value="{{old('mobile')}}"/>
                            <i class="ti-mobile"></i>
                        </div>


                        <div class="form-group">
                            <input type="text" required class="form-control" placeholder="@lang('website.garage_name_ar')"
                                   name="ar[title]" value="{{old('ar.title')}}"/>
                            <i class="fa fa-address-book"></i>
                        </div>

                        <div class="form-group">
                            <input type="text" required class="form-control"
                                   placeholder="@lang('website.garage_name_en')"
                                   name="en[title]" value="{{old('en.title')}}"/>
                            <i class="fa fa-address-book"></i>
                        </div>


                        <div class="form-group">
                            <textarea required class="form-control" placeholder="@lang('website.description_ar')"
                                      name="ar[description]">{{old('ar.description')}}</textarea>
                        </div>

                        <div class="form-group">
                            <textarea required class="form-control" placeholder="@lang('website.description_en')"
                                      name="en[description]">{{old('en.description')}}</textarea>
                        </div>

                        <div class="form-group">
                            <input required type="text" class="form-control" placeholder="@lang('website.address_ar')"
                                   name="ar[address]" value="{{old('ar.address')}}"/>
                            <i class="fa fa-address-card"></i>
                        </div>
                        <div class="form-group">
                            <input required type="text" class="form-control" placeholder="@lang('website.address_en')"
                                   name="en[address]" value="{{old('en.address')}}"/>
                            <i class="fa fa-address-card"></i>
                        </div>



                        <div class="form-group">
                            <input type="file" name="commercial_license_image" id="imageUpload1" required class="form-control inputfile"
                                   accept=".png, .jpg, .jpeg">
                            <label for="imageUpload1">
                                <span class="archive-name">@lang('website.commercial_license_image')</span>
                                <span class="btn-inputfile"><i class="fa fa-image"></i></span>
                            </label>
                        </div>


                        <div class="py-2 my-3">
                            <img id="commercial_license_image"  style="    width: 100%"/>


                            <div class="form-group">
                                <button class="btn-log"><i class="fa fa-send"></i>@lang('website.send')</button>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </section>

    <!--End Section-home-slider-->


@endsection


@push('js')
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGwXjToBWnjEh08VtDUfEakvaFi1Bgf_w&callback=initMap"

        defer
    ></script>

    <script type="text/javascript">


        // $(document).ready(function() {
        var map, marker, myLatLng;

        function initMap() {

            myLatLng = {lat: -25.363, lng: 131.044};

            $("#lat").val(myLatLng.lat);
            $("#lng").val(myLatLng.lng)

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                        const pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude,
                        };
                        var lat = position.coords.latitude;
                        var lng = position.coords.longitude;
                        $("#lat").val(lat);
                        $("#lng").val(lng)
                    }
                );
            }

        }

    </script>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                    $('#imagePreview').hide();
                    $('#imagePreview').fadeIn(650);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#imageUpload").change(function () {
            readURL(this);
        });
        $("#imageUpload1").change(function () {
            readURL1(this);
        });

        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#commercial_license_image').attr('src',  e.target.result );
                    $('#commercial_license_image').hide();
                    $('#commercial_license_image').fadeIn(650);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

@endpush





