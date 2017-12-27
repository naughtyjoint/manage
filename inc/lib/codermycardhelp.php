<?php


class coderMycardHelp {

    public $FacTradeSeq = null;   //廠商交易序號(自動產生)
    public $TradeType = null;   //交易模式
    public $ServerId = null;     //伺服器代號
    public $CustomerId = null;     //會員代號
    public $PaymentType = null;  //付費方式/付費方式群組代碼
    public $ItemCode = null;     //品項代碼
    public $ProductName = ""; //產品名稱
    public $Amount = "";   //金額
    public $Currency = "";  //幣別
    public $SandBoxMode = "true";  //測試環境
    public $FacKey = "B8sqJqY3QFQg8wE2LZ4AxcWQ69v3RUyy";   //廠商key
    public $FacServiceId = "";  //廠商服務代碼
    public $Hash = "";     //驗證碼
    public $mem_id = "";
    public $datetime = null;
    public $table_mycard = "";
    public $table_member = "";
//    public $table_deposit = "";


    public function __construct()
    {

    }

    public function MycardProcess($ary){

        $datetime = date('Y-m-d H:i:s',time());
        extract($ary);
        if(!isset($Redeposit)) $Redeposit=0;
        $db = Database::DB();
        $data = array(
            'ReturnCode' => $ReturnCode,
            'PaymentType' => $PaymentType,
            'Pay_time' => $datetime,
            'Redeposit' => $Redeposit
        );
        $table_mycard = 'mycard';
        $table_member = 'member';


        //更新交易狀態
        $db->query_update($table_mycard, $data, " FacTradeSeq='$FacTradeSeq'");

        $query_confirm = "SELECT AuthCode, member_id, product_id, Amount FROM mycard WHERE FacTradeSeq=:FacTradeSeq";
        $row = $db->query_first($query_confirm,[':FacTradeSeq' => $FacTradeSeq]);

        //mycard請款
        $Payresult = $this->paymentConfirm($row['AuthCode']);


        //取得會員現有點數
        $mem_id = $row['member_id'];
        $query_member = "SELECT point,platform_id FROM member WHERE member_id=:member_id";
        $member_row = $db->query_first($query_member,[':member_id' => $mem_id]);
        $orig_point = $member_row['point'];
        $platform_id = $member_row['platform_id'];


        //取得產品總點數
        $ProductId = $row['product_id'];
        $query_point = "SELECT point, bonus FROM product WHERE product_id=:product_id";
        $rows = $db->query_first($query_point,[':product_id' => $ProductId]);
        $totalpoint = $orig_point+$rows['point']+$rows['bonus'];


        //更新mycard狀態
        $mycard_data = array(
            'PayResult' =>  $Payresult,
            'Check_time' => $datetime,
        );
        $db->query_update($table_mycard,$mycard_data," FacTradeSeq='$FacTradeSeq'");


        //更新會員點數
        $db->query_update($table_member,['point' => $totalpoint]," member_id='$mem_id'");

        $table_deposit = "deposit";
        $depo_data = array(
            'member_id' => $mem_id,
            'platform_id' => $platform_id,
            'product_id' => $ProductId,
            'money' => $row["Amount"],
            'deposit_pay_id' => 1,
            'pay_code' => $FacTradeSeq,
            'pay_id' => null,
            'status' => 1,
            'updated_time' => $datetime,
            'check_time' => $datetime
        );
        //插入入款管理資料表
        $db->query_insert($table_deposit,$depo_data);


    }

    //取得mycard交易授權碼
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