<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        
        <title>Sala Express</title>
        
        <style>
            .container {
                width: 700px;
                margin: auto;
            }
            .text-center {
                text-align: center !important
            }
            .logo {
                float: left;
                width: 70px;
                height: 70px;
                overflow: hidden
            }
            .secHead {
                float: right;
                margin-top: 50px;
            }
            .clearfix {
                clear: both
            }
            .titleBody h4 {
                margin-bottom: 0;
            }
            .titleBody p {
                margin: 0;
            }
            .secBody .titleBody, .secBody .tableBody{
                padding: 10px 40px
            }
            #customers {
                border-collapse: collapse;
                width: 100%;
            }
            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
                font-weight: bold
            }
            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                color: #000;
            }
            .width50px {
                width: 60px
            }
            .text-right {
                text-align: right !important
            }
            .text-left {
                text-align: left !important;
                float: left
            }
            .rightF {
                float: right
            }
            .sectit {
                 padding: 0px 40px;
                text-align: center
            }
            .sectit p {
                text-align: justify
            }
        </style>
    </head>
    
    <body style="direction:rtl">
       <center>
        
        <div class="clearfix"></div>
        
        <div class="secBody">
           <div class="container">
            
            <div class="tableBody">
            
            <h2>{{$request->title}}</h3><br />
                  <h3>{{$request->message}}</h3>
                
           
            </div>
          </div>
        </div>
        
        <div class="footer">
           <div class="container">
              <div class="sectit">
                  <span>This email is delivered by Sala Express</span>
              </div>
            </div>
        </div>
        </center>
        
    </body>
    
</html>