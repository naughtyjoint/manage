<?php
session_start();
session_unset();
$result =array(
    'success' => 'true',
    'message' => "Logout successfully"
);
echo json_encode($result);
?>
