<?php
include_once('_config.php');
include_once('filterconfig_log.php');
$errorhandle=new coderErrorHandle();
try{
	coderAdmin::vaild($auth,'view');
    $getid = (get('id')!="")?get('id'):0;
    if($getid <= 0) {
        throw new Exception("error");
    }
	$db = Database::DB();
	$sHelp=new coderSelectHelp($db);
    $sHelp->select="b.*,u.`{$colname['id']}` as uid,u.`{$colname['nickname']}`,bo.`{$colname_bo['gameId']}`";
    $sHelp->table=$table_b." b
                  LEFT JOIN $table_bo bo ON bo.`{$colname_bo['id']}` = b.`{$colname_b['origId']}`
	              LEFT JOIN $table u ON u.`{$colname['id']}` = bo.`{$colname_bo['userId']}`
	              ";
	$sHelp->page_size=get("pagenum");
	$sHelp->page=get("page");
	$sHelp->orderby=get("orderkey",1);
	$sHelp->orderdesc=get("orderdesc",1);

	$sqlstr=$filterhelp->getSQLStr();
	$where = $sqlstr->SQL;

    $where = class_agent::getWhere_lv($colname,$where,"u.");
    /*if($adminuser['type'] > 1){
        $where .= ($where==''?'':' AND ')."u.`{$colname['agent_id']}` = ".$adminuser['id'];
    }*/

     $where .= ($where==''?'':' AND ')."b.`{$colname_b['origId']}` = ".$getid;

	$sHelp->where=$where;

	$rows=$sHelp->getList();
	//print_r($rows);exit;
	for($i=0;$i<count($rows);$i++){
		/* ## coder [modify] --> ## */
		//$rows[$i][$colname_b['status']]='<span class="label label-'.$incary_labelstyle[$rows[$i][$colname_b['status']]].'">'.coderHelp::getAryVal($langary_bettings,$rows[$i][$colname_b['status']]).'</span>';

        $rows[$i][$colname_bo['gameId']] = class_game_rules::getName($rows[$i][$colname_bo['gameId']]);

        $rows[$i][$colname_b['profits']] = ($rows[$i][$colname_b['profits']] < 0)?"<span class='red'>".$rows[$i][$colname_b['profits']]."</span>":$rows[$i][$colname_b['profits']];
		/* ## coder [modify] <-- ## */
	}

	$result['result']=true;
	$result['data']=$rows;
	$result['page']=$sHelp->page_info;
	echo json_encode($result);
}
catch(Exception $e){
	$errorhandle->setException($e); // 收集例外
}

if ($errorhandle->isException()) {
	$result['result']=false;
    $result['data']=$errorhandle->getErrorMessage();
	echo json_encode($result);
}

?>