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
{{-- <style>
    .stamp
{
	position:absolute; top: 180px; {{$align}}:900px; background:url({{url('uploads/images/products/draft.png')}}) no-repeat;
	width:200px;
	height:180px;
}

.completed
{
	position:absolute; top: 190px; {{$align}}:{{$pxl}}; background:url({{url('uploads/images/products/completed.png')}}) no-repeat;
	width:200px;
	height:180px;
}

</style> --}}
@endsection
@section('content')
    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN SAMPLE FORM PORTLET-->
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                      <i class="icon-settings font-dark"></i>
                      <span class="caption-subject font-dark sbold uppercase" style="color: #e02222 !important;">{{__('cp.order-details')}} ({{__('cp.order_date').": ".$order->created_at->toDateString()." ".__('cp.order_time').": ".$order->created_at->toTimeString()}})</span>

{{--                                 @if(!($order->ordered_date > $order->created_at))--}}
{{--                                    <a href="#" onclick="openWindow('{{url('http://maps.google.com/maps?z=12&t=m&q=loc:'.$order->latitude .'+'.$order->longitude)}}')" class="btn default"><i class="fa fa-map-marker"></i></a>--}}
{{--                                  @endif--}}

                    </div>
                </div>
                <div class="portlet-body form">
                    <form method="post" action="{{url(app()->getLocale().'/admin/orders/'.$order->id)}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form" id="form_company">
                        {{ csrf_field() }}
                        {{ method_field('PATCH')}}

                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">
                                    <b>{{ucwords(__('cp.customer_name'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->user->name}}</label>
                                </div>

                                <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.customer_mobile'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->user->mobile}}</label>
                                </div>

{{--                                 <label class="col-sm-2 control-label" for="">--}}
{{--                                   <b>{{__('cp.city')}}: </b>--}}
{{--                                </label>--}}
{{--                                <div class="col-md-2">--}}
{{--                                    <label class="control-label" for="">{{$order->city->name}}</label>--}}
{{--                                </div>--}}

                            </div>
                        </fieldset>
                    {{--    @if(!($order->ordered_date > $order->created_at))
                        <fieldset>
                            <div class="form-group">

                                --}}{{-- <label class="col-sm-2 control-label" for="">
                                  <b> {{__('cp.address')}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{$order->delivery_address}}</label>
                                </div> --}}{{--

                                <label class="col-sm-2 control-label" for="">
                                   <b>{{__('cp.discount_code')}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">
                                        @if (@$order->code_name != null)
                                        {{@$order->code_name}}
                                        @endif
                                    </label>
                                </div>

                                <label class="col-sm-2 control-label" for="">
                                   <b>{{__('cp.discount%')}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">
                                        @if (@$order->code_name != null)
                                            {{@$order->discount_code}}%
                                        @endif
                                    </label>
                                </div>

                                   <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.invoice_discount_sar'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{@$order->invoice_discount}}</label>
                                </div>

                            </div>
                        </fieldset>
                            @endif--}}
                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.total_sar'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{@$order->full_total}}</label>
                                </div>



                                <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.total_price_sar'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{@$order->total_price}}</label>
                                </div>

                                <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.ordered_date'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{@$order->ordered_date }}</label>
                                </div>


                            </div>
                        </fieldset>
                        @if($order->type==1)
                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.from'))}} : </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{@$order->from_name}}</label>
                                </div>

                                 <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.to'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{@$order->to_name}}</label>
                                </div>

                                <label class="col-sm-2 control-label" for="">
                                   <b>{{ucwords(__('cp.message'))}}: </b>
                                </label>
                                <div class="col-md-2">
                                    <label class="control-label" for="">{{@$order->gift_message}}</label>
                                </div>


                            </div>
                        </fieldset>
                        @endif
                        <div class="row">
                            <table class="table table-striped table-bordered  table-checkable order-column" >
                                <thead>
                                <tr>
                                    <th> #</th>
                                    <th> {{ucwords(__('cp.product_image'))}}</th>
                                    <th> {{ucwords(__('cp.name'))}}</th>
                                    <th> {{ucwords(__('cp.quantity'))}}</th>
                                    <th> {{ucwords(__('cp.discount%'))}}</th>
                                    <th> {{ucwords(__('cp.offer_price'))}}</th>
                                    <th> {{ucwords(__('cp.price_sar'))}}</th>
                                    <th> {{ucwords(__('cp.total'))}}</th>
                                </tr>
                                </thead>
                                <tbody>
{{--                                @forelse($products as $one)--}}
{{--                                    <tr class="odd gradeX">--}}
{{--                                        <td>{{$loop->iteration}}</td>--}}
{{--                                        <td><img src="{{$one->product->image}}" width="40px" height="40px"></td>--}}
{{--                                        <td>{{@$one->product->name}}</td>--}}
{{--                                        <td>{{@$one->quantity}}</td>--}}
{{--                                        <td>{{@$one->discount}}</td>--}}
{{--                                        <td>{{@$one->offer_price}}</td>--}}
{{--                                        <td>{{@$one->price}}</td>--}}
{{--                                        @if(@$one->offer_price !=0)--}}
{{--                                         <td>{{@$one->offer_price * @$one->quantity }}</td>--}}
{{--                                         @else--}}
{{--                                           <td>{{@$one->price * @$one->quantity}}</td>--}}
{{--                                         @endif--}}
{{--                                        <!--<td>{{@$one->price * @$one->quantity - @$one->offer_price}}</td>-->--}}
{{--                                        <td>--}}

{{--                                                     <td>--}}
{{--                                                <table class="table table-striped table-bordered table-hover table-checkable order-column" >--}}
{{--                                                    <thead>--}}
{{--                                                    <tr>--}}
{{--                                                        <th> {{ucwords(__('cp.additions'))}} </th>--}}

{{--                                                        <th> {{ucwords(__('cp.price'))}} </th>--}}


{{--                                                    </tr>--}}
{{--                                                    </thead>--}}
{{--                                                    <tbody>--}}
{{--                                                    @if(!empty($one->additions))--}}
{{--                                                        @forelse($one->additions as $additions)--}}
{{--                                                            <tr class="odd gradeX" id="tr-{{$one->id}}">--}}
{{--                                                                <td>{{@$additions->addition->name}}</td>--}}

{{--                                                                <td>{{@$additions->addition->price}}</td>--}}

{{--                                                            </tr>--}}

{{--                                                        @empty--}}

{{--                                                        @endforelse--}}
{{--                                                    @endif--}}
{{--                                                    </tbody>--}}
{{--                                                </table>--}}

{{--                                        </td>--}}

{{--                                    </tr>--}}
{{--                                @empty--}}
{{--                                    {{__('cp.no')}}--}}
{{--                                @endforelse--}}
                                </tbody>
                            </table>
                        </div>


                        <fieldset style="margin-top:40px">
                            {{-- <div class="form-group" id="gover_option">
                                <label class="control-label col-md-3">
                                    <b>{{__('cp.invoice_discount')}} ( )</b>
                                </label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="invoice_discount" id="invoice_discount" value="{{@$order->invoice_discount}}" {{($order->status ==2) ? 'disabled': ''}} />
                                </div>
                            </div> --}}
                            <div class="form-group" id="gover_option">
                                <label class="control-label col-md-3">
                                    <b>{{__('cp.order_status')}}</b>
                                </label>
                                <div class="col-md-3">
                                    <select id="multiple2" class="form-control"
                                            name="status" {{($order->status ==2) ? 'disabled': ''}}>

                                        @if($order->status == -1)
                                        <option value="0">{{__('cp.preparing')}}</option>
                                        @elseif($order->status == 0)
                                        <option value="1">{{__('cp.onDelivery')}}</option>
                                        @elseif($order->status == 1 || $order->status == 2)
                                        <option value="2">{{__('cp.complete')}}</option>
                                        @endif
                                    </select>
                                </div>
                            </div>

                        </fieldset>


                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green">{{__('cp.submit')}}</button>
                                    <a href="{{url(getLocal().'/admin/orders')}}" class="btn default">{{__('cp.cancel')}}</a>
                                </div>
                            </div>
                        </div>

                        </form>



                    </div>
                </div>
            </div>
        </div>
        @if(@$order->status != 2)
        <div class="stamp"></div>
        @else
        <div class="completed"></div>
        @endif
    </div>
@endsection
@section('js')
@endsection
@section('script')
    <script>
    $(document).ready(function () {

    $("#invoice_discount").on("input", function(evt) {
   var self = $(this);
   self.val(self.val().replace(/[^0-9\.]/g, ''));
   if ((evt.which != 46 || self.val().indexOf('.') != -1) && (evt.which < 48 || evt.which > 57))
   {
     evt.preventDefault();
   }
 });
    });


                      function openWindow($url)
        {
            window.open($url, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=200,width=800,height=700");
        }

    </script>
@endsection
