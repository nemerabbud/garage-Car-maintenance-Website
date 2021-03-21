@extends('layout.adminLayout')
@section('title') {{__('cp.garageRequests')}}
@endsection
@section('css')

    @if(app()->getLocale() == 'ar')
        @php
            $align='right';
            $pxl='885px';
        @endphp
    @else
        @php
            $align='left';
            $pxl='920px';
        @endphp
    @endif

@endsection
@section('content')
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN SAMPLE FORM PORTLET-->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-settings font-dark"></i>
                        <span class="caption-subject font-dark sbold uppercase" style="color: #e02222 !important;">

                            {{__('cp.garageRequests-details')}}
                        </span>
                        @php


                            $data =  [
                                    'rejected'=>[
                                        'status'=>'rejected',
                                        'class'=>'label-danger',
                                    ],'waiting'=>[
                                        'status'=>'waiting',
                                        'class'=>'label-warning',
                                    ],'accepted'=>
                                [
                                        'status'=>'accepted',
                                        'class'=>'label-success']][$garageRequest->status];

                        @endphp
                        <span class="label label-sm {{$data['class']}}" id="label-{{$garageRequest->id}}">
                                {{__('cp.'.$data['status'])}}
                            </span>


                    </div>
                </div>
                <div class="portlet-body form">
                    <form method="post" action="{{url(app()->getLocale().'/admin/garageRequests/'.$garageRequest->id)}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form" id="form_company">
                        @csrf
                        @method('put')

                        <br>
                        <fieldset>
                            <legend>{{__('cp.user_info')}}</legend>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.name'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$garageRequest->owner_name}}</label>
                                </div>

                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.mobile'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$garageRequest->mobile}}</label>
                                </div>
                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.email'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for=""><a
                                            href="mailto:{{$garageRequest->email}}">{{$garageRequest->email}}</a>
                                    </label>
                                </div>


                            </div>
                        </fieldset>
                        <br>
                        <br>
                        <br>
                        <fieldset>
                            <legend>{{__('cp.garage_info')}}</legend>

                            @foreach($locales as $locale)
                                <div class="form-group col-md-6 border-left">

                                    <div class="col-md-12">
                                        <b>{{ucwords(__('cp.title_'.$locale->lang))}} : </b>

                                        <label class="control-label"
                                               for=""> {{@$garageRequest->translate($locale->lang)->title}}</label>
                                    </div>
                                    <br>
                                    <br>

                                    <div class="col-md-12">
                                        <b>{{ucwords(__('cp.description_'.$locale->lang))}}: </b>

                                        <label class="control-label"
                                               for="">{{@$garageRequest->translate($locale->lang)->description}}</label>
                                    </div>
                                    <br>
                                    <br>

                                    <div class="col-md-12">
                                        <b>{{ucwords(__('cp.address_'.$locale->lang))}}: </b>

                                        <label class="control-label"
                                               for="">{{@$garageRequest->translate($locale->lang)->address}}</label>
                                    </div>


                                </div>

                            @endforeach
                        </fieldset>
                        <br>
                        <br>
                        <br>


                        <fieldset>
                            <legend>{{__('cp.images')}}</legend>
                            <div class="col-md-6">
                                <label class="control-label">

                                    <b>{{ucwords(__('cp.logo'))}}: </b></label>

                                <img src="{{$garageRequest->logo_url}}" height="400" width="100%"/>

                            </div>
                            <div class="col-md-6">
                                <label class="control-label">

                                    <b>{{ucwords(__('cp.commercial_license_image'))}}: </b></label>

                                <img src="{{$garageRequest->commercial_license_image_url}}" height="400" width="100%"/>

                            </div>


                        </fieldset>
                        <br>
                        <hr>
                        <br>
                        <fieldset>
                            <div class="form-group" id="gover_option">
                                <label class="control-label col-md-3">
                                    <b>{{__('cp.status')}}</b>
                                </label>
                                <div class="col-md-9">

                                    <select id="multiple2" class="form-control"
                                            name="status"
                                            required {{($garageRequest->status !=='waiting') ? 'disabled': ''}}>
                                        <option></option>
                                        <option value="rejected" {{old('status',$garageRequest->status) == 'rejected'?"selected":''}}>{{__('cp.rejected')}}</option>
                                        <option value="accepted" {{old('status',$garageRequest->status) == 'accepted'?"selected":''}}>{{__('cp.accepted')}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" id="reason_reject_message"
                                @if($garageRequest->status !== 'rejected')
                                 style="display: none"

                                @endif
                            >
                                <label class="control-label col-md-3">
                                    <b>{{__('cp.reason_reject_message')}}</b>
                                </label>
                                <div class="col-md-9">

                                    <textarea name="reason_reject_message" rows="4"
                                              @if($garageRequest->status === 'rejected')
                                              disabled
                                              @endif
                                              class="form-control"> {{old('reason_reject_message' , $garageRequest->reason_reject_message)}}</textarea>
                                </div>
                            </div>
                        </fieldset>


                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    @if($garageRequest->status ==='waiting')
                                    <button type="submit" class="btn green">{{__('cp.submit')}}</button>
                                    @endif
                                    <a href="{{url(getLocal().'/admin/garageRequests')}}"
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
    <script>
        $(document).ready(function () {

            $("[name=status]").on("change", function (evt) {
                $value = $(this).val();
                if ($value === "rejected") {
                    $('[name=reason_reject_message]').attr('required', true).parents('.form-group').show();
                    // $('[name=reason_reject_message]').attr('required',true);
                } else {

                    $('[name=reason_reject_message]').attr('required', false).parents('.form-group').hide();
                }

            });
        });


    </script>
@endsection
