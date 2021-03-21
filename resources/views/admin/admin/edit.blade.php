@extends('layout.adminLayout')
@section('title') {{ucwords(__('cp.edit_admin'))}}
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
                              style="color: #e02222 !important;">{{__('cp.edit_admin')}}</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form id="form" method="post" action="{{url(app()->getLocale().'/admin/admins/'.$item->id)}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form">
                        {{ csrf_field() }}
                        {{ method_field('PATCH')}}

                        <div class="form-body">

                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="order">
                                        {{__('cp.name')}}
                                        <span class="symbol">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" name="name" class="form-control"
                                               value="{{old('name',$item->name) }}" required>
                                    </div>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="order">
                                        {{__('cp.email')}}
                                        <span class="symbol">*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="email"
                                               value="{{old('email',$item->email) }}" required>
                                    </div>
                                </div>
                            </fieldset>

                            @if(auth()->guard('admin')->user()->id!=1)
                                <fieldset>
                                    <div class="form-group{{ $errors->has('permissions') ? ' has-error' : '' }}">
                                        <label class="col-sm-2 control-label">
                                            {{__('cp.role')}}
                                        </label>
                                        <div class="col-md-6">
                                            <select class="form-control select2" id="permissions" name="permissions[]"
                                                    multiple="multiple" required>
                                                @foreach($role as$roleItem)
                                                    <option value="{{$roleItem->roleSlug}}"
                                                            @if(in_array($roleItem->roleSlug,$userRoleItem)) selected @endif>{{$roleItem->name}}</option>
                                                @endforeach

                                            </select>
                                        </div>
                                    </div>
                                </fieldset>
                            @endif

                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">{{__('cp.submit')}}</button>
                                        <a href="{{url(getLocal().'/admin/admins')}}"
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


    </script>
@endsection
