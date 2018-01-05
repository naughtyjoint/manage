<?php
header("Content-Type: text/html; charset=utf-8");
session_start();
session_unset();
    $_SESSION['UserDate'] = NULL;
    $_SESSION['memberDate'] = NULL;
$result =array(
    'success' => 'true',
    'message' => "Logout successfully"
);
echo json_encode($result);
?>
