<?php


class Mycard{

public $FacServiceId = "";  //廠商服務代碼
public $FacTradeSeq = "";   //廠商交易序號(自動產生)
public $TradeType = "";   //交易模式
public $ServerId = null;     //伺服器代號
public $CustomerId = null;     //會員代號
public $PaymentType = null;  //付費方式/付費方式群組代碼
public $ItemCode = null;     //品項代碼
public $ProductName = ""; //產品名稱
public $Amount = "";   //金額
public $Currency = "";  //幣別
public $SandBoxMode = "true";  //測試環境
public $FacKey = "B8sqJqY3QFQg8wE2LZ4AxcWQ69v3RUyy";   //廠商key
public $Hash = "";     //驗證碼
public $Createdate = date('Y-m-d H:i:s',time());


    function __construct()
    {

    }

    public function getAuthCode($ary){

        extract($ary);
        $Encodedata = substr(urlencode($ProductName),strpos(urlencode($ProductName),"%"));
        $data = $FacServiceId.$FacTradeSeq.$TradeType.$ServerId.$CustomerId.$PaymentType.$ItemCode.$Encodedata.$Amount.$Currency.$SandBoxMode.$FacKey;
        $Hash = hash('sha256', $data);
        $datatosent = array('FacServiceId'=>$FacServiceId,'FacTradeSeq'=>$FacTradeSeq,'TradeType'=>$TradeType,'ServerId'=>$ServerId,'CustomerId'=>$CustomerId,'PaymentType'=>$PaymentType,'ItemCode'=>$ItemCode,'ProductName'=>$ProductName,'Amount'=>$Amount,'Currency'=>$Currency,'SandBoxMode'=>$SandBoxMode,'Hash'=>$Hash);
        $url = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/AuthGlobal";
        $ch = curl_init();


        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($datatosent));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);

        $output = curl_exec($ch);
        curl_close($ch);


        $opt=json_decode($output);
        $AuthCode = $opt->AuthCode;
        return $AuthCode;
    }

    public function paymentConfirm($authcode){
            $url = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/PaymentConfirm?AuthCode=".$authcode;
            $ch = curl_init();


            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);

            $output = curl_exec($ch);
            $opt = json_decode($output);
            curl_close($ch);
            return $opt->ReturnCode;
        }



}