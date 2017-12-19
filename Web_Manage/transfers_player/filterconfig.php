<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('column' => $colname['name'], 'name' => '玩家名稱'),
));
$obj[]=array('type'=>'select','name'=>$langary_Web_Manage_all['group'],'column'=>$colname['game_id'],'table'=>'g','sql'=>true,'ary'=>$game_array);
$filterhelp->Bind($obj);
