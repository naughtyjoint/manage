<?php
$fhelp=new coderFormHelp();
$fobj=array();
$fobj[$colname["id"]]          =array("type"=>"hidden","name"=>$langary_Web_Manage_all['id'],       "column"=>$colname["id"],"sql"=>false);
$fobj[$colname["name"]]        =array("type"=>"text","name"=>$langary_Web_Manage_all['pgram_name'], "column"=>$colname["name"],         'placeholder'=>$langary_Web_Manage_all['name2_p'],'autocomplete'=>'off','icon'=>'<i class="icon-user"></i>',"validate"=>array('required' => 'yes','maxlength' => '255'));
$fobj[$colname["status"]]      =array("type"=>"text","name"=>$langary_Web_Manage_all['depiction'],  "column"=>$colname["description"],  'placeholder'=>$langary_Web_Manage_all['depiction_p'],'autocomplete'=>'off',"validate"=>array('required' => 'yes'));

$fhelp->Bind($fobj);
