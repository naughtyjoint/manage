<?php
$inc_path="../../inc/";
$manage_path="../";
include('../_config.php');

$table=coderDBConf::$member;
$colname=coderDBConf::$col_member;

$table_a=coderDBConf::$agent;
$colname_a=coderDBConf::$col_agent;


$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title="代理會員";
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon="icon-group";
