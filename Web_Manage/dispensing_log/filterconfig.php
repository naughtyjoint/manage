<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('table'=>'t','column' => $colname['manager'], 'name' => '最後管理者'),
    array('column' => $colname_u['name'], 'name' => '玩家名稱')
));

$obj[] = array('type' => 'dategroup', 'column' => 'dategroup', 'sql' => true,'table'=>'t','ary' => array(array('column' => $colname['update_time'], 'name' => '修改時間')));
$filterhelp->Bind($obj);
