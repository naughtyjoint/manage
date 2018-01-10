<?php
include_once('codermycardhelp.php');
include '_func.php';
$result = array(
    'ReturnCode' => post("ReturnCode",1),
    'ReturnMsg' => post("ReturnMsg",1),
    'PayResult' => post("PayResult",1),
    'FacTradeSeq' => post("FacTradeSeq",1),
    'PaymentType' => post("PaymentType",1),
    'Amount' => post("Amount",0),
    'Currency' => post("Currency",1),
    'MyCardTradeNo' => post("MyCardTradeNo",1),
    'MyCardType' => post("MyCardType",1),
    'PromoCode' => post("PromoCode",1),
    'Hash' => post("Hash",1)
);

$suc_resultback = array(
    'ReturnCode' => '1',
    'ReturnMsg' => 'Access succeeded.'
);

$fal_resultback = array(
    'ReturnCode' => '2',
    'ReturnMsg' => 'Access faild, something goes wrong.'
);


$data = array(
    'FacTradeSeq' => $result["FacTradeSeq"],
    'ReturnCode' => $result["ReturnCode"],
    'PaymentType' => $result["PaymentType"]
);


if(!empty($_POST["ReturnCode"]) && !empty($_POST["ReturnMsg"]) && !empty($_POST["PayResult"])){

    $mycard = new coderMycardHelp();
    $result = $mycard->MycardProcess($data);

    if($result == "PaymentOK"){
        echo json_encode($suc_resultback);
    }
    else
    echo json_encode($fal_resultback);
}else{

    echo json_encode($fal_resultback);

}


?>


