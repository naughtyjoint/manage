<?php
$inc_path="../../inc/";
$manage_path="../";
include('../_config.php');

$main_auth_key='deposit';
$fun_auth_key='deposit_check';


$auth=coderAdmin::Auth($fun_auth_key);

$table=coderDBConf::$deposit_check;
$colname=coderDBConf::$col_deposit_check;


$table_u=coderDBConf::$player; //玩家
$colname_u=coderDBConf::$col_player;



$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title=$auth['name'];
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon=$auth['icon'];
