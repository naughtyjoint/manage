<?php
$inc_path="../../inc/";
$manage_path="../";
$main_auth_key='program';
$fun_auth_key='program_list';
include('../_config.php');

$file_path=$admin_path_admin;

$auth=coderAdmin::Auth($fun_auth_key);

$table=coderDBConf::$program;
$colname=coderDBConf::$col_program;

//$table_tag=coderDBConf::$tag;
//$colname_tag=coderDBConf::$col_tag;

$tags_array = class_program::getList_all();

$page_title=$auth['name'];
$page=request_pag("page");
$page_desc="{$page_title}-".$langary_config['page_desc3'];
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon=$auth['icon'];
