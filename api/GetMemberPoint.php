<?php
include_once "coderpointhelp.php";

$result_suc =array(
    'success' => true,
    'result' => '',
    'message' => "request successful"
);
$result_fal =array(
    'success' => false,
    'result' => '',
    'message' => "request filed"
);
try{
    $db = Database::DB();

    (isset($_GET["id"]) && $_GET["id"]!="")?
        $row = coderPointHelp::getPoint($_GET["id"]):
        $row = "";
    $db->close();

    $result_suc["result"]=$row;
    echo (isset($_GET["id"]) && $_GET["id"]!="")?
    json_encode($result_suc):json_encode($result_fal);

}
catch(Exception $e) {
    $db->close();
    $result['success'] = false;
    $result['message'] = $e->getMessage();
    echo json_encode($result);
}