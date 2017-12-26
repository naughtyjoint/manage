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

$db = Database::DB();
$datetime = date('Y-m-d H:i:s',time());
$table_mycard = "mycard";
$table_member = "member";
$data = array(
    'ReturnCode' => $result["ReturnCode"],
    'PaymentType' => $result["PaymentType"],
    "Pay_time" => $datetime
);
$FacTradeSeq = $result['FacTradeSeq'];

if(!empty($_POST["ReturnCode"]) && !empty($_POST["ReturnMsg"]) && !empty($_POST["PayResult"])){
    //更新交易狀態
    $db->query_update($table,$data," FacTradeSeq='$FacTradeSeq'");


    $query_confirm = "SELECT AuthCode, member_id, product_id FROM mycard WHERE FacTradeSeq=:FacTradeSeq";
    $row = $db->query_first($query_confirm,[':FacTradeSeq' => $result['FacTradeSeq']]);

    //mycard請款
    $mycard = new Mycard();
    $Payresult = $mycard->paymentConfirm($row['AuthCode']);


    //取得會員現有點數
    $mem_id = $row['member_id'];
    $query_member = "SELECT point FROM member WHERE member_id=:member_id";
    $member_row = $db->query_first($query_member,[':member_id' => $mem_id]);
    $orig_point = $member_row['point'];


    //取得產品總點數
    $ProductId = $row['product_id'];
    $query_point = "SELECT point, bonus FROM product WHERE product_id=:product_id";
    $rows = $db->query_first($query_point,[':product_id' => $ProductId]);
    $totalpoint = $orig_point+$rows['point']+$rows['bonus'];


    //更新mycard狀態
    $mycard_data = array(
        'PayResult' =>  $Payresult,
        'Checktime' => $datetime,
    );
    $query_payment = "UPDATE mycard SET PayResult=:PayResult ,Check_time=:Checktime WHERE FacTradeSeq=:FacTradeSeq";
    $db->query_update($table_mycard," FacTradeSeq='$FacTradeSeq'");


    //更新會員點數
    $query_point_transfer = "UPDATE member SET point=:point WHERE member_id=:member_id";
    $db->query_update($table_member,['point' => $totalpoint]," member_id='$mem_id'");


    echo json_encode($suc_resultback);

}else{

    echo json_encode($fal_resultback);

}





