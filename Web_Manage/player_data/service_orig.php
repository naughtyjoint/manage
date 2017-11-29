<?php
include_once('_config.php');
include_once('filterconfig.php');
$errorhandle=new coderErrorHandle();
try{
    coderAdmin::vaild($auth,'view');
    $getid = (get('id')!="")?get('id'):0;
    if($getid <= 0) {
        throw new Exception("error");
    }

    $db = Database::DB();
    $sHelp=new coderSelectHelp($db);
    $sHelp->select="bo.*,u.`{$colname['id']}` as uid,u.`{$colname['nickname']}`,
                    (SELECT SUM(b.`{$colname_b['profits']}`) FROM $table_b b where b.`{$colname_b['origId']}` = bo.`{$colname_bo['id']}`) as profits,
                    (SELECT count(b.`{$colname_b['id']}`) FROM $table_b b where b.`{$colname_b['origId']}` = bo.`{$colname_bo['id']}`) as bid,
                    (SELECT count(b.`{$colname_b['id']}`) FROM $table_b b where b.`{$colname_b['origId']}` = bo.`{$colname_bo['id']}` and b.`{$colname_b['status']}` = 0) as bstatus
                    ";
    $sHelp->table=$table_bo." bo
	              LEFT JOIN $table u ON u.`{$colname['id']}` = bo.`{$colname_bo['userId']}`";
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

    $where .= ($where==''?'':' AND ')."bo.`{$colname_bo['userId']}` = ".$getid;

    $sHelp->where=$where;

    $rows=$sHelp->getList();
    //print_r($rows);exit;
    for($i=0;$i<count($rows);$i++){
        /* ## coder [modify] --> ## */
        //$rows[$i][$colname_bo['status']]='<span class="label label-'.$incary_labelstyle[$rows[$i][$colname_bo['status']]].'">'.coderHelp::getAryVal($langary_bettings,$rows[$i][$colname['status']]).'</span>';

        $rows[$i][$colname_bo['gameId']] = class_game_rules::getName($rows[$i][$colname_bo['gameId']]);

        $rows[$i]['profits'] = ($rows[$i]['profits'] < 0)?"<span class='red'>".$rows[$i]['profits']."</span>":$rows[$i]['profits'];
        $rows[$i]['ball'] = $rows[$i]['bstatus'].' / '.$rows[$i]['bid'];
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