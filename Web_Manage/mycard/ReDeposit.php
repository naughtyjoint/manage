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
    $datetime = date('Y-m-d H:i:s',time());
    $redepositcheck = true;

    if($TotalNum == 1){

        $query = "UPDATE mycard SET ReturnCode=:ReturnCode, Pay_time=:Paytime, Redeposit=:Redeposit WHERE FacTradeSeq=:FacTradeSeq";
        $stmt = $con->prepare($query);
        $stmt->bindParam(':ReturnCode', $ReturnCode);
        $stmt->bindParam(':Paytime', $datetime);
        $stmt->bindParam(':Redeposit', $redepositcheck);
        $stmt->bindParam(':FacTradeSeq', $FacTradeSeq);
        $stmt->execute();

        $query_confirm = "SELECT AuthCode, member_id, product_id FROM mycard WHERE FacTradeSeq=:FacTradeSeq";
        $stmt = $con->prepare($query_confirm);
        $stmt->bindParam(':FacTradeSeq', $FacTradeSeq);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);


        //mycard請款流程
        $authcode = $row['AuthCode'];
        $mem_id = $row['member_id'];
        $ProductId = $row['product_id'];
        $url = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/PaymentConfirm?AuthCode=".$authcode;
        $ch = curl_init();


        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);

        $output = curl_exec($ch);
        $opt = json_decode($output);
        curl_close($ch);


        //取得會員現有點數
        $query_member = "SELECT point FROM member WHERE member_id=:member_id";
        $stmt = $con->prepare($query_member);
        $stmt->bindParam(':member_id', $mem_id);
        $stmt->execute();
        $member_row = $stmt->fetch(PDO::FETCH_ASSOC);
        $orig_point = $member_row['point'];


        //取得產品總點數
        $query_point = "SELECT point, bonus FROM product WHERE product_id=:product_id";
        $stmt = $con->prepare($query_point);
        $stmt->bindParam(':product_id', $ProductId);
        $stmt->execute();

        $rows = $stmt->fetch(PDO::FETCH_ASSOC);
        $totalpoint = $orig_point+$rows['point']+$rows['bonus'];


        $query_payment = "UPDATE mycard SET PayResult=:PayResult ,Check_time=:Checktime WHERE FacTradeSeq=:FacTradeSeq";
        $stmt = $con->prepare($query_payment);
        $stmt->bindParam(':PayResult',$opt->ReturnCode);
        $stmt->bindParam(':Checktime', $datetime);
        $stmt->bindParam(':FacTradeSeq', $FacTradeSeq);
        $stmt->execute();

        $query_point_transfer = "UPDATE member SET point=:point WHERE member_id=:member_id";
        $stmt = $con->prepare($query_point_transfer);
        $stmt->bindParam(':point', $totalpoint);
        $stmt->bindParam(':member_id', $mem_id);
        $stmt->execute();


    }else if($TotalNum > 1){
        foreach ($FacTradeSeq as $TradeSeq) {

            $query = "UPDATE mycard SET ReturnCode=:ReturnCode, Pay_time=:Paytime, Redeposit=:Redeposit WHERE FacTradeSeq=:FacTradeSeq";

            $stmt = $con->prepare($query);
            $stmt->bindParam(':ReturnCode', $ReturnCode);
            $stmt->bindParam(':Paytime', $datetime);
            $stmt->bindParam(':Redeposit', $redepositcheck);
            $stmt->bindParam(':FacTradeSeq', $TradeSeq);
            $stmt->execute();

            $query_confirm = "SELECT AuthCode, member_id, product_id FROM mycard WHERE FacTradeSeq=:FacTradeSeq";
            $stmt = $con->prepare($query_confirm);
            $stmt->bindParam(':FacTradeSeq', $TradeSeq);
            $stmt->execute();

            $row = $stmt->fetch(PDO::FETCH_ASSOC);


            //mycard請款流程
            $authcode = $row['AuthCode'];
            $mem_id = $row['member_id'];
            $ProductId = $row['product_id'];
            $url = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/PaymentConfirm?AuthCode=".$authcode;
            $ch = curl_init();


            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);

            $output = curl_exec($ch);
            $opt = json_decode($output);
            curl_close($ch);

            //取得會員現有點數
            $query_member = "SELECT point FROM member WHERE member_id=:member_id";
            $stmt = $con->prepare($query_member);
            $stmt->bindParam(':member_id', $mem_id);
            $stmt->execute();
            $member_row = $stmt->fetch(PDO::FETCH_ASSOC);
            $orig_point = $member_row['point'];


            //取得產品總點數
            $query_point = "SELECT point, bonus FROM product WHERE product_id=:product_id";
            $stmt = $con->prepare($query_point);
            $stmt->bindParam(':product_id', $ProductId);
            $stmt->execute();

            $rows = $stmt->fetch(PDO::FETCH_ASSOC);
            $totalpoint = $orig_point+$rows['point']+$rows['bonus'];


            $query_payment = "UPDATE mycard SET PayResult=:PayResult ,Check_time=:Checktime WHERE FacTradeSeq=:FacTradeSeq";
            $stmt = $con->prepare($query_payment);
            $stmt->bindParam(':PayResult',$opt->ReturnCode);
            $stmt->bindParam(':Checktime', $datetime);
            $stmt->bindParam(':FacTradeSeq', $TradeSeq);
            $stmt->execute();

            $query_point_transfer = "UPDATE member SET point=:point WHERE member_id=:member_id";
            $stmt = $con->prepare($query_point_transfer);
            $stmt->bindParam(':point', $totalpoint);
            $stmt->bindParam(':member_id', $mem_id);
            $stmt->execute();

        }

    }
    echo json_encode($suc_resultback);
}else{
    echo json_encode($fal_resultback);
}