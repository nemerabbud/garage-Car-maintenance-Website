@extends('layout.adminLayout')
@section('title') {{ucwords(__('cp.notifications'))}}
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
                              style="color: #e02222 !important;">{{__('cp.send_message')}}</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form method="post" id="form" action="{{url(app()->getLocale().'/admin/notifications')}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form">
                        {{ csrf_field() }}
                        <div class="form-body">
                            <fieldset>

                                <div class="tabbable-custom ">
                                    <ul class="nav nav-tabs ">
                                        @foreach($locales as $locale)
                                            <li {{($loop->index == 0) ? "class=active" : '' }}>
                                                <a href="#tab_{{$locale->lang}}" data-toggle="tab">{{$locale->name}}</a>
                                            </li>
                                        @endforeach

                                    </ul>
                                    <div class="tab-content">
                                        @foreach($locales as $locale)
                                            <div class="tab-pane {{($loop->index == 0) ? 'active' : '' }}" id="tab_{{$locale->lang}}">

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="{{$locale->lang}}[title]">
                                                        {{__('cp.subject')}}  <span class="symbol">*</span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input class="form-control" id="{{$locale->lang}}[title]" name="{{$locale->lang}}[title]" value="{{ old("{$locale->lang}.title") }}" required >                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="{{$locale->lang}}[message]">
                                                        {{__('cp.message')}}  <span class="symbol">*</span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <textarea class="form-control" name="{{$locale->lang}}[message]" rows="6" required >{{ old("{$locale->lang}.message") }}</textarea>
                                                    </div>
                                                </div>

                                            </div>
                                        @endforeach

                                    </div>
                                </div>

                            </fieldset>


                            <fieldset>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="user_type">
                                        {{__('cp.users')}}
                                    </label>
                                    <div class="col-md-6">
                                        <select id="user_type" class="form-control select2"
                                                name="user_type">
                                            <option value="">{{__('cp.select')}}</option>
                                            <option value="all_user">{{__('cp.all_users')}}</option>
                                            <option value="garage_owners">{{__('cp.garage_owners')}}</option>
                                            <option value="customers">{{__('cp.customers')}}</option>

                                        </select>
                                    </div>
                                </div>
                            </fieldset>


                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">{{__('cp.submit')}}</button>
                                        <a href="{{url(getLocal().'/admin/notifications')}}" class="btn default">{{__('cp.cancel')}}</a>
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
