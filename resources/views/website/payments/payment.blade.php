<!doctype html>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

  <title>الدفع الإلكتروني</title>

  <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@700;900&display=swap" rel="stylesheet">
  <!--FavIcone -->
  <link rel="shortcut icon" href="{{url('uploads/favicon.jpg')}}"/>

  <style>
      body {
        text-align: center;
        background: #EBF0F5;
        font-family: 'Tajawal', sans-serif;
      }
        h1 {
          color: #88B04B;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-size:20px;
          margin: 0;
        }
      i {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card {
        background: white;
        padding: 40px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        position: absolute;
        top: 50%;
        left: 50%;
        width: 300px;
        transform: translate(-50%,-50%);
      }
      .btnSuccess {
          background: #9ABC66;
          color: #fff;
          display:block;
          width:100%;
          height:50px;
          line-height:50px;
          text-decoration: none;
          border-radius: 5px;
          margin-bottom:30px;
      }
      .btnFail {
          background: #f00;
          color: #fff;
          display:block;
          width:100%;
          height:50px;
          line-height:50px;
          text-decoration: none;
          border-radius: 5px;
      }
    </style>


</head>

<body>


    <div class="card">
        <a href="{{url(getLocal().'/payment/success')}}" class="btnSuccess">Try Success</a>
        <a href="{{url(getLocal().'/payment/failed')}}" class="btnFail">Try Fail</a>
    </div>

</body>

</html>

