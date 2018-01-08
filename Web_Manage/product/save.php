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
        $active='編輯';
    }else{
        coderAdmin::vaild($auth,'add');
        $method='add';
        $active='新增';
    }

    $data=$fhelp->getSendData();
    $error=$fhelp->vaild($data);
    if(count($error)>0){
        $msg=implode('<br/>',$error);
        throw new Exception($msg);
    }

    if(count($error)>0){
        $msg=implode('<br/>',$error);
        throw new Exception($msg);
    }


    $nowtime = datetime();
    $ratio = $data['point']/$data['amount'];
    $data[$colname['manager']]=$adminuser['username'];
    $data[$colname['update_time']]= $nowtime;
    $data[$colname['ratio']] = $ratio;



    if($method=='edit'){
        $oneBucksCount = $db->queryCount('SELECT * FROM product WHERE amount = 1 AND status = 1');
        if($oneBucksCount > 0 && $data[$colname['status']]==1){
            throw new Exception($langary_Web_Manage_all['product_repeat']);
        }else{
            $db->query_update($table,$data," {$colname['id']}='{$id}'");
        }
	}else{
        $data[$colname['product_id']]=uniqid('GS');
		$data[$colname['create_time']]= $nowtime;
		$id=$db->query_insert($table,$data);
	}


    $admin_title=isset($data[$colname['id']]) ? $data[$colname['id']] : '';
    coderAdminLog::insert($adminuser['username'],$main_auth_key,$fun_auth_key,$method,"id:{$id}");


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