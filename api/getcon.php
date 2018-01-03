<?php
include_once('codermycardhelp.php');
$result = array(
    'ReturnCode' => $_POST["ReturnCode"],
    'ReturnMsg' => $_POST["ReturnMsg"],
    'PayResult' => $_POST["PayResult"],
    'FacTradeSeq' => $_POST["FacTradeSeq"],
    'PaymentType' => $_POST["PaymentType"],
    'Amount' => $_POST["Amount"],
    'Currency' => $_POST["Currency"],
    'MyCardTradeNo' => $_POST["MyCardTradeNo"],
    'MyCardType' => $_POST["MyCardType"],
    'PromoCode' => $_POST["PromoCode"],
    'Hash' => $_POST["Hash"]
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


