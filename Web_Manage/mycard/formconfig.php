<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
$fobj[$colname["PayResult"]]=array("type"=>"hidden","name"=>"狀態","column"=>$colname["PayResult"],"sql"=>false);
$fobj[$colname["CustomerId"]]=array("type"=>"hidden","name"=>"玩家ID","column"=>$colname["CustomerId"],"sql"=>false);
$fobj[$colname["ProductName"]]=array("type"=>"hidden","name"=>"產品名稱","column"=>$colname["ProductName"],"sql"=>false);
$fobj[$colname["Amount"]]=array("type"=>"text","name"=>"金額","column"=>$colname["Amount"],'placeholder'=>'請輸入金額',"validate"=>array('maxlength' => '50','digits'=>'yes'),'sql'=>false);
$fobj[$colname["Currency"]]=array("type"=>"text","name"=>"幣別","column"=>$colname["Currency"],'placeholder'=>'請輸入幣別',"validate"=>array('maxlength' => '50','digits'=>'yes'),'sql'=>false);
$fhelp->Bind($fobj);
