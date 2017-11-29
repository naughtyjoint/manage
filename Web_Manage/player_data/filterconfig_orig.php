<?php
$filterhelp = new coderFilterHelp();
$obj[] = array('type' => 'keyword', 'name' => '關鍵字', 'sql' => true, 'ary' => array(
    array('column' => $colname['nickname'], 'name' => '暱稱'),
    //array('column' => $colname_b['period_number'], 'name' => '期數'),
    array('column' => $colname_bo['content'], 'name' => '投注內容'),
    //array('column' => $colname_b['manager'], 'name' => '最後管理者')
));
//$obj[] = array('type' => 'select', 'name' => '開獎', 'column' => $colname_b['id'], 'sql' => true, 'ary' => coderHelp::makeAryKeyToAryElement($langary_bettings, 'value', 'name'));

$obj[] = array('type' => 'select', 'name' => '玩法', 'column' => $colname_bo['gameId'], 'sql' => true, 'ary' => class_game_rules::getList());

$obj[] = array('type' => 'dategroup', 'column' => 'dategroup', 'sql' => true, 'ary' => array(array('column' => $colname_bo['create_time'], 'name' => '投注時間')));
$filterhelp->Bind($obj);
