<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('column' => $colname['title'], 'name' => '玩家名稱'),
    //array('column' => $colname['manager'], 'name' => '最後管理者')
));
$obj[] = array('type' => 'select', 'name' => '啟用', 'column' => $colname['status'], 'sql' => true, 'ary' => coderHelp::makeAryKeyToAryElement($langary_yn,'value','name'));

$obj[] = array('type' => 'dategroup', 'column' => 'dategroup', 'sql' => true, 'ary' => array(array('column' => $colname['create_time'], 'name' => '建立時間'), array('column' => $colname['update_time'], 'name' => '最後修改時間')));
$filterhelp->Bind($obj);
