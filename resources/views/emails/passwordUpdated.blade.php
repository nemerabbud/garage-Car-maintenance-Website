<!DOCTYPE html>
<html>
<head>
<title>{{$settings->title}}</title>
</head>
<body>

    
<p>{{__('cp.Password_modified')}}</p>

<h4>{{__('cp.account_Details')}}</h4>

<p>{{__('cp.name')}}: &nbsp;  {{$user->name}}</p> 
<p>{{__('cp.mobile')}}: &nbsp;  {{$user->mobile}}</p> 
<p>{{__('cp.email')}}: &nbsp;  {{$user->email}}</p>
<p>{{__('cp.password')}}: &nbsp;  {{$password}}</p>


</body>
</html>   