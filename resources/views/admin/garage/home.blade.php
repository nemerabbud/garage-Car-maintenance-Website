@extends('layout.adminLayout')
@section('title') {{__('cp.manage_garages')}}
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

                                <a href="{{url(app()->getLocale().'/admin/garage/create')}}" style="margin-right: 5px"
                                   class="btn sbold green">{{__('cp.add')}}
                                    <i class="fa fa-plus"></i>
                                </a>
                                <button class="btn sbold blue btn--filter">{{__('cp.filter')}}

                                    <i class="fa fa-search"></i>

                                </button>


                            </div>

                        </div>


                    </div>

                    <div class="box-filter-collapse">
                        <form class="form-horizontal" method="get" action="{{url(getLocal().'/admin/garage')}}">
                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">{{__('cp.status')}}</label>
                                        <div class="col-md-9">
                                            <select id="multiple2" class="form-control"
                                                    name="statusUser">
                                                <option value="">{{__('cp.all')}}</option>
                                                <option value="active">
                                                    {{__('cp.active')}}
                                                </option>
                                                <option value="not_active">
                                                    {{__('cp.not_active')}}
                                                </option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label class="col-md-3 control-label">{{__('cp.plan')}}</label>
                                        <div class="col-md-9">
                                            <select id="multiple2" class="form-control"
                                                    name="plan_id">
                                                <option value="">{{__('cp.plan')}}</option>
                                                @foreach($plans as $plan)
                                                    <option value="{{$plan->id}}">
                                                        {{$plan->title}}
                                                    </option>
                                                @endforeach


                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button type="submit" class="btn sbold blue">{{__('cp.search')}}
                                                <i class="fa fa-search"></i>
                                            </button>
                                            <a href="{{url('admin/users')}}" type="submit"
                                               class="btn sbold btn-default ">{{__('cp.reset')}}
                                                <i class="fa fa-refresh"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
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
                        </form>
                    </div>

                </div>

                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="toolsTable1">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th></th>
                        <th> {{ucwords(__('cp.name'))}}</th>
                        <th> {{ucwords(__('cp.mobile'))}}</th>
                        <th> {{ucwords(__('cp.plan_name'))}}</th>
                        <th> {{ucwords(__('cp.start_date'))}}</th>
                        <th> {{ucwords(__('cp.end_date'))}}</th>

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
                            <td><img src="{{$item->user->image_url}}" width="50" height="50"></td>

                            <td> {{@$item->name}}</td>
                            <td> {{@$item->user->mobile}}</td>
                            <td> {{@$item->plan->title??'-'}}</td>
                            <td> {{@$item->start_date??"-"}}</td>
                            <td> {{@$item->end_date??"-"}}</td>
                            <td> <span class="label label-sm {{ ($item->status == "active")
                                ? "label-info" : "label-danger"}} " id="label-{{$item->id}}">

                                {{__('cp.'.$item->status)}}
                            </span></td>

                            <td class="center">{{$item->created_at}}</td>

                            <td>

                                <div class="btn-group btn-action">


                                    <a href="{{url(getLocal().'/admin/garage/'.$item->id.'/edit')}}"
                                       class="btn btn-xs blue tooltips" data-container="body" data-placement="top"
                                       data-original-title="{{__('cp.edit')}}"><i class="fa fa-edit"></i>
                                    </a>
                                    <a href="{{url(getLocal().'/admin/garage/'.$item->user->id.'/edit_password')}}"
                                       class="btn btn-xs blue tooltips" data-container="body" data-placement="top"
                                       data-original-title="{{__('cp.edit_password')}}"><i class="fa fa-expeditedssl"></i></a>

                                    <a href="{{url(getLocal().'/admin/garage/'.$item->id.'/orders')}}"
                                       class="btn btn-xs blue tooltips" data-container="body" data-placement="top"
                                       data-original-title="{{__('cp.orders')}}"><i class="fa fa-list"></i>
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
@endsection
