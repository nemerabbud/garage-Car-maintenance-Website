@extends('layout.adminLayout')
@section('title')  {{ucwords(__('cp.setting'))}}
@endsection
@section('css')
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key={{env('APIGoogleKey')}}&callback=initMap">

    </script>
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
                              style="color: #e02222 !important;">{{__('cp.edit')}}{{__('cp.setting')}}</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form method="post" action="{{url(app()->getLocale().'/admin/settings')}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form" id="form">
                        {{ csrf_field() }}
                        <div class="form-body">

                            <fieldset>
                                <legend>{{__('cp.main_info')}}</legend>

                                @foreach($locales as $locale)

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="title_{{$locale->lang}}">
                                            {{__('cp.appName_'.$locale->lang)}}
                                        </label>
                                        <div class="col-md-3">
                                            <input type="text" class="form-control" id="title_{{$locale->lang}}"
                                                   name="{{$locale->lang}}[title]"
                                                   value="{{old("$locale->lang.title",@$settings->translate($locale->lang)->title)}}">
                                        </div>
                                    </div>
                                @endforeach

                                @foreach($locales as $locale)
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="description_{{$locale->lang}}">
                                            {{__('cp.description_'.$locale->lang)}}
                                        </label>
                                        <div class="col-md-3">
                                            <textarea type="text" class="form-control"
                                                      name="{{$locale->lang}}[description]"
                                                                rows="6"
                                                      id="description_{{$locale->lang}}">{{old("$locale->lang.description",@$settings->translate($locale->lang)->description)}}</textarea>

                                        </div>
                                    </div>
                                @endforeach

                            </fieldset>


                            <fieldset>
                                <legend>{{__('cp.about_app')}}</legend>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="app_store_url">
                                        {{__('cp.app_store_url')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="url" class="form-control" name="app_store_url"
                                               value="{{old('app_store_url',@$settings['app_store_url'])}}"
                                               id="app_store_url">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="play_store_url">
                                        {{__('cp.play_store_url')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="url" class="form-control" name="play_store_url"
                                               value="{{old('play_store_url',@$settings['play_store_url'])}}"
                                               id="play_store_url">
                                    </div>
                                </div>
                                @foreach($locales as $locale)
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="download_app_text_{{$locale->lang}}">
                                            {{__('cp.download_app_text_'.$locale->lang)}}
                                        </label>
                                        <div class="col-md-3">
                                        <textarea class="form-control" name="{{$locale->lang}}[download_app_text]"
                                                  id="download_app_text_{{$locale->lang}}" rows="6">{{old("$locale->lang.download_app_text",@@$settings->translate($locale->lang)->download_app_text)}}</textarea>
                                        </div>
                                    </div>
                                @endforeach


                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="rate_number">
                                        {{__('cp.rate_number')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="number" class="form-control" name="rate_number"
                                               value="{{old('rate_number',@$settings['rate_number'])}}"
                                               id="rate_number">
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>{{__('cp.contact_info')}}</legend>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="email">
                                        {{__('cp.email')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="email" class="form-control" name="email"
                                               value="{{old('email',@$settings['email'])}}" id="email">
                                    </div>
                                </div>
                                @foreach($locales as $locale)


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="address{{$locale->lang}}">
                                            {{__('cp.address_'.$locale->lang)}}
                                        </label>
                                        <div class="col-md-3">
                                            <input type="text" class="form-control" name="{{$locale->lang}}.address"
                                                   value="{{old("$locale->lang.address",@$settings->translate($locale->lang)->address)}}" id="address{{$locale->lang}}">
                                        </div>
                                    </div>
                                @endforeach

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="mobile">
                                        {{__('cp.mobile')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" name="mobile"
                                               value="{{old('mobile',@$settings['mobile'])}}" id="mobile">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="facebook">
                                        {{__('cp.facebook')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" name="facebook"
                                               value="{{old('facebook',@$settings['facebook'])}}" id="facebook">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="twitter">
                                        {{__('cp.twitter')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" name="twitter"
                                               value="{{old('twitter',@$settings['twitter'])}}" id="twitter">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="instagram">
                                        {{__('cp.instagram')}}
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" name="instagram"
                                               value="{{old('instagram',@$settings['instagram'])}}" id="instagram">
                                    </div>
                                </div>


                            </fieldset>

                            <fieldset>
                                <legend>{{__('cp.logo')}}</legend>
                                <div class="form-group">
                                    <div class="col-md-3 col-md-offset-3">
                                        <div class="fileinput-new thumbnail"
                                             onclick="document.getElementById('edit_logo').click()"
                                             style="cursor:pointer">
                                            <img src="{{@$settings['logo']}}" id="editlogo">
                                        </div>
                                        <div class="btn red"
                                             onclick="document.getElementById('edit_logo').click()">
                                            <i class="fa fa-pencil"></i>{{__('cp.change_image')}}
                                        </div>
                                        <input type="file" class="form-control" name="logo"
                                               id="edit_logo"
                                               style="display:none">
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>{{__('cp.favicon')}}</legend>
                                <div class="form-group">
                                    <div class="col-md-3 col-md-offset-3">
                                        <div class="fileinput-new thumbnail"
                                             onclick="document.getElementById('edit_favicon').click()"
                                             style="cursor:pointer">
                                            <img src="{{@$settings['favicon']}}" id="editfavicon">
                                        </div>
                                        <div class="btn red"
                                             onclick="document.getElementById('edit_favicon').click()">
                                            <i class="fa fa-pencil"></i>{{__('cp.change_image')}}
                                        </div>
                                        <input type="file" class="form-control" name="favicon"
                                               id="edit_favicon"
                                               style="display:none">
                                    </div>
                                </div>
                            </fieldset>

                            <fieldset>
                                <legend>{{__('cp.image')}}</legend>
                                <div class="form-group">
                                    <div class="col-md-3 col-md-offset-3">
                                        <div class="fileinput-new thumbnail"
                                             onclick="document.getElementById('edit_image').click()"
                                             style="cursor:pointer">
                                            <img src="{{@$settings['image']}}" id="editImage">
                                        </div>
                                        <div class="btn red"
                                             onclick="document.getElementById('edit_image').click()">
                                            <i class="fa fa-pencil"></i>{{__('cp.change_image')}}
                                        </div>
                                        <input type="file" class="form-control" name="image"
                                               id="edit_image"
                                               style="display:none">
                                    </div>
                                </div>
                            </fieldset>


                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">{{__('cp.submit')}}</button>
                                        <a href="{{url(getLocal().'/admin/home')}}"
                                           class="btn default">{{__('cp.cancel')}}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
@endsection
@section('script')
    <script>
        $('#edit_image').on('change', function (e) {
            readURL(this, $('#editImage'));
        });


        $('#edit_logo').on('change', function (e) {
            readURL(this, $('#editlogo'));
        });

        $('#edit_favicon').on('change', function (e) {
            readURL(this, $('#editfavicon'));
        });

        function format() {
            var e = document.getElementById("type");
            var type = e.options[e.selectedIndex].value;
            //alert(type);

            if (type == 2) {

                $('#park').removeClass('hidden');
                $('#edu').prop('required', true);
            }

            if (type == 1) {
                $('#park').addClass('hidden');
                $('#edu').prop('required', false);
            }

        }


        /*        /!* script *!/
                function initialize() {
                    var latlng = new google.maps.LatLng('{{@$settings['latitude']}}', '{{@$settings['longitude']}}');
            var map = new google.maps.Map(document.getElementById('map'), {
                center: latlng,
                zo@om: 10
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
        }*/

        function bindDataToForm(address, lat, lng) {
            document.getElementById('location').value = address;
            document.getElementById('lat').value = lat;
            document.getElementById('lng').value = lng;
//                                                console.log('location = ' + address);
//                                                console.log('lat = ' + lat);
//                                                console.log('lng = ' + lng);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
@endsection
