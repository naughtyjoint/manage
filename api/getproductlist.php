<?php

include_once "_database.class.php";

$db = Database::DB();
$sql = 'SELECT * FROM product';
$rows = $db->preparefetch_all_array($sql);

$result['success']=true;
$result['result']=$rows;
echo json_encode($result);



