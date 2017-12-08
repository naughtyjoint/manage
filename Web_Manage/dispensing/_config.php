<?php
$inc_path="../../inc/";
$manage_path="../";
$main_auth_key='dispensing';
$fun_auth_key='app';
include('../_config.php');

$auth=coderAdmin::Auth($fun_auth_key);

$table=coderDBConf::$dispensing;
$colname=coderDBConf::$col_dispensing;

$table_log=coderDBConf::$dispensing_log;
$colname_log=coderDBConf::$col_dispensing_log;

$table_b=coderDBConf::$bank_card;
$colname_b=coderDBConf::$col_bank_card;

$table_u=coderDBConf::$player; //玩家
$colname_u=coderDBConf::$col_player;

$table_g=coderDBConf::$game; //遊戲名稱
$colname_g=coderDBConf::$col_game;


$bank_array = class_bank::getListCard(); //銀行卡

$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title=$auth['name'];
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon=$auth['icon'];
