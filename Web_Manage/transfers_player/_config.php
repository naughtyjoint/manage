<?php
$inc_path="../../inc/";
$manage_path="../";
include('../_config.php');


$table=coderDBConf::$player;
$colname=coderDBConf::$col_player;


$table_a = coderDBConf::$admin; //管理員
$colname_a = coderDBConf::$col_admin;

$colname_t=coderDBConf::$col_deposit; //上下分

$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title="玩家資料";
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon="icon-group";
