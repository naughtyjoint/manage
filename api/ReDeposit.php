<?php
include_once('codermycardhelp.php');
header('Content-type:application/json; charset=utf-8');
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

if(!empty($ReturnCode) && $FacServiceId == "luckySG" && isset($FacTradeSeq)){

    $datetime = date('Y-m-d H:i:s',time());
    $redepositcheck = true;
    $mycard = new coderMycardHelp();
    if($TotalNum == 1){

        $data = array(
            'FacTradeSeq' => $FacTradeSeq,
            'ReturnCode' => $ReturnCode,
            'PaymentType' => null,
            'Redeposit' => 1
        );



        $mycard->MycardProcess($data);


    }else if($TotalNum > 1){
        foreach ($FacTradeSeq as $TradeSeq) {

            $data = array(
                'FacTradeSeq' => $TradeSeq,
                'ReturnCode' => $ReturnCode,
                'PaymentType' => null,
                'Redeposit' => 1
            );


            $mycard->MycardProcess($data);

        }
        $db = Database::DB();
        $db->close();

    }
    echo json_encode($suc_resultback);
}else{
    echo json_encode($fal_resultback);
}