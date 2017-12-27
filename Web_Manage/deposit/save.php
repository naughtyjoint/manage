<?php
include_once('_config.php');
include_once('formconfig.php');

$errorhandle = new coderErrorHandle();
try {
    $db = Database::DB();
    $id = post($colname['id'], 1);
    if ($id != "") {
        coderAdmin::vaild($auth, 'edit');
        $method = 'edit';
        $active = '編輯';
    } else {
        coderAdmin::vaild($auth, 'add');
        $method = 'add';
        $active = '新增';
    }

    $data = $fhelp->getSendData();
    $error = $fhelp->vaild($data);
    if (count($error) > 0) {
        $msg = implode('<br/>', $error);
        throw new Exception($msg);
    }

    $nowtime = datetime();
    $data[$colname['manager']] = $adminuser['username'];
    $data[$colname['update_time']] = $nowtime;
    $amount = post($colname['money'],0);

    $nowstatus = post("nowstatus");
    $point = $colname_product['update_time'];
    

    if ($method == 'edit') {
        $row = $db->query_prepare_first("select * from $table  WHERE {$colname['id']}=:id", array(':id' => $id));
        if(!empty($row[$colname['status']])){
            $data[$colname['status']] = $row[$colname['status']];
        }else{
            $data[$colname['status']] = $nowstatus;
        }
        $db->query_update($table, $data, " {$colname['id']}='{$id}'");
        
    } else {
        if($amount==0){
            $ProudctId = post($colname_product['product_id'],1);
            $row_amount = $db->query_prepare_first("select {$colname_product['amount']} from $table_product WHERE {$colname_product['product_id']} = :P_id", array(':P_id' => $ProudctId));
            $data[$colname['money']] = $row_amount['amount'];
        }else{
            $data[$colname['money']] = $amount;
        }
        $data[$colname['member_id']] = post($colname['member_id'],1);
        $data[$colname['platform_id']] = post($colname['platform_id'],1);
        $data[$colname['product_id']] = post($colname['product_id'],1);
        $data[$colname['create_time']] = $nowtime;

        $id = $db->query_insert($table, $data);
    }


    $admin_title = isset($data[$colname['id']]) ? $data[$colname['id']] : '';
    coderAdminLog::insert($adminuser['username'], $main_auth_key, $fun_auth_key, $method, "id:{$id}");


    $db->close();

    echo showParentSaveNote($page_title, $active, $admin_title, "manage.php?id=" . $id);
} catch (Exception $e) {
    $errorhandle->setException($e); // 收集例外
}

if ($errorhandle->isException()) {
    $errorhandle->showError();
}
?>
