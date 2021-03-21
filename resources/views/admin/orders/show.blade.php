@extends('layout.adminLayout')
@section('title') {{__('cp.order-details')}}
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

                            {{__('cp.order-details')}} ({{__('cp.order_date').": ".$order->created_at->toDateString()." ".__('cp.order_time').": ".$order->created_at->toTimeString()}})
                        </span>
                        @php

                            $status = '';
                            $cls = '';
                            if ($order->status == 'rejected') {
                                $status = 'rejected';
                                $cls = 'label-danger';
                            } elseif ($order->status == 'waiting') {
                                $status = 'waiting';
                                $cls = 'label-warning';
                            } else {
                                $status = 'complete';
                                $cls = 'label-success';
                            }
                        @endphp
                        <span class="label label-sm {{$cls}}" id="label-{{$order->id}}">
                                {{__('cp.'.$status)}}
                            </span>


                    </div>
                </div>
                <div class="portlet-body form">
                    <br>
                        <fieldset>
                            <legend>{{__('cp.user_info')}}</legend>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.name'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->user->name}}</label>
                                </div>

                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.mobile'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->user->mobile}}</label>
                                </div>
                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.email'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->user->email}}</label>
                                </div>


                            </div>
                        </fieldset>
                         <br>
                         <br>
                         <br>
                        <fieldset>
                            <legend>{{__('cp.garage_info')}}</legend>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.name'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->garage->user->name}}</label>
                                </div>

                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.mobile'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->garage->user->mobile}}</label>
                                </div>
                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.email'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->garage->user->email}}</label>
                                </div>


                            </div>
                        </fieldset>
                    <br>
                    <br>
                    <br>

                    <fieldset>
                        <legend>{{__('cp.images')}}</legend>

                        <div class="form-group">

                            @foreach($order->images as $image)
                            <img src="{{$image->image_url}}" width="200" height="200">
                            @endforeach
                        </div>
                    </fieldset>

                        <fieldset>
                            <legend>{{__('cp.services')}}</legend>

                            <div class="row">
                                <table class="table table-striped table-bordered  table-checkable order-column">
                                    <thead>
                                    <tr>
                                        <th> #</th>
                                        <th> {{ucwords(__('cp.image'))}}</th>
                                        <th> {{ucwords(__('cp.title'))}}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($order->services as $service)
                                        <tr class="odd gradeX">
                                            <td>{{$loop->iteration}}</td>
                                            <td><img src="{{$service->image_url}}" width="50" height="50"  ></td>
                                            <td>{{$service->title}}</td>
                                        </tr>
                                    @empty
                                        {{('cp.no')}}
                                    @endforelse
                                    </tbody>
                                </table>
                            </div>

                        </fieldset>


                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <a href="{{url(getLocal().'/admin/orders')}}"
                                       class="btn default">{{__('cp.cancel')}}</a>
                                </div>
                            </div>
                        </div>



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

            $("#invoice_discount").on("input", function (evt) {
                var self = $(this);
                self.val(self.val().replace(/[^0-9\.]/g, ''));
                if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57)) {
                    evt.preventDefault();
                }
            });
        });


        function openWindow($url) {
            window.open($url, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=200,width=800,height=700");
        }

    </script>
@endsection
