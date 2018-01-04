<?php
include_once('_config.php');
include_once('formconfig.php');

$errorhandle=new coderErrorHandle();
try{
    $db = Database::DB();
    $id = post($colname['id'],1);
    if($id!=""){
        coderAdmin::vaild($auth,'edit');
        $method='edit';
        $active=$langary_edit_add['edit'];
    }else{
        coderAdmin::vaild($auth,'add');
        $method='add';
        $active=$langary_edit_add['add'];
    }

    $data=$fhelp->getSendData();
    $error=$fhelp->vaild($data);
    if(count($error)>0){
        $msg=implode('<br/>',$error);
        throw new Exception($msg);
    }

    //多圖圖片
    //$picgroup = $data[$colname['picgroup']];
    //$data[$colname['picgroup']] = json_encode($picgroup);

    /* ## coder [beforeModify] --> ## */
    /* ## coder [beforeModify] <-- ## */

    $nowtime = datetime();
    $data[$colname['manager']]=$adminuser['username'];
    $data[$colname['updatetime']]= $nowtime;


    if($method=='edit'){
        $db->query_update($table,$data," {$colname['id']}='{$id}'");
	}else{
        /* ## coder [indInit] --> ## */
        /* ## coder [indInit] <-- ## */
        /* ## coder [insert] --> ## */
        /* ## coder [insert] <-- ## */        
		$data[$colname['createtime']]= $nowtime;
		$id=$db->query_insert($table,$data);
	}

    coderFormHelp::moveCopyPic($data[$colname['thumbnail']],$admin_path_temp,$file_path,'s');


    $admin_title=isset($data[$colname['name']]) ? $data[$colname['name']] : '';
    coderAdminLog::insert($adminuser['username'],$main_auth_key,$fun_auth_key,$method,"{$data[$colname['name']]} id:{$id}");


    $db->close();

    echo showParentSaveNote($page_title,$active,$admin_title,"manage.php?id=".$id);
}
catch(Exception $e){
	$errorhandle->setException($e); // 收集例外
}

if ($errorhandle->isException()) {
    $errorhandle->showError();
}
?>