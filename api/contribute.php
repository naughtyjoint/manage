<?php
session_start();
include_once 'coderpointhelp.php';

$loginless_resultback = array(
    'success' => 'false',
    'result' => '',
    'message' => 'Please login.'
);

$fal_resultback = array(
    'success' => 'false',
    'result' => '',
    'message' => 'Contribution failed.'
);

if(isset($_SESSION['memberData']) && ($_SESSION['memberData']!="")){
    if(!empty($_POST["anchor_id"])&&!empty($_POST["point"])&&!empty($_POST["content"])){
        $member_id = $_SESSION['memberData']['member_id'];
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
}else{
        echo json_encode($loginless_resultback);
}

?>





