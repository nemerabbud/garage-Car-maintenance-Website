@extends('layout.adminLayout')
@section('title') {{__('cp.manage_garages')}}
@endsection
@section('css')

   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGwXjToBWnjEh08VtDUfEakvaFi1Bgf_w&sensor=false&libraries=places"></script>
    <style type="text/css">
        .input-controls {
            margin-top: 10px;
            border: 1px solid transparent;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 32px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        #searchInput {
            background-color: #fff;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            margin-left: 12px;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 50%;
        }

        #searchInput:focus {
            border-color: #4d90fe;
        }
    </style>

@endsection
@section('content')
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN SAMPLE FORM PORTLET-->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject font-dark sbold uppercase"
                              style="color: #e02222 !important;">{{ucwords(__('cp.edit_garage'))}}</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form method="post" action="{{url(app()->getLocale().'/admin/garage/'.$garage->id)}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form" id="form">
                        {{ csrf_field() }}
                        {{ method_field('PATCH')}}
                      
                        <fieldset>
                            <legend>{{__('cp.main_info')}}</legend>

                            <div class="tabbable-custom ">
                                <ul class="nav nav-tabs ">
                                    @foreach($locales as $locale)
                                        <li {{($locale->lang == 'en') ? "class=active" : '' }}>
                                            <a href="#tab_{{$locale->lang}}" data-toggle="tab">{{$locale->name}}</a>
                                        </li>
                                    @endforeach

                                </ul>
                                <div class="tab-content">
                                    @foreach($locales as $locale)
                                        <div class="tab-pane {{($locale->lang == 'en') ? 'active' : '' }}" id="tab_{{$locale->lang}}">


                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="{{$locale->lang}}[name]">
                                                    {{__('cp.garage_name')}}
                                                    <span class="symbol">*</span>

                                                </label>
                                                <div class="col-md-3">
                                                    <input class="form-control" name="{{$locale->lang}}[name]"
                                                           id="{{$locale->lang}}[name]" value="{{old("$locale->lang.name",@$garage->translate($locale->lang)->name)}}"
                                                           required>
                                                </div>



                                            </div>
                                            <div class="form-group">

                                                <label class="col-sm-2 control-label" for="{{$locale->lang}}[description]">
                                                    {{__('cp.description')}}
                                                    <span class="symbol">*</span>
                                                </label>
                                                <div class="col-md-3">
                            <textarea type="text" class="form-control" name="{{$locale->lang}}[description]"
                                      id="{{$locale->lang}}[description]"

                                      required rows="3">{{old("$locale->lang.description",@$garage->translate($locale->lang)->description)}}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="{{$locale->lang}}[address]">
                                                    {{__('cp.address')}}<span class="symbol">*</span>
                                                </label>
                                                <div class="col-md-3">
                                                    <input class="form-control" name="{{$locale->lang}}[address]"
                                                           id="{{$locale->lang}}[address]" value="{{old("$locale->lang.address",@$garage->translate($locale->lang)->address)}}"
                                                           required>
                                                </div>
                                            </div>

                                        </div>
                                    @endforeach

                                </div>
                            </div>

                        </fieldset>
                        <fieldset>
                            <legend>{{__('cp.user_info')}}</legend>

                            <div class="form-group">
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="name">
                                        {{__('cp.garage_owner_name')}}
                                        <span class="symbol">*</span>
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" name="name" id="name"
                                               value="{{ old('name' ,$garage->user->name) }}" required>
                                    </div>
                                    <label class="col-sm-2 control-label" for="email">
                                        {{__('cp.email')}}
                                        <span class="symbol">*</span>
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" name="email"
                                               value="{{ old('email',$garage->user->email) }}"
                                               required>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="row">
                                    <label class="col-sm-2 control-label" for="mobile">
                                        {{__('cp.mobile')}}
                                        <span class="symbol">*</span>
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text"
                                               onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"

                                               class="form-control" name="mobile" id="mobile"
                                               value="{{ old('mobile',$garage->user->mobile) }}" required>
                                    </div>

                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>{{__('cp.more_info')}}</legend>



                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="carTypes[]">
                                    {{__('cp.carTypes')}}
                                </label>
                                <div class="col-md-3">
                                    <select class="form-control select2" id="carTypes[]" multiple name="carTypes[]"
                                            required>
                                        <option value="">{{__('cp.select')}}</option>
                                        @php
                                            $selected_car_types = $garage->carTypes->pluck('id')->toArray();

                                        @endphp
                                        @foreach($carTypes as $one)
                                            <option
                                                value="{{$one->id}}" {{in_array($one->id,old('carTypes',$selected_car_types))?'selected':''}}>{{$one->title}}</option>
                                        @endforeach

                                    </select>
                                </div>

                                <label class="col-sm-2 control-label" for="plan_id">
                                    {{__('cp.plan')}}<span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <select class="form-control select2" id="plan_id" name="plan_id"
                                            required >
                                        <option value="">{{__('cp.select')}}</option>

                                        @foreach($plans as $one)
                                            <option
                                                value="{{$one->id}}" {{$one->id==old('plan_id',$garage->plan_id)?'selected':''}}>{{$one->title}}</option>
                                        @endforeach

                                    </select>
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="update_plan">
                                    {{__('cp.update_plan')}}
                                </label>
                                <div class="col-md-3">
                                    <input id="update_plan" type="checkbox" name="update_plan" class="make-switch"
                                           data-on="success" data-on-color="success" data-off-color="danger"
                                           data-size="small" value="0">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="is_special">
                                    {{__('cp.is_special')}}
                                </label>
                                <div class="col-md-3">
                                    <input id="is_special" type="checkbox" name="is_special" class="make-switch"
                                           data-on="success" data-on-color="success" data-off-color="danger"
                                           data-size="small"
                                           {{old('is_special', $garage->is_special) ==1? "checked":""}} value="1">
                                </div>
                            </div>
                            <div class="form-group">


                                <label class="col-sm-2 control-label" for="category_id">
                                    {{__('cp.category')}} <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <select class="form-control select2" id="category_id" name="category_id"
                                            required>
                                        <option value="">{{__('cp.select')}}</option>
                                        @foreach($categories as $one)
                                            <option
                                                value="{{$one->id}}" {{$one->id==old('category_id',$garage->category_id)?'selected':''}} >{{$one->title}}</option>
                                        @endforeach

                                    </select>
                                </div>
                                <label class="col-sm-2 control-label" for="services[]">
                                    {{__('cp.services')}} <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <select class="form-control select2 services" id="services[]" multiple
                                            name="services[]"
                                            required>
                                        <option value="">{{__('cp.select')}}</option>
                                        @php
                                            $selected_services = $garage->services->pluck('id')->toArray();
                                        @endphp
                                        @foreach($services as $one)
                                            <option
                                                value="{{$one->id}}" {{in_array($one->id,old('services',$selected_services))?'selected':''}}>{{$one->title}}</option>
                                        @endforeach

                                    </select>
                                </div>

                            </div>

                        </fieldset>


                        <fieldset>
                            <legend>{{__('cp.image')}}</legend>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <div class="fileinput-new thumbnail"
                                         onclick="document.getElementById('edit_image').click()"
                                         style="cursor:pointer">
                                        <img src="{{$garage->user->image_url}}" id="editImage"
                                             style="border-radius: 10% !important;">
                                    </div>
                                    <div class="btn red"
                                         onclick="document.getElementById('edit_image').click()">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <input type="file" class="form-control" name="image"
                                           id="edit_image"
                                           style="display:none">
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>{{__('cp.images')}}</legend>
                            <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                <div class="col-md-6 col-md-offset-3">
                                    @if ($errors->has('image'))
                                        <span class="help-block">
                                            <strong>{{ $errors->first('image') }}</strong>
                                        </span>
                                    @endif
                                    <div class="imageupload" style="display:flex;flex-wrap:wrap">
                                        @foreach($garage->images as $one)
                                            <div class="imageBox text-center"
                                                 style="width:150px;height:190px;margin:5px">
                                                <img src="{{$one->image_url}}"
                                                     style="width:150px;height:150px; margin-bottom:5px;border-radius: 10% !important;">
                                                <button class="btn btn-danger deleteImage"
                                                        type="button">{{__("cp.remove")}}</button>
                                                <input class="attachedValues" type="hidden" name="oldImages[]"
                                                       value="{{$one->id}}">
                                            </div>
                                        @endforeach
                                    </div>
                                    <div class="input-group control-group increment" style="margin-top:15px;">
                                        <div class="input-group-btn"
                                             onclick="document.getElementById('all_images').click()">
                                            <button class="btn btn-success" type="button"><i
                                                    class="glyphicon glyphicon-plus"></i>{{__("cp.addImages")}}</button>
                                        </div>
                                        <input type="file" class="form-control hidden" accept="image/*" name="images[]"
                                               id="all_images"
                                               multiple/>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                                <legend>{{""}}</legend>
                                <input id="searchInput" class="input-controls" type="text"
                                       placeholder="{{__('cp.search')}}">
                                <div class="map" id="map" style="width: 100%; height: 300px;"></div>
                                <div class="form_area">
                                   {{-- <input type="hidden" value="{{$garage->address}}" name="address" id="location">--}}
                                    <input type="hidden" value="{{$garage->lat}}" name="lat" id="lat">
                                    <input type="hidden" value="{{$garage->lat}}" name="lng" id="lng">
                                </div>

                            </fieldset>
                        
                    
                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green">{{__('cp.submit')}}</button>
                                    <a href="{{url(getLocal().'/admin/garage')}}"
                                       class="btn default">{{__('cp.cancel')}}</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('script')
    
    <script type="text/javascript">

/* script */
        function initialize() {
            var latlng = new google.maps.LatLng('{{$garage->lat}}', '{{$garage->lng}}');
            var map = new google.maps.Map(document.getElementById('map'), {
                center: latlng,
                zoom: 10
            });
            var marker = new google.maps.Marker({
                map: map,
                position: latlng,
                draggable: true,
                anchorPoint: new google.maps.Point(0, -29)
            });
            var input = document.getElementById('searchInput');
            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
            var geocoder = new google.maps.Geocoder();
            var autocomplete = new google.maps.places.Autocomplete(input);
            autocomplete.bindTo('bounds', map);
            var infowindow = new google.maps.InfoWindow();
            autocomplete.addListener('place_changed', function () {
                infowindow.close();
                marker.setVisible(false);
                var place = autocomplete.getPlace();
                if (!place.geometry) {
                    window.alert("Autocomplete's returned place contains no geometry");
                    return;
                }

                // If the place has a geometry, then present it on a map.
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);
                }

                marker.setPosition(place.geometry.location);
                marker.setVisible(true);

                bindDataToForm(place.formatted_address, place.geometry.location.lat(), place.geometry.location.lng());
                infowindow.setContent(place.formatted_address);
                infowindow.open(map, marker);

            });
            // this function will work on marker move event into map
            google.maps.event.addListener(marker, 'dragend', function () {
                geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (results[0]) {
                            bindDataToForm(results[0].formatted_address, marker.getPosition().lat(), marker.getPosition().lng());
                            infowindow.setContent(results[0].formatted_address);
                            infowindow.open(map, marker);
                        }
                    }
                });
            });
        }

        function bindDataToForm(address, lat, lng) {
         //   document.getElementById('location').value = address;
            document.getElementById('lat').value = lat;
            document.getElementById('lng').value = lng;
//                                                console.log('location = ' + address);
//                                                console.log('lat = ' + lat);
//                                                console.log('lng = ' + lng);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
      
    </script>
    <script type="text/javascript">

        $(document).ready(function () {

            $(".btn-success").click(function () {
                var html = $(".clone").html();
                $(".increment").after(html);
            });

            $("body").on("click", ".btn-danger", function () {
                $(this).parents(".control-group").remove();
            });

        });

    </script>

    <script type="text/javascript">

        $('#all_images').on('change', function (e) {
            readURLMultiple(this, $('.imageupload'));
        });

        $('#edit_image').on('change', function (e) {

            readURL(this, $('#editImage'));

        });

        $("#featured").on('switchChange.bootstrapSwitch', function (e, data) {
            if (data == true) {
                $(this).val(1);
            } else {
                $(this).val(0);
            }
        });


    </script>


@endsection
