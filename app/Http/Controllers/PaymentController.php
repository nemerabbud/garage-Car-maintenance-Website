<?php

namespace App\Http\Controllers;

use App\Models\Finance;
use App\Models\Garage;
use App\Models\Plan;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

class PaymentController extends Controller
{

    private $successUrl;
    private $FailedUrl;
    private $amount;
    private $order_id;
    private $secretKey = "0414948";
    private $paymentMethod;
    private $defaultPaymentMethod = "credit";
    private $merchantID = "mer2000032";
    private $paymentGatewayUrl2 = 'https://demo.bookeey.com/portal/MerchantRegistration';
    private $paymentGatewayUrl = 'http://apps.bookeey.com/pgapi/api/payment/requestLink';
    private $paymentStatusUrl = 'http://apps.bookeey.com/pgapi/api/payment/paymentstatus';




    public function __construct()
    {
        $this->path = "website.payments";
    }



    public function api_payment_page($finance_id)
    {


//        dd($this->getPaymentStatus(1));
     //   dd($this->requery($finance_id),$this->requery($finance_id)->statusDescription == "Transaction successful", $this->requery(3));

        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);

        return view("payments.api.payment", ['finance' => $finance]);
    }


    public function api_payment_success($finance_id)
    {
        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);

        $response = $this->requery($finance_id);
        if ($response->statusDescription == "Transaction successful"){
            $plan = Plan::findOrFail($finance->plan_id);
            $garage = Garage::findOrFail($finance->garage_id);

            $finance->update([
                'status' => 'completed',
                'merchantTxnId' => \request()->get('merchantTxnId'),
                'txnId' => \request()->get('txnId'),
                'payment_response'=>json_encode($response)

            ]);
            $garage->update([
                'plan_id' => $plan->id,
                'start_date' => now(),
                'amount' => $finance->amount,
                'status' => 'active',
                'end_date' => Carbon::parse(now())->addDays($plan->duration),
            ]);

        }
        else{
            return  redirect()->route('api_failed_payment_page', ['finance' => $finance_id, 'status' => 'false']);
        }



        return view("payments.api.success");
    }

    public function api_payment_failed($finance_id)
    {
        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);
        $response = $this->requery($finance_id);

        $finance->update(['status' => 'failed','payment_response'=>json_encode($response)]);

        return view("payments.api.fail");
    }

    public function api_payment(Request $request, $finance_id)
    {

        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);

        $transactionDetails = array(
            array(
                "SubMerchUID" => "subm20000282",
                "Txn_AMT" =>  $finance->amount // "11.9"
            ),

        );

        $this->amount = $finance->amount;
        $this->order_id = $finance->id;

        $this->successUrl = route('api_success_payment_page', ['finance' => $finance_id, 'status' => 'true']);
        $this->FailedUrl = route('api_failed_payment_page', ['finance' => $finance_id, 'status' => 'false']);
        $this->paymentMethod = $request->filled('card') ? $request->card : $this->defaultPaymentMethod;

        $this->initiatePayment($transactionDetails);

        dd(1);
    }


    //  website  payment
    public function payment_page($finance_id)
    {
        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);

        return view("payments.website.payment", ['finance' => $finance]);
    }


    public function payment_success($finance_id)
    {
        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);
        $response = $this->requery($finance_id);
        if ($response->statusDescription == "Transaction successful"){
            $plan = Plan::findOrFail($finance->plan_id);
            $garage = Garage::findOrFail($finance->garage_id);

            $finance->update([
                'status' => 'completed',
                'merchantTxnId' => \request()->get('merchantTxnId'),
                'txnId' => \request()->get('txnId'),
                'payment_response'=>json_encode($response)

            ]);
            $garage->update([
                'plan_id' => $plan->id,
                'start_date' => now(),
                'amount' => $finance->amount,
                'status' => 'active',
                'end_date' => Carbon::parse(now())->addDays($plan->duration),
            ]);

        }else{
          return  redirect()->route('failed_payment_page', ['finance' => $finance_id, 'status' => 'false']);
        }




        return view("payments.api.success");
    }

    public function payment_failed($finance_id)
    {
        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);
        $response = $this->requery($finance_id);

        $finance->update(['status' => 'failed','payment_response'=>json_encode($response)]);

        return view("payments.website.fail");
    }

    public function payment(Request $request, $finance_id)
    {

        $finance = Finance::whereStatus('pending')->findOrFail($finance_id);

        $transactionDetails = array(
            array(
                "SubMerchUID" => "subm20000282",
                "Txn_AMT" => $finance->amount //"11.9"
            ),

        );

        $this->amount = $finance->amount;
        $this->order_id = $finance->id;

        $this->successUrl = route('success_payment_page', ['finance' => $finance_id, 'status' => 'true']);
        $this->FailedUrl = route('failed_payment_page', ['finance' => $finance_id, 'status' => 'false']);
        $this->paymentMethod = $request->filled('card') ? $request->card : $this->defaultPaymentMethod;

        $this->initiatePayment($transactionDetails);

    }



    function initiatePayment($transactionDetails)
    {
        session_start();
        $sessionId = \request()->session()->getId();
        $systemInfo = $this->systemInfo();
        $browser = $this->browser();
        $payerName = '';
        $payerPhone = '';
        $mid = $this->merchantID;
        $tex = $random_pwd = mt_rand(1000000000000000, 9999999999999999);
        $txnRefNo = $tex;
        $su = $this->successUrl;
        $fu = $this->FailedUrl;

        $amt = $this->amount;
        $orderId = $this->order_id;

        $rndnum = rand(10000, 99999);
        $crossCat = "GEN";

        $secretKey = $this->secretKey;
        $paymentoptions = $this->paymentMethod;
        $data = "$mid|$txnRefNo|$su|$fu|$amt|$crossCat|$secretKey|$rndnum";
        $hashed = hash('sha512', $data);

        $paymentGatewayUrl = $this->paymentGatewayUrl;;

        $txnDtl = $transactionDetails;

        $txnHdr = array(
            "PayFor" => "ECom",
            "Txn_HDR" => $rndnum,
            "PayMethod" => $paymentoptions,
            "BKY_Txn_UID" => "",
            "Merch_Txn_UID" => $orderId,
            "hashMac" => $hashed
        );

        $appInfo = array(
            "APPTyp" => "",
            "OS" => $systemInfo['os'] . ' - ' . $browser,
            "DevcType" => $systemInfo['device'],
            "IPAddrs" => \request()->server('REMOTE_ADDR'), //$_SERVER['SERVER_ADDR'],
            "Country" => "",
            "AppVer" => "3.0.0",
            "UsrSessID" => $sessionId,
            "APIVer" => "2.0.0"

        );

        $pyrDtl = array(
            "Pyr_MPhone" => $payerPhone,
            "Pyr_Name" => $payerName
        );

        $merchDtl = array(
            "BKY_PRDENUM" => "ECom",
            "FURL" => $fu,
            "MerchUID" => $mid,
            "SURL" => $su
        );

        $moreDtl = array(
            "Cust_Data1" => "",
            "Cust_Data3" => "",
            "Cust_Data2" => ""
        );

        $postParams['Do_TxnDtl'] = $txnDtl;
        $postParams['Do_TxnHdr'] = $txnHdr;
        $postParams['Do_Appinfo'] = $appInfo;
        $postParams['Do_PyrDtl'] = $pyrDtl;
        $postParams['Do_MerchDtl'] = $merchDtl;
        $postParams['DBRqst'] = "PY_ECom";
        $postParams['Do_MoreDtl'] = $moreDtl;

        $ch = curl_init();

        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
        );

        curl_setopt($ch, CURLOPT_URL, $paymentGatewayUrl);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postParams));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $serverOutput = curl_exec($ch);
        $decodeOutput = json_decode($serverOutput, true);
        curl_close($ch);

        if (isset($decodeOutput['PayUrl'])) {
            if ($decodeOutput['PayUrl'] == '') {
                echo "Error Message: " . $decodeOutput['ErrorMessage'];
            } else {
                header("Location: " . $decodeOutput['PayUrl']);
            }
        } else if (isset($decodeOutput['Message'])) {
            echo "Error Message: " . $decodeOutput['Message'];
        } else {
            echo "Error<br>";
            print_r($decodeOutput);
        }
    }

    function systemInfo()
    {
        $user_agent = \request()->header('user-agent');// $_SERVER['HTTP_USER_AGENT'];
        $os_platform = "Unknown OS Platform";
        $os_array = array(
            '/windows nt 10.0/i' => 'Windows 10',
            '/windows phone 8/i' => 'Windows Phone 8',
            '/windows phone os 7/i' => 'Windows Phone 7',
            '/windows nt 6.3/i' => 'Windows 8.1',
            '/windows nt 6.2/i' => 'Windows 8',
            '/windows nt 6.1/i' => 'Windows 7',
            '/windows nt 6.0/i' => 'Windows Vista',
            '/windows nt 5.2/i' => 'Windows Server 2003/XP x64',
            '/windows nt 5.1/i' => 'Windows XP',
            '/windows xp/i' => 'Windows XP',
            '/windows nt 5.0/i' => 'Windows 2000',
            '/windows me/i' => 'Windows ME',
            '/win98/i' => 'Windows 98',
            '/win95/i' => 'Windows 95',
            '/win16/i' => 'Windows 3.11',
            '/macintosh|mac os x/i' => 'Mac OS X',
            '/mac_powerpc/i' => 'Mac OS 9',
            '/linux/i' => 'Linux',
            '/ubuntu/i' => 'Ubuntu',
            '/iphone/i' => 'iPhone',
            '/ipod/i' => 'iPod',
            '/ipad/i' => 'iPad',
            '/android/i' => 'Android',
            '/blackberry/i' => 'BlackBerry',
            '/webos/i' => 'Mobile'
        );

        $found = false;
        $device = '';

        foreach ($os_array as $regex => $value) {
            if ($found)
                break;
            else if (preg_match($regex, $user_agent)) {
                $os_platform = $value;
                $device = !preg_match('/(windows|mac|linux|ubuntu)/i', $os_platform)
                    ? 'MOBILE' : (preg_match('/phone/i', $os_platform) ? 'MOBILE' : 'SYSTEM');
            }
        }
        $device = !$device ? 'SYSTEM' : $device;

        return array('os' => $os_platform, 'device' => $device);
    }

    function browser()
    {
        $user_agent = \request()->header('user-agent');// $_SERVER['HTTP_USER_AGENT'];

        $browser = "Unknown Browser";
        $browser_array = array(
            '/msie/i' => 'Internet Explorer',
            '/firefox/i' => 'Mozilla Firefox',
            '/safari/i' => 'Safari',
            '/chrome/i' => 'Google Chrome',
            '/edge/i' => 'Microsoft Edge',
            '/opera/i' => 'Opera',
            '/netscape/i' => 'Netscape',
            '/maxthon/i' => 'Maxthon',
            '/konqueror/i' => 'Konqueror',
            '/mobile/i' => 'Handheld Browser'
        );

        $found = false;

        foreach ($browser_array as $regex => $value) {
            if ($found)
                break;
            else if (preg_match($regex, $user_agent, $result)) {
                $browser = $value;
            }
        }

        return $browser;
    }

    public static function requery($txnId)
    {
//        $URL = "https://apps.bookeey.com/pgapi/api/payment/paymentstatus?txnId={$txnId}";
        $URL = "https://demo.bookeey.com/portal/paymentrequery?txnId={$txnId}";
        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
        );
        $Curl = curl_init();
        curl_setopt($Curl, CURLOPT_URL, $URL);
        curl_setopt($Curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($Curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($Curl, CURLOPT_HEADER, 0);
        $result = curl_exec($Curl);
        curl_close($Curl);

        return json_decode($result);
    }


//
    function getPaymentStatus($orderIds)
    {
        $requeryUrl = "https://apps.bookeey.com/pgapi/api/payment/paymentstatus";


        $mid = $this->merchantID;;
        $rndnum = rand(10000, 99999);
        $secretKey = $this->secretKey;

        $data = "$mid|$secretKey|$rndnum";
        $hashed = hash('sha512', $data);

        $postParams['Mid'] = $mid;
        $postParams['MerchantTxnRefNo'] = $orderIds;
        $postParams['HashMac'] = $hashed;

        $url = "$requeryUrl?data=".json_encode($postParams);
//        $url = "$requeryUrl?".json_encode($postParams);\
//        dd($url);
        $ch = curl_init();
        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
        );
        curl_setopt($ch, CURLOPT_URL, $url);
//
//        curl_setopt($ch, CURLOPT_URL, $requeryUrl);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_HEADER, 0);
//        curl_setopt($ch, CURLOPT_POST, true);
//        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postParams));
//        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postParams));
//        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $serverOutput = curl_exec($ch);
        dd($serverOutput);
        $decodeOutput = json_decode($serverOutput, true);
        curl_close($ch);

        return $decodeOutput;
    }
//
//    public function GenerateHashMac($price, $time)
//    {
//
//        /* $mid = 'mer20000393';
//         $secret_key = '3650191';*/
//        $mid = 'mer2000013';
//        $secret_key = '5083930';
//        $txRefNo = $time;
//        $furl = url('paymentFail');
//        $surl = url('success');
//        $crossCat = 'GEN';
//        $txTime = $time;
//        $amt = (string) $price;
//        // "mid|txnRefNo|su|fu|amt|txnTime|crossCat|secret_key"
//        $hstring = $mid.'|'.$txRefNo.'|'.$surl.'|'.$furl.'|'.
//            $amt.'|'.$txTime.'|'.$crossCat.'|'.$secret_key;
//
//        $sig = hash('sha512', $hstring);
//
//        return $sig;
//    }
//
//    function  testInit(){
//        $Time = (string) Str::random(10).time();
////        $baseUrl = $this->paymentGatewayUrl2;
//        $baseUrl = 'https://demo.bookeey.com/portal/mobileBookeeyPg';
//
//        $price = '"'."20".'"';
//
//        $merchantId = 'mer2000013';
//        $secreatKey = '5083930';
//        $furl = url('paymentFail');
//        $surl = url('success');
//        $tranid = $Time;
//        $txntime = $Time;
//        $hashMac = self::GenerateHashMac($price, $tranid);
//        $paymentOptions = 'credit';
////        $Url = $baseUrl."?data={\"price\":\"22\",\"merchantId\":\"{$this->merchantID}\",\"secreatKey\":\"{$this->secretKey}\",\"surl\":\"{$surl}\",\"furl\":\"{$furl}\",\"tranid\":\"{$tranid}\",\"txntime\":\"{$txntime}\",\"hashMac\":\"{$hashMac}\",\"paymentOptions\":\"{$paymentOptions}\"}";
//        $Url = $baseUrl."?data={\"price\":\"50\",\"merchantId\":\"{$merchantId}\",\"secreatKey\":\"{$secreatKey}\",\"surl\":\"{$surl}\",\"furl\":\"{$furl}\",\"tranid\":\"{$tranid}\",\"txntime\":\"{$txntime}\",\"hashMac\":\"{$hashMac}\",\"paymentOptions\":\"{$paymentOptions}\"}";
//
//        $Curl = curl_init();
//        curl_setopt($Curl, CURLOPT_URL, $Url);
//        curl_setopt($Curl, CURLOPT_RETURNTRANSFER, true);
//        $result = curl_exec($Curl);
//        curl_close($Curl);
//
//        dd($result);
//    }


}
