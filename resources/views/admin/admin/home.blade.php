@extends('layout.adminLayout')

@section('title') {{ucwords(__('cp.title_admin'))}}

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

                            <a href="{{url(app()->getLocale().'/admin/admins/create')}}" style="margin-right: 5px"

                               class="btn sbold green">{{__('cp.add')}}

                                <i class="fa fa-plus"></i>

                            </a>

                            <button class="btn sbold blue btn--filter">{{__('cp.filter')}}

                                <i class="fa fa-search"></i>

                            </button>

                            <button class="btn sbold green event" href="#activation" role="button"  data-toggle="modal">{{__('cp.active')}}
                                <i class="fa fa-check"></i>
                            </button>
                            <button class="btn sbold default event" href="#cancel_activation" role="button"  data-toggle="modal">{{__('cp.not_active')}}
                                <i class="fa fa-minus"></i>
                            </button>

                        </div>

                    </div>



                </div>

                <div class="box-filter-collapse">

                    <form class="form-horizontal" method="get" action="{{url(getLocal().'/admin/admins')}}">

                        <div class="row">

                            <div class="col-md-4">

                                <div class="form-group row">

                                    <label class="col-md-3 control-label">{{__('cp.email')}}</label>

                                    <div class="col-md-9">

                                        <input type="email" class="form-control" name="email">

                                    </div>

                                </div>

                            </div>

                            <div class="col-md-4">

                                <div class="row">

                                    <div class="col-md-offset-3 col-md-9">

                                        <button type="submit" class="btn sbold blue">{{__('cp.search')}}

                                            <i class="fa fa-search"></i>

                                        </button>

                                        <a href="{{url(app()->getLocale().'/admin/admins')}}" type="submit"

                                           class="btn sbold btn-default ">{{__('cp.reset')}}

                                            <i class="fa fa-refresh"></i>

                                        </a>

                                    </div>

                                </div>

                            </div>

                        </div>


                    </form>

                </div>

            </div>


            <table class="table table-striped table-bordered table-hover table-checkable order-column" id="toolsTable">

                <thead>

                <tr>

                    <th>



                    </th>

                    <th> {{ucwords(__('cp.full_name'))}}</th>

                    <th> {{ucwords(__('cp.email'))}}</th>


                    <th> {{ucwords(__('cp.status'))}}</th>

                    <th> {{ucwords(__('cp.created'))}}</th>

                    <th> {{ucwords(__('cp.action'))}}</th>

                </tr>

                </thead>

                <tbody>

                @forelse($items as $item)

                    <tr class="odd gradeX" id="tr-{{$item->id}}">

                        <td>

                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">

                                <input type="checkbox" class="checkboxes chkBox" value="{{$item->id}}" name="chkBox"/>

                                <span></span>

                            </label>

                        </td>

                        <td> {{$item->name}}</td>

                        <td><a href="mailto:{{$item->email}}">{{$item->email}}</a></td>


                        <td> <span class="label label-sm <?php echo ($item->status == "active")
                                ? "label-info" : "label-danger"?>" id="label-{{$item->id}}">
                                @php
                                    $status = $item->status
                                @endphp

                                {{__('cp.'.$status)}}
                            </span>
                        </td>

                        <td class="center">{{$item->created_at}}</td>

                        <td>

                            <div class="btn-group btn-action">

                                <a href="{{url(getLocal().'/admin/admins/'.$item->id.'/edit')}}"

                                   class="btn btn-xs blue tooltips" data-container="body" data-placement="top"

                                   data-original-title="{{__('cp.edit')}}"><i class="fa fa-edit"></i></a>



                                <a href="{{url(getLocal().'/admin/admins/'.$item->id.'/edit_password')}}"

                                   class="btn btn-xs blue tooltips" data-container="body" data-placement="top"

                                   data-original-title="{{__('cp.edit_password')}}"><i class="fa fa-expeditedssl"></i></a>





                            </div>

                        </td>

                    </tr>



                @empty


                @endforelse

                </tbody>

            </table>

        </div>

    </div>

@endsection



@section('js')

@endsection

@section('script')

    <script>


    </script>

@endsection

