<?php
$inc_path="../../inc/";
$manage_path="../";
include('../_config.php');

$main_auth_key='deposit';
$fun_auth_key='application';


$auth=coderAdmin::Auth($fun_auth_key);

$table=coderDBConf::$deposit;
$colname=coderDBConf::$col_deposit;

$table_m=coderDBConf::$member; //玩家
$colname_m=coderDBConf::$col_member;

$table_p=coderDBConf::$platform; //遊戲
$colname_p=coderDBConf::$col_platform;

$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title=$auth['name'];
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon=$auth['icon'];
