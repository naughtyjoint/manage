<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
    $fobj[$colname['name']]=array('type'=>'text','name'=>'產品名稱','column'=>$colname['name'],'autocomplete'=>'off','placeholder'=>'請輸入產品名稱','validate'=>array('required'=>'yes'));
    $fobj[$colname['product_id']]=array('type'=>'text','name'=>'產品ID','column'=>$colname['product_id'],'autocomplete'=>'off','placeholder'=>'請輸入產品ID','validate'=>array('required'=>'yes'));    
    $fobj[$colname["create_time"]]=array("type"=>"hidden","name"=>"建立時間","column"=>$colname["create_time"],"sql"=>false);
$fhelp->Bind($fobj);
