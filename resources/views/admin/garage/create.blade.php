@extends('layout.adminLayout')
@section('title') {{ucwords(__('cp.manage_garages'))}}
@endsection
@section('css')
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
                              style="color: #e02222 !important;"> {{__('cp.add')}} </span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form method="post" action="{{url(app()->getLocale().'/admin/garage')}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form" id="form">
                        {{ csrf_field() }}

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
                                                           id="{{$locale->lang}}[name]" value="{{old("$locale->lang.name")}}"
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

                                                  required rows="3">{{old("$locale->lang.description")}}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="{{$locale->lang}}[address]">
                                                    {{__('cp.address')}}<span class="symbol">*</span>
                                                </label>
                                                <div class="col-md-3">
                                                    <input class="form-control" name="{{$locale->lang}}[address]"
                                                           id="{{$locale->lang}}[address]" value="{{old("$locale->lang.address")}}"
                                                           required>
                                                </div>
                                            </div>

                                        </div>
                                    @endforeach

                                </div>
                            </div>

                        </fieldset>
                        <input type="hidden" name="lat" id="lat" value="">
                        <input type="hidden" name="lng" id="lng" value="">

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
                                               value="{{ old('name') }}" required>
                                    </div>
                                    <label class="col-sm-2 control-label" for="email">
                                        {{__('cp.email')}}
                                        <span class="symbol">*</span>
                                    </label>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" name="email" value="{{ old('email') }}"
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
                                               value="{{ old('mobile') }}" required>
                                    </div>
                                    <label class="col-sm-2 control-label" for="password">
                                        {{__('cp.password')}}
                                        <span class="symbol">*</span>
                                    </label>
                                    <div class="col-md-3">
                                        <input type="password" class="form-control" name="password"
                                               value="{{ old('password') }}" id="password"
                                               required>
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
                                        @foreach($carTypes as $one)
                                            <option
                                                value="{{$one->id}}" {{in_array($one->id,old('carTypes',[]))?'selected':''}}>{{$one->title}}</option>
                                        @endforeach

                                    </select>
                                </div>

                                <label class="col-sm-2 control-label" for="plan_id">
                                    {{__('cp.plan')}}      <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <select class="form-control select2" id="plan_id" name="plan_id"
                                            required>
                                        <option value="">{{__('cp.select')}}</option>
                                        @foreach($plans as $one)
                                            <option
                                                value="{{$one->id}}" {{$one->id==old('plan_id')?'selected':''}}>{{$one->title}}</option>
                                        @endforeach

                                    </select>
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
                                           {{old('is_special') ==1? "checked":""}} value="1">
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="col-sm-2 control-label" for="category_id">
                                    {{__('cp.category')}}       <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <select class="form-control select2" id="category_id" name="category_id"
                                            required>
                                        <option value="">{{__('cp.select')}}</option>
                                        @foreach($categories as $one)
                                            <option
                                                value="{{$one->id}}" {{$one->id==old('category_id')?'selected':''}} >{{$one->title}}</option>
                                        @endforeach

                                    </select>
                                </div>
                                <label class="col-sm-2 control-label" for="services[]">
                                    {{__('cp.services')}}         <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <select class="form-control select2 services" id="services[]" multiple
                                            name="services[]"
                                            required>
                                        <option value="">{{__('cp.select')}}</option>
                                        @foreach($services as $one)
                                            <option
                                                value="{{$one->id}}" {{in_array($one->id,old('services',[]))?'selected':''}}>{{$one->title}}</option>
                                        @endforeach

                                    </select>
                                </div>

                            </div>

                        </fieldset>


                        <fieldset>
                            <legend>{{__('cp.profile_image')}}</legend>
                            <div class="form-group {{ $errors->has('image') ? ' has-error' : '' }}">
                                <div class="col-md-6 col-md-offset-3">
                                    @if ($errors->has('image'))
                                        <span class="help-block">
                                                <strong>{{ $errors->first('image') }}</strong>
                                            </span>
                                    @endif
                                    <div class="fileinput-new thumbnail"
                                         onclick="document.getElementById('edit_image').click()"
                                         style="cursor:pointer">
                                        <img src=" {{url(admin_assets('/images/ChoosePhoto.png'))}}" id="editImage">
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

                                    </div>
                                    <div class="input-group control-group increment">
                                        <div class="input-group-btn"
                                             onclick="document.getElementById('all_images').click()">
                                            <button class="btn btn-success" type="button"><i
                                                    class="glyphicon glyphicon-plus"></i>{{__("cp.addImages")}}
                                            </button>
                                        </div>
                                        <input type="file" name="images[]" class="form-control hidden" accept="image/*"
                                               id="all_images" multiple/>
                                    </div>


                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <div id="map" style="height: 400px;width:100%"></div>

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
@section('js')

@endsection
@section('script')
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

            map = new google.maps.Map(document.getElementById("map"), {
                center: myLatLng,
                zoom: 8,
            });
            marker = new google.maps.Marker({

                position: myLatLng, // Brooklyn Coordinates
                map: map, //Map that we need to add
                // icon:'https://img.icons8.com/fluent/48/000000/marker-storm.png',
                // adding custom icons (Here I used a Flash logo marker)
                // draggarble: false// If set to true you can drag the marker
            });
            google.maps.event.addListener(map, "click", (event) => {
                // addMarker(event.latLng, map);
                marker.setPosition(event.latLng);
                marker.setMap(map);
                marker.setAnimation(google.maps.Animation.DROP);
                var lat = marker.getPosition().lat();
                var lng = marker.getPosition().lng();
                $("#lat").val(lat);
                $("#lng").val(lng)
            });

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                        const pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude,
                        };
                        map.setCenter(pos);
                        marker.setPosition(pos);
                        marker.setMap(map);
                        marker.setAnimation(google.maps.Animation.DROP);
                        var lat = marker.getPosition().lat();
                        var lng = marker.getPosition().lng();
                        $("#lat").val(lat);
                        $("#lng").val(lng)
                    }
                );
            }

        }

    </script>
    <script>


        $(document).on('change', '[name=category_id]', function () {
            $this = $(this);

            $category_id = $this.val();

            $.get("{{route('get_category_services')}}/" + $category_id, function (response) {
                $options = '<option value="">{{__('cp.select')}}</option>';

                response.services.forEach(function ($item, $index) {
                    $options += '<option value="' + $item.id + '">' + $item.title + '</option>';

                });

                $('select.services').html($options);


            });
        })

        $('#edit_image').on('change', function (e) {
            readURL(this, $('#editImage'));
        });


        $("#is_featured").on('switchChange.bootstrapSwitch', function (e, data) {
            if (data == true) {
                $(this).val(1);
            } else {
                $(this).val(0);
            }
        });


        $(document).on('change', '#country', function (e) {
            var id = $(this).val();
            var url = '{{url(getLocal()."/admin/getCity")}}/' + id;
            var csrf_token = '{{csrf_token()}}';
            $.ajax({
                type: 'GET',
                headers: {'X-CSRF-TOKEN': csrf_token},
                url: url,
                success: function (response) {
                    if (response.status == 'success') {
                        $('#city').html("");
                        for (var i = 0; response.city.length > i; i++) {
                            $('#city').append('<option value="' + response.city[i]['id'] + '" >' + response.city[i]['name'] + '</option>');
                        }
                    } else {
                    }
                },
                error: function (e) {
                }
            });
        });

        if ($('#country').val() != '') {

            var id = $('#country').val();
            var url = '{{url(getLocal()."/admin/getCity")}}/' + id;
            var csrf_token = '{{csrf_token()}}';
            $.ajax({
                type: 'GET',
                headers: {'X-CSRF-TOKEN': csrf_token},
                url: url,
                success: function (response) {
                    if (response.status == 'success') {
                        // alert(1111);

                        $('#city').html("");
                        var oldCity = '{{ old('city') }}';
                        var selected = "";
                        for (var i = 0; response.city.length > i; i++) {
                            if (response.city[i]['id'] == oldCity) {
                                selected = "selected";
                            }
                            $('#city').append('<option value="' + response.city[i]['id'] + '" ' + selected + '>' + response.city[i]['name'] + '</option>');
                        }
                    } else {
                    }
                },
                error: function (e) {
                }
            });

        }

    </script>
    <script>
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
