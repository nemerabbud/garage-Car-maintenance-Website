@extends('layout.adminLayout')
@section('title') {{__('cp.plans_management')}}
@endsection
@section('css')
@endsection

@section('content')

    <div class="portlet light bordered">
        <div class="portlet-body">
            <div class="table-toolbar">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="btn-group">
                            <a href="{{url(getLocal().'/admin/plans/create')}}" style="margin-right: 5px"
                               class="btn sbold green">{{__('cp.add')}}
                                <i class="fa fa-plus"></i>
                            </a>


                        <!-- <button class="btn sbold red event" href="#deleteAll" role="button"  data-toggle="modal">{{__('cp.delete')}}-->
                            <!--    <i class="fa fa-times"></i>-->
                            <!--</button>-->


                            <button class="btn sbold green event" href="#activation" role="button"
                                    data-toggle="modal">{{__('cp.active')}}
                                <i class="fa fa-check"></i>
                            </button>
                            <button class="btn sbold default event" href="#cancel_activation" role="button"
                                    data-toggle="modal">{{__('cp.not_active')}}
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
            <table class="table table-striped table-bordered table-hover table-checkable order-column" id="toolsTable">
                <thead>
                <tr>
                    <th>

                    </th>
                    <th> {{ucwords(__('cp.title'))}}</th>
                    <th> {{ucwords(__('cp.description'))}}</th>
                    <th> {{ucwords(__('cp.price'))}}</th>
                    <th> {{ucwords(__('cp.duration').'('.__('cp.days').')')}}</th>

                    <th> {{ucwords(__('cp.status'))}}</th>
                    <th> {{ucwords(__('cp.created'))}}</th>
                    <th> {{ucwords(__('cp.action'))}}</th>
                </tr>
                </thead>
                <tbody>
                @forelse($plans as $plan)
                    <tr class="odd gradeX" id="tr-{{$plan->id}}">
                        <td>
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes chkBox" value="{{$plan->id}}" name="chkBox"/>
                                <span></span>
                            </label>
                        </td>

                        <td>{{$plan->title}}</td>
                        <td>{{$plan->description}}</td>
                        <td>{{$plan->price}}</td>
                        <td>{{$plan->duration}}</td>


                        <td> <span class="label label-sm {{($plan->status == "active")
                                ? "label-info" : "label-danger"}}" id="label-{{$plan->id}}">
                                {{__('cp.'.$plan->status)}}

                            </span>
                        </td>

                        <td class="center">{{$plan->created_at}}</td>

                        <td>
                            <div class="btn-group btn-action">
                                <a href="{{url(getLocal().'/admin/plans/'.$plan->id.'/edit')}}"
                                   class="btn btn-xs blue tooltips" data-container="body" data-placement="top"
                                   data-original-title="{{__('cp.edit')}}"><i class="fa fa-edit"></i></a>

                            </div>
                        </td>
                    </tr>
                    @empty
                        {{__('cp.no')}}
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
@endsection

@section('js')
@endsection
@section('script')

@endsection
