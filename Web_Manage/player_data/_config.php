<?php
$inc_path="../../inc/";
$manage_path="../";
$main_auth_key='deposit';
$fun_auth_key='player';
include('../_config.php');

$auth=coderAdmin::Auth($fun_auth_key);

$table=coderDBConf::$player;
$colname=coderDBConf::$col_player;

$table_m=coderDBConf::$player_group;
$colname_m=coderDBConf::$col_player_group;

$table_a = coderDBConf::$admin; //管理員
$colname_a = coderDBConf::$col_admin;

$group_array = class_users_group::getList(); //角色ary

$orderColumn=$colname["id"];
$orderDesc='desc';
$page_title=$auth['name'];
$page=request_pag("page");
$page_desc="{$page_title}-您可將內容修改為希望呈現的內容。";
$mtitle='<li class="active">'.$page_title.'</li>';
$mainicon=$auth['icon'];

function isDateNotExisit($type,$val,$id=0)
{
    global $db,$table,$colname;
    switch ($type) {
        case 'username':
            $where = "";
            if($id>0){
                $where .= "and `{$colname['id']}`!=$id";
            }
            if (strlen($val)>2 && !$db->query_first("select {$colname['id']} from $table where `{$colname['username']}`='".hc($val)."' $where")){
                return true;
            }else {
                return false;
            }
            break;
        default:
            return false;
            break;
    }
}