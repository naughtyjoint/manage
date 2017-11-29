<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
$fobj[$colname["name"]]=array("type"=>"text","name"=>"申請人","column"=>$colname["name"],'placeholder'=>'請輸入申請人',"validate"=>array('required' => 'yes','maxlength' => '60'));
$fobj[$colname["money"]]=array("type"=>"text","name"=>"金額","column"=>$colname["money"],'placeholder'=>'請輸入金額',"validate"=>array('required' => 'yes','maxlength' => '50'));
$fobj[$colname["company"]]=array("type"=>"text","name"=>"第三方公司","column"=>$colname["company"],'placeholder'=>'請輸入第三方公司',"validate"=>array('required' => 'yes','maxlength' => '50'));
$fobj[$colname["method"]]=array("type"=>"text","name"=>"方式","column"=>$colname["method"],'placeholder'=>'請輸入方式',"validate"=>array('required' => 'yes','maxlength' => '50'));
$fobj[$colname["contents"]]=array("type"=>"textarea","name"=>"備註","column"=>$colname["contents"],'placeholder'=>'請輸入備註',"validate"=>array('required' => 'yes','maxlength' => '255'));
$fhelp->Bind($fobj);
