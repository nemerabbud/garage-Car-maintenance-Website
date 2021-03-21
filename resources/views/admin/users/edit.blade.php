@extends('layout.adminLayout')
@section('title')  {{ucwords(__('cp.manage_users'))}}
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
                              style="color: #e02222 !important;">{{__('cp.user_edit')}}</span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form method="post" action="{{route('admin.users.update',$item->id)}}"
                          enctype="multipart/form-data" class="form-horizontal" role="form" id="form">
                        @csrf
                        @method('PATCH')

                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="name">
                                    {{__('cp.name')}}
                                    <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="name" id="name"
                                           value="{{@$item->name}}" required>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="mobile">
                                    {{__('cp.mobile')}}
                                    <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <input
                                        onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
                                        type="text" class="form-control" id="mobile"
                                        name="mobile" value="{{old('mobile',@$item->mobile)}}"
                                        required>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="email">
                                    {{__('cp.email')}}
                                    <span class="symbol">*</span>
                                </label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" id="email"
                                           placeholder="{{__('cp.email')}}" value="{{@$item->email}}" disabled>
                                </div>
                            </div>
                        </fieldset>


                        <fieldset>
                            <legend>{{__('cp.profile_image')}}</legend>
                            <div class="form-group">
                                <div class="col-md-3 col-md-offset-3">
                                    <div class="fileinput-new thumbnail"
                                         onclick="document.getElementById('edit_image').click()"
                                         style="cursor:pointer">
                                        <img src="{{@$item->image_url}}" id="editImage">
                                    </div>
                                    <div class="btn red"
                                         onclick="document.getElementById('edit_image').click()">
                                        <i class="fa fa-pencil"></i>
                                    </div>
                                    <input type="file" class="form-control" name="image"
                                           id="edit_image"
                                           style="display:none">
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green">{{__('cp.submit')}}</button>
                                    <a href="{{url(app()->getLocale().'/admin/users')}}"
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
        $('#edit_image').on('change', function (e) {
            readURL(this, $('#editImage'));
        });

    </script>
@endsection
