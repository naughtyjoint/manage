<?php

$opt = json_decode(file_get_contents('php://input'));

$ReturnCode = $opt->ReturnCode;
$ReturnMsg = $opt->ReturnMsg;
$FacServiceId = $opt->FacServiceId;
$TotalNum = $opt->TotalNum;
$FacTradeSeq = $opt->FacTradeSeq;



$suc_resultback = array(
    'ReturnCode' => '1',
    'ReturnMsg' => 'Access succeeded.'
);

$fal_resultback = array(
    'ReturnCode' => '2',
    'ReturnMsg' => 'Access faild, Something goes wrong.'
);

if(!empty($ReturnCode) && $FacServiceId == "luckyCL" && isset($FacTradeSeq)){

    include 'database.php';

    if($TotalNum == 1){


        $query = "UPDATE mycard SET ReturnCode=:ReturnCode WHERE FacTradeSeq=:FacTradeSeq";

        $stmt = $con->prepare($query);
        $stmt->bindParam(':ReturnCode', $ReturnCode);
        $stmt->bindParam(':FacTradeSeq', $FacTradeSeq);
        $stmt->execute();


    }else if($TotalNum > 1){
        foreach ($FacTradeSeq as $TradeSeq) {

            $query = "UPDATE mycard SET ReturnCode=:ReturnCode WHERE FacTradeSeq=:FacTradeSeq";

            $stmt = $con->prepare($query);
            $stmt->bindParam(':ReturnCode', $ReturnCode);
            $stmt->bindParam(':FacTradeSeq', $TradeSeq);
            $stmt->execute();

        }

    }
    echo json_encode($suc_resultback);
}else{
    echo json_encode($fal_resultback);
}