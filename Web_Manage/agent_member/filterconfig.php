<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('column' => $colname['member_id'], 'name' => '會員ID'),
    array('column' => $colname['name'], 'name' => '會員名稱')
));
$obj[] = array('type' => 'dategroup', 'column' => 'dategroup', 'sql' => true, 'table'=>'m','ary' => array(array('column' => $colname['create_time'], 'name' => '申請時間')));
$filterhelp->Bind($obj);
