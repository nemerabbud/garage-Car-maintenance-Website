<html>
    <head>
        <meta charset="utf-8" />
        
        <title>Ashiaa</title>
        
        <link href="https://fonts.googleapis.com/css?family=Cairo:300,400,600,700" rel="stylesheet" type="text/css"/>
        <style>
        
       body
       {
           font-family:'Cairo' !important;
           font-size:12px;
           font-weight:bold;
       }
        
            .container {
                width: 500px;
                margin: auto;
                direction:rtl;
             }
            .text-center {
                text-align: center !important
            }
            .logo {
                text-align: center;
                overflow: hidden
            }
            .secHead {
                text-align:center;
                
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
                padding: 5px 10px;
           
            }
            #customers {
                border-collapse: collapse;
                width: 100%;
                font-size:12px !important;
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
        
        <body>
    
        <div class="header">
            <div class="container">
                <div class="logo">
                    <img src="{{url('uploads/images/settings/logo.svg')}}" width="70" height="70" />
                </div>
                <div class="secHead">
                    <p>فاتورة استلام</p>
                </div>
            </div>
        </div>
        
        <div class="clearfix"></div>
        
        <div class="secBody">
           <div class="container">
            
            <div class="tableBody">
                <table id="customers">
                  <tr>
                     <th>{{__('cp.customer-details')}}</th>
                     <th>{{__('cp.order-details')}}</th>
                  </tr>
                  <tr>
                    <td valign="top">
                       {{__('cp.name')}}: <span>{{$order->user->name}}</span>
                        <br>
                        
                        {{__('cp.mobile')}} : <span>{{$order->user->mobile}}</span> 
                        {{-- <br>
                        
                         {{__('cp.customeraddress')}} <span>{{$order->delivery_address}}</span> --}}
                    </td>
                    <td valign="top">
                        
                        {{__('cp.ordernumber')}}: <span>{{$order->id}}</span> 
                        <br>
                        
                         {{__('cp.date')}} :    <span>{{$order->created_at->toDateString()}} </span>
                        <br>
                        
                         {{__('cp.time')}}:    <span>{{$order->created_at->toTimeString()}} </span> </span>
                    
                    </td>
                  </tr>
              </table>

                <table id="customers">
                  <tr>
                     <th class="width50px">{{__('cp.number')}}</th>
                     <th>{{__('cp.categ')}}</th>
                   
                     <th class="width50px">{{__('cp.amount')}}</th>
                     
                     <th class="width50px">{{__('cp.price_sar')}}</th>
                     <th class="width50px">{{__('cp.total_sar')}}</th>
                     
                  </tr>
                    
                    @foreach($products as $item)
                    
                  <tr>
                        <td class="width50px"><span class="text-right">{{$loop->iteration}}</span></td>
                        
                        <td><span>{{@$item->product->name}}</span></td>
                       
                        <td class="width50px"><span class="text-right">{{$item->quantity}}</span></td>
                        <td class="width50px"><span class="text-right">{{$item->price}}</span></td>
                        <td class="width50px"><span class="text-right">{{$item->quantity * $item->price}}</span></td>
                  </tr>
                  @endforeach
            <tr>
                    <td colspan="5">{{__('cp.total_sar')}}:</td>
                    <td class="text-right" colspan="1"><span>{{$order->total_price - $order->delivery_cost}}</span></td>
                  </tr>
                 
                  <tr>
                    <td colspan="5"> {{__('cp.invoice_discount_sar')}}:</td>
                    <td class="text-right" colspan="1"><span>{{$order->invoice_discount}}</span></td>
                  </tr>
              
               
                  <tr>
                    <td colspan="5"> {{__('cp.delivery_cost')}}:</td>
                    <td class="text-right" colspan="1"><span>{{$order->delivery_cost}}</span></td>
                  </tr>
                  
                  <tr>
                    <td colspan="5"> {{__('cp.total_price_sar')}}</td>
                    <td class="text-right" colspan="1"><span>{{@$order->total_price - @$order->invoice_discount}}</span></td>
                  </tr>
              </table>
           
            </div>
          </div>
        </div>
        <br>
        <center>---------------------------------------------------------------------------------------------------------------------------------</center>
        <br>
        
        <div class="header">
            <div class="container">
                <div class="logo">
                    <img src="{{url('uploads/images/settings/logo.svg')}}" width="70" height="70" />
                </div>
                <div class="secHead">
                    <p>فاتورة استلام</p>
                </div>
            </div>
        </div>
        
        <div class="clearfix"></div>
        
        <div class="secBody">
           <div class="container">
            
            <div class="tableBody">
                <table id="customers">
                  <tr>
                    <th>{{__('cp.customer-details')}}</th>
                     <th>{{__('cp.order-details')}}</th>
                  </tr>
                  <tr>
                  <td valign="top">
                       {{__('cp.name')}}: <span>{{$order->user->name}}</span>
                        <br>
                        
                        {{__('cp.mobile')}} : <span>{{$order->user->mobile}}</span> 
                        {{-- <br>
                        
                         {{__('cp.customeraddress')}} <span>{{$order->delivery_address}}</span> --}}
                    </td>
                    <td valign="top">
                        
                        {{__('cp.ordernumber')}}: <span>{{$order->id}}</span> 
                        <br>
                        
                        {{__('cp.date')}} :    <span>{{$order->created_at->toDateString()}} </span>
                        <br>
                        
                         {{__('cp.time')}}:    <span>{{$order->created_at->toTimeString()}} </span> </span>
                    
                    </td>
                  </tr>
              </table>

                <table id="customers">
                 <tr>
                     <th class="width50px">{{__('cp.number')}}</th>
                     <th>{{__('cp.categ')}}</th>
                   
                     <th class="width50px">{{__('cp.amount')}}</th>
                     
                     <th class="width50px">{{__('cp.price_sar')}}</th>
                     <th class="width50px">{{__('cp.total_sar')}}</th>
                     
                  </tr>
                    
                    @foreach($products as $item)
                    
                  <tr>
                        <td class="width50px"><span class="text-right">{{$loop->iteration}}</span></td>
                        
                        <td><span>{{@$item->product->name}}</span></td>
                      
                        <td class="width50px"><span class="text-right">{{$item->quantity}}</span></td>
                        <td class="width50px"><span class="text-right">{{$item->price}}</span></td>
                        <td class="width50px"><span class="text-right">{{$item->quantity * $item->price}}</span></td>
                  </tr>
            @endforeach
                  <tr>
                    <td colspan="5">{{__('cp.total_sar')}}:</td>
                    <td class="text-right" colspan="1"><span>{{$order->total_price - $order->delivery_cost}}</span></td>
                  </tr>
                 
                  <tr>
                    <td colspan="5"> {{__('cp.invoice_discount_sar')}}:</td>
                    <td class="text-right" colspan="1"><span>{{$order->invoice_discount}}</span></td>
                  </tr>
              
               
                  <tr>
                    <td colspan="5"> {{__('cp.delivery_cost')}}:</td>
                    <td class="text-right" colspan="1"><span>{{$order->delivery_cost}}</span></td>
                  </tr>
                  
                  <tr>
                    <td colspan="5"> {{__('cp.total_price_sar')}}</td>
                    <td class="text-right" colspan="1"><span>{{@$order->total_price - @$order->invoice_discount}}</span></td>
                  </tr>
              </table>
           
            </div>
          </div>
        </div>
        
    </body>
    </html>