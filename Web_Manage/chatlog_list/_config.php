<?php
$inc_path="../../inc/";
$manage_path="../";
$main_auth_key='program';
$fun_auth_key='program_list';
include('../_config.php');

$auth=coderAdmin::Auth($fun_auth_key);

$table=coderDBConf::$program;
$colname=coderDBConf::$col_program;

$table_cl=coderDBConf::$chatlog;
$colname_cl=coderDBConf::$col_chatlog;

$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title="節目聊天紀錄";
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon="icon-group";
