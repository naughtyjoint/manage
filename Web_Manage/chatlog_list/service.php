<?php
include_once('_config.php');
include_once('filterconfig.php');
$errorhandle=new coderErrorHandle();
try{
	
	$db = Database::DB();
	$sHelp=new coderSelectHelp($db);

    $getid = (get('id')!="")?get('id'):-1;

    //select
    $sHelp->select="123t.`{$colname_cl['record_id']}`, p.`{$colname['name']}`,
    (SELECT COUNT(*) FROM ".$table_cl." a WHERE  a.`{$colname_cl['pgram_id']}`=t.`{$colname_cl['pgram_id']}` and a.`{$colname_cl['record_id']}`=t.`{$colname_cl['record_id']}`) as chat_count";


    //$sHelp->select="t.`{$colname_cl['id']}`,p.`{$colname['name']}`,t.`{$colname_cl['chatlog']}`,t.`{$colname_cl['createtime']}`";
    //from
    $sHelp->table=$table_cl." t LEFT join ".$table." p on t.`{$colname_cl['pgram_id']}`=p.`{$colname['id']}`";

    //where
    $sqlstr=$filterhelp->getSQLStr();
    $where = $sqlstr->SQL;
    $where .= ($where==''?'':' AND ')."t.`{$colname_cl['pgram_id']}` = ".$getid . " GROUP BY t.`{$colname_cl['record_id']}`";
    $sHelp->where=$where;

    $rows=$sHelp->getList();

    for($i=0;$i<count($rows);$i++)
    {
        /*if($rows[$i][$colname['name']] != "")
        {
            $rows[$i]["loglength"] = count($colname_cl['pgram_id']);
            $rows[$i]["start_time"] = count($colname_cl['pgram_id']);
            $rows[$i]["end_time"] = count($colname_cl['pgram_id']);
        }*/
        $rows[$i]["loglength"] = count($rows[$i][$colname_cl["chatlog"]]);
        //$rows[$i]["start_time"] = '456');
        //$rows[$i]["end_time"] = '789');
    }

    $sHelp->page_size=get("pagenum");
	$sHelp->page=get("page");
	$sHelp->orderby=get("orderkey",1);
	$sHelp->orderdesc=get("orderdesc",1);

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