<!DOCTYPE html>
<html>
<head>
<title>{{$settings->title}}</title>
</head>
<body>

<h1>{{__('cp.WelcometoAkam')}}</h1>

<p>{{__('cp.donesucssesfuly')}}</p>

<h4>{{__('cp.account_Details')}}</h4>

<p>{{__('cp.name')}}: &nbsp;  {{$newUser->name}}</p> 
<p>{{__('cp.mobile')}}: &nbsp;  {{$newUser->mobile}}</p> 
<p>{{__('cp.email')}}: &nbsp;  {{$newUser->email}}</p>
<p>{{__('cp.password')}}: &nbsp;  {{$password}}</p>


</body>
</html>   