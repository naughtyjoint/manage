<?php
include_once('_config.php');
include_once('filterconfig.php');
$errorhandle=new coderErrorHandle();
try{
	
	$db = Database::DB();
	$sHelp=new coderSelectHelp($db);

    $getid = (get('id')!="")?get('id'):-1;

    //select
    $sHelp->select="t.`{$colname_cl['record_id']}`, p.`{$colname['name']}`,
    (SELECT COUNT(*) FROM ".$table_cl." a WHERE  a.`{$colname_cl['pgram_id']}`=t.`{$colname_cl['pgram_id']}` and a.`{$colname_cl['record_id']}`=t.`{$colname_cl['record_id']}`) as loglength,
    (SELECT MIN(a.`{$colname_cl['createtime']}`) FROM ".$table_cl." a WHERE a.`{$colname_cl['pgram_id']}`=t.`{$colname_cl['pgram_id']}` and a.`{$colname_cl['record_id']}`=t.`{$colname_cl['record_id']}` ) as start_time,
    (SELECT MAX(a.`{$colname_cl['createtime']}`) FROM ".$table_cl." a WHERE a.`{$colname_cl['pgram_id']}`=t.`{$colname_cl['pgram_id']}` and a.`{$colname_cl['record_id']}`=t.`{$colname_cl['record_id']}` ) as end_time,"
    ."p.`{$colname['id']}`";

    //$sHelp->select="t.`{$colname_cl['id']}`,p.`{$colname['name']}`,t.`{$colname_cl['chatlog']}`,t.`{$colname_cl['createtime']}`";
    //from
    $sHelp->table=$table_cl." t LEFT join ".$table." p on t.`{$colname_cl['pgram_id']}`=p.`{$colname['id']}`";

    //where
    $sqlstr=$filterhelp->getSQLStr();
    $where = $sqlstr->SQL;
    $where .= ($where==''?'':' AND ')."t.`{$colname_cl['pgram_id']}` = ".$getid . " GROUP BY t.`{$colname_cl['record_id']}`";
    $sHelp->where=$where;

    //some order setting
    $sHelp->page_size=get("pagenum");
    $sHelp->page=get("page");
    $sHelp->orderby=get("orderkey",1);
    $sHelp->orderdesc=get("orderdesc",1);

    $rows=$sHelp->getList();



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