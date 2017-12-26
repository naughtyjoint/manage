<?php

$DATA = array(
    "ReturnCode" => "1",
    "ReturnMsg" => "QueryOK",
    "FacServiceId" => "luckyCL",
    "TotalNum" => 4,
    "FacTradeSeq" =>
    ["MC5a41f04e1638b","MC5a41f07810adf"]
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



