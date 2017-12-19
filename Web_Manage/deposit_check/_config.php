<?php
$inc_path="../../inc/";
$manage_path="../";
include('../_config.php');

$main_auth_key='deposit';
$fun_auth_key='deposit_check';


$auth=coderAdmin::Auth($fun_auth_key);

$table=coderDBConf::$deposit;
$colname=coderDBConf::$col_deposit;

$table_u=coderDBConf::$player; //玩家
$colname_u=coderDBConf::$col_player;

$table_g=coderDBConf::$game; //遊戲
$colname_g=coderDBConf::$col_game;


$table_third=coderDBConf::$deposit_pay; //第三方
$colname_third=coderDBConf::$col_deposit_pay;

$pay_array = class_player::getList_pay(); //第三方



$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title=$auth['name'];
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon=$auth['icon'];
