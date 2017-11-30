<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('column' => $colname['money'], 'name' => '金額'),
    array('column' => $colname['manager'], 'name' => '最後管理者')
));
//$obj[] = array('type' => 'dategroup', 'column' => 'dategroup', 'sql' => true, 'ary' =>  array('column' => $colname['updated_time'], 'name' => '最後更改時間'));
$filterhelp->Bind($obj);
