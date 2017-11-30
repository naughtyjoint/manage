<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('column' => $colname_u['title'], 'name' => '申請人'),
    array('column' => $colname['money'], 'name' => '金額'),
    array('column' => $colname['manager'], 'name' => '最後管理者')
));
//$obj[] = array('type' => 'select', 'name' => '公開', 'column' => $colname['is_public'], 'sql' => true, 'ary' => coderHelp::makeAryKeyToAryElement($langary_yn,'value','name'));

$obj[] = array('type' => 'select', 'name' => '狀態', 'column' => $colname['status'],'table'=>'t', 'sql' => true, 'ary' => coderHelp::makeAryKeyToAryElement($langary_transfers, 'value', 'name'));
$obj[] = array('type' => 'dategroup', 'column' => 'dategroup', 'sql' => true, 'ary' => array(array('column' => $colname['create_time'], 'name' => '建立時間'), array('column' => $colname['update_time'], 'name' => '最後修改時間')));
$filterhelp->Bind($obj);
