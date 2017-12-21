<?php
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
    'ReturnMsg' => 'Access faild, Parameter goes wrong.'
);

if(!empty($_POST["ReturnCode"]) && !empty($_POST["ReturnMsg"]) && !empty($_POST["PayResult"])){
    include 'database.php';
    $query = "UPDATE mycard SET ReturnCode=:ReturnCode , PaymentType=:PaymentType , Pay_time=:Paytime WHERE FacTradeSeq=:FacTradeSeq";
    $datetime = date('Y-m-d H:i:s',time());
    $stmt = $con->prepare($query);
    $stmt->bindParam(':ReturnCode', $result['ReturnCode']);
    $stmt->bindParam(':PaymentType', $result['PaymentType']);
    $stmt->bindParam(':Paytime', $datetime);
    $stmt->bindParam(':FacTradeSeq', $result['FacTradeSeq']);
    $stmt->execute();

    $query_confirm = "SELECT AuthCode FROM mycard WHERE FacTradeSeq=:FacTradeSeq";
    $stmt = $con->prepare($query_confirm);
    $stmt->bindParam(':FacTradeSeq', $result['FacTradeSeq']);
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);





    $authcode = $row['AuthCode'];
    $url = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/PaymentConfirm?AuthCode=".$authcode;
    $ch = curl_init();


    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);

    $output = curl_exec($ch);
    $opt = json_decode($output);
    curl_close($ch);


    $query_payment = "UPDATE mycard SET PayResult=:PayResult ,Check_time=:Checktime WHERE FacTradeSeq=:FacTradeSeq";
    $stmt = $con->prepare($query_payment);
    $stmt->bindParam(':PayResult',$opt->ReturnCode);
    $stmt->bindParam(':Checktime', $datetime);
    $stmt->bindParam(':FacTradeSeq', $result['FacTradeSeq']);
    $stmt->execute();

    echo json_encode($suc_resultback);

}else{

    echo json_encode($fal_resultback);

}





