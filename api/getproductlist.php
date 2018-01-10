<?php

include_once "_database.class.php";

$result =array(
    'success' => true,
    'result' => '',
    'message' => "request successful"
);
try{
    $db = Database::DB();

    isset($_GET["id"])?
        $row = $db->preparefetch_all_array("SELECT * FROM product WHERE id=:id",[':id' => $_GET["id"]]):
        $row = $db->fetch_all_array("SELECT * FROM product");

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