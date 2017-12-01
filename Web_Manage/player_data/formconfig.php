<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
    $fobj[$colname["status"]]=array("type"=>"checkbox","name"=>"啟用","column"=>$colname["status"],"value"=>"1");
    $fobj[$colname['title']]=array('type'=>'text','name'=>'暱稱','column'=>$colname['title'],'autocomplete'=>'off','placeholder'=>'請輸入玩家暱稱','icon'=>'<i class="icon-user"></i>','validate'=>array('required'=>'yes'));
    $fobj[$colname['ug_id']] = array(
        'type' => 'select', 'name' => '群組', 'column' => $colname['ug_id'], 'ary' => $group_array, 'validate' => array(
            'required' => 'yes'
        )
    );
    $fobj[$colname['bank']]=array('type'=>'text','name'=>'銀行','column'=>$colname['bank'],'autocomplete'=>'off','placeholder'=>'請輸入銀行名稱','validate'=>array('required'=>'yes'));
    $fobj[$colname['bank_no']]=array('type'=>'text','name'=>'卡號','column'=>$colname['bank_no'],'autocomplete'=>'off','placeholder'=>'請輸入卡號','validate'=>array('required'=>'yes'));
    
    

$fhelp->Bind($fobj);
