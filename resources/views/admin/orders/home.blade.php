@extends('layout.adminLayout')
@section('title') {{__('cp.orders')}}
@endsection
@section('css')
@endsection
@section('content')
    <div class="portlet light bordered">
        <div class="portlet-body">
            <div class="table-toolbar">
                <div class="table-toolbar">

                    <div class="row">

                        <div class="col-sm-9">

                            <div class="btn-group">

                                <button class="btn sbold blue btn--filter">{{__('cp.filter')}}

                                    <i class="fa fa-search"></i>

                                </button>


                            </div>

                        </div>


                    </div>

                    <div class="box-filter-collapse">

                        <form class="form-horizontal" method="get" action="{{url(getLocal().'/admin/orders')}}">

                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">{{__('cp.status')}}</label>
                                        <div class="col-md-9">
                                            <select id="multiple2" class="form-control"
                                                    name="status">
                                                <option value="">{{__('cp.all')}}</option>
                                                @foreach(\App\Models\Order::status as $value)
                                                <option value="{{$value}}">{{__("cp.$value")}}</option>
                                                @endforeach


                                            </select>
                                        </div>
                                    </div>
                                </div>



                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">{{__('cp.customer_name')}}</label>

                                        <div class="col-md-9">

                                            <input type="text" class="form-control" name="userName"

                                                   placeholder="{{__('cp.customer_name')}}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">{{__('cp.mobile')}}</label>

                                        <div class="col-md-9">

                                            <input type="text" class="form-control" name="mobile"

                                                   placeholder="{{__('cp.mobile')}}">
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-4">
                                    <div class="col-md-offset-3 col-md-9">

                                        <button type="submit" class="btn sbold blue">{{__('cp.search')}}

                                            <i class="fa fa-search"></i>

                                        </button>

                                        <a href="{{url(app()->getLocale().'/admin/orders')}}" type="submit"

                                           class="btn sbold btn-default ">{{__('cp.reset')}}

                                            <i class="fa fa-refresh"></i>

                                        </a>

                                    </div>

                                </div>

                            </div>


                        </form>

                    </div>

                </div>

                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="toolsTable1">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th> {{ucwords(__('cp.order_id'))}}</th>
                        <th> {{ucwords(__('cp.name'))}}</th>
                        <th> {{ucwords(__('cp.mobile'))}}</th>

                        <th> {{ucwords(__('cp.garage_name'))}}</th>
                        <th> {{ucwords(__('cp.status'))}}</th>
                        <th> {{ucwords(__('cp.created'))}}</th>

                        <th> {{ucwords(__('cp.action'))}}</th>

                    </tr>
                    </thead>
                    <tbody>
                    @forelse($items as $item)
                        <tr class="odd gradeX" id="tr-{{$item->id}}">
                            <td>
                                {{$loop->iteration}}
                            </td>
                            <td> {{$item->id}}</td>
                            <td> {{@$item->user->name}}</td>
                            <td> {{@$item->user->mobile}}</td>

                            <td>{{$item->garage->user->name}}</td>

                            <td>
                                @php

                                    $status = '';
                                    $cls = '';
                                    if ($item->status == 'rejected') {
                                        $status = 'rejected';
                                        $cls = 'label-danger';
                                    } elseif ($item->status == 'waiting') {
                                        $status = 'waiting';
                                        $cls = 'label-warning';
                                    } else {
                                        $status = 'complete';
                                        $cls = 'label-success';
                                    }
                                @endphp
                                <span class="label label-sm {{$cls}}" id="label-{{$item->id}}">
                                {{__('cp.'.$status)}}
                            </span>

                            </td>

                            <td class="center">{{$item->created_at}}</td>

                            <td>

                                <div class="btn-group btn-action">

                                    <div class="btn-group btn-action" id="actionId-{{$item->id}}">

                                    </div>

                                    <a href="{{url(getLocal().'/admin/orders/'.$item->id.'')}}"
                                       class="btn btn-xs blue tooltips" data-container="body" data-placement="top"
                                       data-original-title="{{__('cp.show')}}"><i class="fa fa-eye"></i>
                                    </a>




                                </div>
                            </td>
                        </tr>
                    @empty

                    @endforelse
                    </tbody>
                </table>
                {{$items->appends($_GET)->links() }}
            </div>
        </div>
        @endsection

        @section('js')
        @endsection
        @section('script')
            <script>

                function change_ordrSts(id, sts, e) {
                    e.preventDefault();

                    var url = '{{url(getLocal()."/admin/change_orderSts")}}/' + id;
                    var csrf_token = '{{csrf_token()}}';
                    $.ajax({
                        type: 'post',
                        headers: {'X-CSRF-TOKEN': csrf_token},
                        url: url,
                        data: {sts: sts, _token: csrf_token},
                        success: function (response) {
                            if (response === 'success') {

                                $('#label-' + id).removeClass();
                                $("#actionId-" + id).html('');

                                if (sts == 0) {
                                    $('#label-' + id).html("{{__('cp.preparing')}}");
                                    $('#label-' + id).addClass('label label-sm label-info');
                                    $("#actionId-" + id).append('<a href="#" onclick="change_ordrSts(' + id + ',\'1\',event)" class="btn btn-xs blue tooltips" data-container="body" data-placement="top" data-original-title="{{__('cp.onDelivery')}}"><i class="fa fa-motorcycle"></i></a>');
                                } else if (sts == 1) {
                                    $('#label-' + id).html("{{__('cp.onDelivery')}}");
                                    $('#label-' + id).addClass('label label-sm label-warning');
                                    $("#actionId-" + id).append('<a href="#" onclick="change_ordrSts(' + id + ',\'2\',event)" class="btn btn-xs blue tooltips" data-container="body" data-placement="top" data-original-title="{{__('cp.complete')}}"><i class="fa fa-lock"></i></a>');
                                } else if (sts == 2) {
                                    $('#label-' + id).html("{{__('cp.complete')}}");
                                    $('#label-' + id).addClass('label label-sm label-success');
                                }

                            } else {
                                swal('Error', {icon: "error"});
                            }
                        },
                        error: function (e) {

                        }
                    });

                }

                function openWindow($url) {
                    window.open($url, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=200,width=800,height=700");
                }


                $(document).ready(function () {
                    setTimeout(function () {
                        window.location.reload();
                    }, 60000);
                });


            </script>
@endsection
