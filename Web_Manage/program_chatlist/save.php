<?php
include_once('_config.php');
include_once('formconfig.php');

$errorhandle=new coderErrorHandle();
try{
    $db = Database::DB();
    $id = post($colname['id'],1);
    $pg_id = post($colname_ep['id'],1);
    if($id!=""){
        //coderAdmin::vaild($auth,'edit');
        $method='edit';
        $active=$langary_edit_add['edit'];
    }else{
        //coderAdmin::vaild($auth,'add');
        $method='add';
        $active=$langary_edit_add['add'];
    }

    $data=$fhelp->getSendData();
    $error=$fhelp->vaild($data);
    if(count($error)>0){
        $msg=implode('<br/>',$error);
        throw new Exception($msg);
    }

    /* ## coder [beforeModify] --> ## */
    /* ## coder [beforeModify] <-- ## */
    //$data[$colname['id']] = null;
    //start from here


    $nowtime = datetime();
    $data[$colname_ep['manage']]=$adminuser['username'];
    $data[$colname_ep['updatetime']]= $nowtime;


    if($method=='edit'){
        //$db->query_update($table_ep,$data," {$colname_ep['id']}='{$id}'");
        $db->query_update($table_ep,$data," {$colname_ep['id']}='{$id}'");
	}else{
        /* ## coder [indInit] --> ## */
        /* ## coder [indInit] <-- ## */
        /* ## coder [insert] --> ## */
        /* ## coder [insert] <-- ## */        
		$data[$colname['createtime']]= $nowtime;
		$id=$db->query_insert($table,$data);
	}

    $admin_title=isset($data[$colname['name']]) ? $data[$colname['name']] : '';
    coderAdminLog::insert($adminuser['username'],$main_auth_key,$fun_auth_key,$method,"{$data[$colname['name']]} id:{$id}");


    $db->close();

    echo showParentSaveNote($page_title,$active,$admin_title,"manage.php?id=".$id."pgram_id=".$pg_id);
}
catch(Exception $e){
	$errorhandle->setException($e); // 收集例外
}

if ($errorhandle->isException()) {
    $errorhandle->showError();
}
?>