<?php
include_once 'coderpointhelp.php';


$fal_resultback = array(
    'success' => 'false',
    'result' => '',
    'message' => 'Contribution failed.'
);


if(!empty($_POST["token"])&&!empty($_POST["member_id"])&&!empty($_POST["anchor_id"])&&!empty($_POST["point"])&&!empty($_POST["content"])){
    $member_id = $_POST["member_id"];
    $anchor_id = $_POST["anchor_id"];
    $point = $_POST["point"];
    $content = $_POST["content"];
    $contribute_ary = array(
        'mem_id' => $member_id,
        'anc_id' => $anchor_id,
        'point' => $point,
        'content' => $content
    );
    $contribute = new coderPointHelp();
    $result = $contribute->Contribution($contribute_ary);

    echo json_encode($result);


}else{
    echo json_encode($fal_resultback);
}


?>





