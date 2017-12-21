<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
$fobj[$colname["ReturnCode"]]=array("type"=>"hidden","name"=>"交易狀態","column"=>$colname["ReturnCode"],"sql"=>false);
$fobj[$colname["PayResult"]]=array("type"=>"hidden","name"=>"申請狀態","column"=>$colname["PayResult"],"sql"=>false);
$fobj[$colname["member_id"]]=array("type"=>"hidden","name"=>"會員ID","column"=>$colname["member_id"],"sql"=>false);
$fobj[$colname["product_id"]]=array("type"=>"hidden","name"=>"產品名稱","column"=>$colname["product_id"],"sql"=>false);
$fobj[$colname["Amount"]]=array("type"=>"text","name"=>"金額","column"=>$colname["Amount"],'placeholder'=>'請輸入金額',"validate"=>array('maxlength' => '50','digits'=>'yes'),'sql'=>false);
$fobj[$colname["Currency"]]=array("type"=>"text","name"=>"幣別","column"=>$colname["Currency"],'placeholder'=>'請輸入幣別',"validate"=>array('maxlength' => '50','digits'=>'yes'),'sql'=>false);
$fhelp->Bind($fobj);
