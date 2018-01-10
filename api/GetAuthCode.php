<?php
include_once 'codermycardhelp.php';

$FacServiceId = "luckySG";  //廠商服務代碼
$FacTradeSeq = uniqid('MC');   //廠商交易序號(自動產生)
$TradeType = "2";   //交易模式
$ServerId = "";     //伺服器代號
$CustomerId = "";     //會員代號
$PaymentType = "";  //付費方式/付費方式群組代碼
$ItemCode = "";     //品項代碼
$ProductName = ""; //產品名稱
$Amount = "";   //金額
$Currency = "";  //幣別
$SandBoxMode = "true";  //測試環境
$FacKey = "B8sqJqY3QFQg8wE2LZ4AxcWQ69v3RUyy";   //廠商key
$Createdate = date('Y-m-d H:i:s',time());

$fal_resultback = array(
    'success' => 'false',
    'result' => '',
    'message' => 'Failed to get AuthCode .'
);

$result_suc = array(
    'success' => 'true',
    'result' => '',
    'message' => 'Get AuthCode successfully.'
);


if(isset($_GET["CustomerId"]) && !empty($_GET["CustomerId"]) &&
    isset($_GET["Amount"])&& !empty($_GET["Amount"]) &&
    isset($_GET["Currency"])&& !empty($_GET["Currency"]) &&
    isset($_GET["ProductName"])&& !empty($_GET["ProductName"])){
    $CustomerId = $_GET["CustomerId"];
    $Amount = $_GET["Amount"];
    $Currency = $_GET["Currency"];
    $ProductName = $_GET["ProductName"];
    $agent_id = $_GET["agent_id"];
    $getauth_ary = array(
            'FacServiceId' => $FacServiceId,
            'FacTradeSeq' => $FacTradeSeq,
            'TradeType' => $TradeType,
            'ServerId' => $ServerId,
            'CustomerId' => $CustomerId,
            'PaymentType' => $PaymentType,
            'ItemCode' => $ItemCode,
            'ProductName' => $ProductName,
            'Amount' => $Amount,
            'Currency' => $Currency,
            'SandBoxMode' => $SandBoxMode,
            'FacKey' => $FacKey,
            'Created_date' => $Createdate,
            'agent_id' => $agent_id
    );
    $mycard = new coderMycardHelp();
    $result = $mycard->getAuthCode($getauth_ary);
    if($result["success"]=='true'){
        $result_suc['result'] = $result['result'];
        echo json_encode($result_suc);
    }else if($result["success"]=='false'){
        echo json_encode($fal_resultback);
    }


}else{
    echo json_encode($fal_resultback);
}


?>





