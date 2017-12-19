<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]=array("type"=>"hidden","name"=>"ID","column"=>$colname["id"],"sql"=>false);
    $fobj[$colname['name']]=array('type'=>'text','name'=>'玩家名稱','column'=>$colname['name'],'autocomplete'=>'off','placeholder'=>'請輸入玩家暱稱','icon'=>'<i class="icon-user"></i>','validate'=>array('required'=>'yes'));
    $fobj[$colname['game_id']] = array(
        'type' => 'select', 'name' => '遊戲名稱', 'column' => $colname['game_id'], 'ary' => $group_array, 'validate' => array(
            'required' => 'yes'
        )
    );
    
    $fobj[$colname["create_time"]]=array("type"=>"hidden","name"=>"建立時間","column"=>$colname["create_time"],"sql"=>false);
    

$fhelp->Bind($fobj);
