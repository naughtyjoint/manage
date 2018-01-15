<?php
include "_database.class.php";
header('Content-type:application/json; charset=utf-8');

$result =array(
    'success' => true,
    'result' => '',
    'message' => "request successful"
);
try{
    $db = Database::DB();

    isset($_GET["id"])?
        $row = $db->preparefetch_all_array("SELECT * FROM program_episode WHERE ep_pgram_id=:id ORDER BY ep_createtime", array(":id"=>$_GET["id"]) ):
        $row = $db->fetch_all_array("SELECT * FROM program_episode ORDER BY ep_createtime");

    $db->close();
    $result["result"]=$row;
    echo json_encode($result);
}
catch(Exception $e) {
    $db->close();
    $result['success'] = false;
    $result['message'] = $e->getMessage();
    echo json_encode($result);
}

