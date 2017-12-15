<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('column' => $colname_u['name'], 'name' => '玩家名稱'),
    array('column' => $colname['manager'], 'name' => '最後管理者')
));
//$obj[] = array('type' => 'select', 'name' => '公開', 'column' => $colname['is_public'], 'sql' => true, 'ary' => coderHelp::makeAryKeyToAryElement($langary_yn,'value','name'));

$obj[] = array('type' => 'select', 'name' => '狀態', 'column' => $colname['PayResult'],'table'=>'t', 'sql' => true, 'ary' => coderHelp::makeAryKeyToAryElement($langary_transfers, 'value', 'name'));
$obj[] = array('type' => 'dategroup', 'column' => 'dategroup', 'sql' => true,'table'=>'t', 'ary' => array(array('column' => $colname['Created_date'], 'name' => '申請時間'), array('column' => $colname['Pay_time'], 'name' => '最後修改時間')));
$filterhelp->Bind($obj);
