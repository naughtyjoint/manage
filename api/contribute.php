<?php
include_once 'coderpointhelp.php';


$fal_resultback = array(
    'ReturnCode' => '2',
    'ReturnMsg' => 'failed to get AuthCode .'
);


if(isset($_POST["token"])&&isset($_POST["member_id"])&&isset($_POST["anchor_id"])&&isset($_POST["point"])&&isset($_POST["content"])){
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
    $contribute->Contribution($contribute_ary);

    $result['success']=true;
    $result['result']=$contribute_ary;
    $result['message']='Accessed successfully';
    echo json_encode($result);


}else{
    echo json_encode($fal_resultback);
}


?>





