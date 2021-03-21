@extends('layout.adminLayout')

@section('title') {{ucwords(__('cp.edit_password'))}}

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

                              style="color: #e02222 !important;">{{__('cp.edit_password')}}</span>

                    </div>

                </div>

                <div class="portlet-body form">

                    <form method="post" action="{{url(app()->getLocale().'/admin/admins/'.$item->id.'/edit_password')}}"

                          enctype="multipart/form-data" class="form-horizontal" role="form">

                        {{ csrf_field() }}



                        <div class="form-body">





                            <fieldset>

                                <div class="form-group">

                                    <label class="col-sm-2 control-label" for="order">

                                        {{__('cp.password')}}

                                        <span class="symbol">*</span>

                                    </label>

                                    <div class="col-md-6">

                                        <input type="password"  class="form-control" name="password" value=""

                                               required>

                                    </div>

                                </div>

                            </fieldset>





                            <fieldset>

                                <div class="form-group">

                                    <label class="col-sm-2 control-label" for="order">

                                        {{__('cp.confirm_password')}}

                                        <span class="symbol">*</span>

                                    </label>

                                    <div class="col-md-6">

                                        <input type="password"  class="form-control" name="confirm_password" value=""

                                              required>

                                    </div>

                                </div>

                            </fieldset>



                            <div class="form-actions">

                                <div class="row">

                                    <div class="col-md-offset-3 col-md-9">

                                        <button type="submit" class="btn green">{{__('cp.submit')}}</button>

                                        <a href="{{url(getLocal().'/admin/admins')}}" class="btn default">{{__('cp.cancel')}}</a>

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

@endsection

