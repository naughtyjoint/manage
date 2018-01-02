<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
$fobj[$colname["contents"]]=array("type"=>"textarea","name"=>"備註","column"=>$colname["contents"],'placeholder'=>'請輸入備註',"validate"=>array('maxlength' => '255'));

$fobj[$colname["user_id"]]=array("type"=>"hidden","name"=>"玩家","column"=>$colname["user_id"],"sql"=>false);
$fobj[$colname["platform_id"]]=array("type"=>"hidden","name"=>"平台名稱","column"=>$colname["platform_id"],"sql"=>false);

$fobj[$colname["money"]]=array("type"=>"text","name"=>"金額","column"=>$colname["money"],'placeholder'=>'請輸入金額',"validate"=>array('maxlength' => '50','digits'=>'yes'),'sql'=>false);
$fobj[$colname["status"]]=array("type"=>"radio","name"=>"狀態","column"=>$colname["status"],'ary'=>coderHelp::makeAryKeyToAryElement($langary_transfers_manage,'key','name'),'mode'=>'no',"placeholder"=>"請設定狀態","equal"=>"=");
$fhelp->Bind($fobj);
