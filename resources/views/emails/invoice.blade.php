<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        
        <title>Saydaleyat</title>
        
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
    
    <body>
        
        
        <div class="header">
            <div class="container">
                <div class="logo">
                    <img src="{{url('/Logo02.png')}}" width="70" height="70" />
                </div>
                <div class="secHead">
                    <p>فاتورة استلام</p>
                </div>
            </div>
        </div>
        
        <div class="clearfix"></div>
        
        <div class="secBody">
           <div class="container">
            <div class="titleBody">
                <h4>السيد/ة:  {{$order->name}}</h4>
                <p>رقم الطلبية : <span>{{$order->id}}</span></p>
            </div>
            <div class="tableBody">
                <table id="customers">
                  <tr>
                     <th>تفاصيل العميل</th>
                     <th>تفاصيل الطلبية</th>
                  </tr>
                  <tr>
                    <td valign="top">
                        الاسم: <span>{{$order->name}}</span>
                        <br>
                        <br>
                        رقم الموبايل: <span>{{$order->mobile}}</span> 
                        <br>
                        <br>
                         عنوان التسليم: <span>{{$order->address}}</span>
                    </td>
                    <td valign="top">
                        
                         التاريخ والوقت:    <span>{{$order->created_date}} {{$order->delivery_time}}</span> 
                    <br>
                    </td>
                  </tr>
              </table>

                <table id="customers">
                  <tr>
                     <th class="width50px">الكمية</th>
                     <th>الصنف</th>
                     <th class="width50px">الوحدة</th>
                     <th class="width50px">الاجمالي</th>
                     
                  </tr>
                
                    @foreach($products as $item)
                    
                  <tr>
                        <td class="width50px"><span class="text-left">{{$item->quantity}}</span></td>
                        <td><span>{{@$item->product->name}}</span></td>
                        <td class="width50px"><span class="text-right">{{$item->price}}</span></td>
                        <td class="width50px"><span class="text-right">{{$item->total}}</span></td>
                  </tr>
                  @endforeach
                  <tr>
                    <td colspan="3">&nbsp;</td>
                    <td class="text-right" colspan="2">
                        Total: <span>{{$order->total}}</span>
                    </td>
                  
                  </tr>
              </table>
           
            </div>
          </div>
        </div>
        
        <div class="footer">
           <div class="container">
              <div class="sectit">
                  <h3>Thank you for ordering by Saydaleyat</h3>
                  <p>These products have been prepared by the store that was ordered from Saydaleyat company. Saydaleyat is not
               involved in any way in the process of preparation, production, or pricing of this product. The store that
               was ordered from is responsible for the quality, pricing and the validity of the products and in turn Saydaleyat
               disclaims itself from any responsibility for any damage that might arise along this transaction. This report
               is attached to the order as a proof of the details of this transaction and to reflect the delivery charge.
               </p>
               <br>
               
               
              </div>
            </div>
        </div>
        
    </body>
    
</html>