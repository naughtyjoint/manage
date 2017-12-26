<?php

$DATA = array(
    "ReturnCode" => "1",
    "ReturnMsg" => "QueryOK",
    "FacServiceId" => "luckyCL",
    "TotalNum" => 3,
    "FacTradeSeq" =>
    ["MC5a407e3c1c731","MC5a407e6d10742","MC5a407e959388f"]
    );

$DATA_jencode = json_encode($DATA);

$url = "localhost/manage/Web_Manage/mycard/ReDeposit.php";
$ch = curl_init();


curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $DATA_jencode);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);


$output = curl_exec($ch);
print_r($output);
curl_close($ch);

?>



