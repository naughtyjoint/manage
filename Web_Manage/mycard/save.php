<?php
include_once('_config.php');
include_once('formconfig.php');
$authcode = $_POST["AuthC"];
$url = "https://test.b2b.mycard520.com.tw/MyBillingPay/api/PaymentConfirm?AuthCode=".$authcode;
$ch = curl_init();


curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);

$output = curl_exec($ch);
$opt = json_decode($output);
curl_close($ch);

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

    //多圖圖片
    //$picgroup = $data[$colname['picgroup']];
    //$data[$colname['picgroup']] = json_encode($picgroup);

    /* ## coder [beforeModify] --> ## */
    /* ## coder [beforeModify] <-- ## */

    $nowtime = datetime();
    $data[$colname['manager']] = $adminuser['username'];
    $data[$colname['Check_time']]= $nowtime;    

    $nowstatus = $opt->ReturnCode;
    $data[$colname['PayResult']] = $nowstatus;
    if ($method == 'edit') {
        $db->query_update($table, $data, " {$colname['id']}='{$id}'");
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