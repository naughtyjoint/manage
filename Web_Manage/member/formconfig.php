<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
    $fobj[$colname['member_id']]=array('type'=>'text','name'=>'會員ID','column'=>$colname['member_id'],'autocomplete'=>'off','placeholder'=>'請輸入會員ID', array('required' => 'yes'));
    $fobj[$colname['name']]     =array('type'=>'text','name'=>'會員名稱','column'=>$colname['name'],'autocomplete'=>'off','placeholder'=>'請輸入會員名稱','icon'=>'<i class="icon-user"></i>', array('required' => 'yes'));
    $fobj[$colname['platform_id']] = array(
        'type' => 'select', 'name' => '平台名稱', 'column' => $colname['platform_id'], 'ary' => $group_array,"sql"=>false
    );
    $fobj[$colname['email']]=array('type'=>'text','name'=>'E-mail','column'=>$colname['email'],'autocomplete'=>'off','placeholder'=>'請輸入E-mail', array('required' => 'yes'));
    $fobj[$colname['point']]=array('type'=>'text','name'=>'積分','column'=>$colname['point'],'autocomplete'=>'off','placeholder'=>'請輸入積分','icon'=>'<i class="icon-user"></i>', array('required' => 'yes'));
    $fobj[$colname["create_time"]]=array("type"=>"hidden","name"=>"建立時間","column"=>$colname["create_time"],"sql"=>false);
    

$fhelp->Bind($fobj);
