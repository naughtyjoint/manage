<?php

$DATA = array(
    "ReturnCode" => "1",
    "ReturnMsg" => "QueryOK",
    "FacServiceId" => "luckyCL",
    "TotalNum" => 2,
    "FacTradeSeq" => ["MC5a44ba41c095c","MC5a44ba63b3ae6"]
    );

$DATA_jencode = json_encode($DATA);

$url = "http://www.pkfun.xyz/api/ReDeposit.php";
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



