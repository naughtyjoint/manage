<?php
include_once('_config.php');
$opt = json_decode(file_get_contents('php://input'));

$ReturnCode = "1";//$opt->ReturnCode;
$ReturnMsg = "QueryOK";//$opt->ReturnMsg;
$FacServiceId = "luckyCL";//$opt->FacServiceId;
$TotalNum = 2;//$opt->TotalNum;
$FacTradeSeq = ["MC5a4210c3dd743","MC5a4210e5c2f51"];//$opt->FacTradeSeq;



$suc_resultback = array(
    'ReturnCode' => '1',
    'ReturnMsg' => 'Access succeeded.'
);

$fal_resultback = array(
    'ReturnCode' => '2',
    'ReturnMsg' => 'Access faild, Something goes wrong.'
);

if(!empty($ReturnCode) && $FacServiceId == "luckyCL" && isset($FacTradeSeq)){

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
        $db->close();

    }
    echo json_encode($suc_resultback);
}else{
    echo json_encode($fal_resultback);
}