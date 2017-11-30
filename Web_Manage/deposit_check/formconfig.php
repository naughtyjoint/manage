<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
$fobj[$colname["remark"]]=array("type"=>"textarea","name"=>"備註","column"=>$colname["remark"],'placeholder'=>'請輸入備註',"validate"=>array('maxlength' => '255'));

$fobj[$colname["user_id"]]=array("type"=>"hidden","name"=>"玩家","column"=>$colname["user_id"],"sql"=>false);

$fobj[$colname["money"]]=array("type"=>"text","name"=>"金額","column"=>$colname["money"],'placeholder'=>'請輸入金額',"validate"=>array('maxlength' => '50','digits'=>'yes'),'sql'=>false);
$fobj[$colname["company"]]=array("type"=>"text","name"=>"第三方公司","column"=>$colname["company"],'placeholder'=>'請輸入第三方公司',"validate"=>array('require'=>'yes','maxlength' => '50'),'sql'=>false);
$fobj[$colname["method"]]=array("type"=>"text","name"=>"方式","column"=>$colname["method"],'placeholder'=>'請輸入方式',"validate"=>array('require'=>'yes','maxlength' => '50'),'sql'=>false);
$fobj[$colname["status"]]=array("type"=>"radio","name"=>"狀態","column"=>$colname["status"],'ary'=>coderHelp::makeAryKeyToAryElement($langary_transfers,'key','name'),'mode'=>'no',"placeholder"=>"請設定狀態","equal"=>"=");
$fhelp->Bind($fobj);
