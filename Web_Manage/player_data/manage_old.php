<?php
include_once('_config.php');
include_once('formconfig.php');
$errorhandle = new coderErrorHandle();
$id = get('id', 1);
$manageinfo = "";
/* ## coder [initData] --> ## */

/* ## coder [initData] <-- ## */
try {

    if ($id != "") {
        coderAdmin::vaild($auth, 'edit');

        $db = Database::DB();
        $row = $db->query_prepare_first("select u.*,ud.`{$colname_ud['id']}` as udid, 
                                                ud.`{$colname_ud['commission']}`, ud.`{$colname_ud['amount']}`,
                                                ud.`{$colname_ud['quota']}`,ag.`{$colname_ag['pay_type']}`
                                         from $table u  
                                         LEFT JOIN $table_ud ud ON ud.`{$colname_ud['id']}` = u.`{$colname['id']}`
                                         LEFT JOIN $table_a a ON a.`{$colname_a['id']}` = u.`{$colname['agent_id']}`
	                                     LEFT JOIN $table_ag ag ON a.`{$colname_a['id']}` = ag.`{$colname_ag['admin_id']}`
                                         WHERE u.{$colname['id']}=:id", array(':id' => $id));
        if (empty($row)) {
            throw new Exception("查無相關資料!");
        }
        /* ## coder [bindData] --> ## */
        $manageinfo = '  管理者 : ' . $row[$colname['manager']] . ' | 建立時間 : ' . $row[$colname['create_time']] . ' | 上次修改時間 : ' . $row[$colname['update_time']];
        /* ## coder [bindData] <-- ## */
        /* ## coder [beforeBind] --> ## */
        /* ## coder [beforeBind] <-- ## */


        if($row[$colname_ag['pay_type']] == '2'){
            $fhelp_ud->setAttr($colname_ud['quota'],'validate',array('required'=>'yes','number'=>'yes'));
        }


        $fhelp->bindData($row);

        $fhelp_ud->bindData($row);

        $method = 'edit';
        $active = '編輯';


        include('../odds_agent/filterconfig.php');
        $listHelp=new coderListHelp('table1','初始設定');
        //$listHelp->mutileSelect=true;
        $listHelp->editLink="../odds_agent/manage.php";
        $listHelp->ajaxSrc="../odds_agent/service.php?type=".$row[$colname['id']]."&level=3";
        $listHelp->orderColumn=$colname_od['id'];
        $listHelp->orderDesc="DESC";

        $col = array();
        $col[] = array('column' => $colname_od['id'], 'name' => 'ID', 'order' => true, 'width' => '60');
        $col[] = array('column' => 'gname', 'name' => '玩法', 'order' => false, 'width' => '60');
        $col[] = array('column' => $colname_od['odds_id'], 'name' => '項目', 'order' => false,'width'=>'60');
        $col[] = array('column' => $colname_od['odds'], 'name' => '賠率', 'order' => true,'width'=>'100');
        $col[] = array('column' => $colname_od['odds_max'], 'name' => '最高賠率', 'order' => true,'width'=>'100');
        $col[] = array('column' => $colname_od['bet_min'], 'name' => '每注最低限額', 'order' => true,'width'=>'100');
        $col[] = array('column' => $colname_od['bet_max'], 'name' => '每注最高限額', 'order' => true,'width'=>'100');

        $col[] = array('column' => $colname_od['update_time'], 'name' => '最後修改時間', 'order' => true, 'width' => '120');
        $col[] = array('column' => $colname_od['manager'], 'name' => '最後管理者', 'order' => true, 'width' => '100');
        $listHelp->Bind($col);
        $listHelp->bindFilter($filterhelp);

    } else {
        /* echo "error";
        die(); */
        coderAdmin::vaild($auth, 'add');
        $method = 'add';
        $active = '新增';
    }
} catch (Exception $e) {
    $db->close();
    $errorhandle->setException($e);
}
if ($errorhandle->isException()) {
    $errorhandle->showError();
}
?>
<!DOCTYPE html>
<html>
<head>
    <?php include('../head.php'); ?>
    <link rel="stylesheet" type="text/css" href="../assets/dropzone/downloads/css/dropzone.css"/>
    <link rel="stylesheet" type="text/css" href="../assets/jcrop/jquery.Jcrop.min.css"/>
    <!-- ## coder [phpScript] -> ## -->
    <!-- ## coder [phpScript] <- ## -->

</head>
<body>
<!-- BEGIN Container -->
<div class="container" id="main-container">
    <!-- BEGIN Content -->
    <div id="main-content">
        <!-- BEGIN Page Title -->
        <div class="page-title">
            <div>
                <h1><i class="<?php echo $mainicon ?>"></i> <?php echo $page_title ?>管理</h1>
                <h4><?php echo $page_desc ?></h4>
            </div>
        </div>
        <!-- END Page Title -->
        <?php if ($manageinfo != '') { ?>
            <div class="alert alert-info">
                <button class="close" data-dismiss="alert">&times;</button>
                <strong>系統資訊 : </strong> <?php echo $manageinfo ?>
            </div>
        <?php } ?>
        <!-- BEGIN Main Content -->
        <div class="row">
            <form class="form-horizontal" action="save.php" id="myform" name="myform" method="post">
                <?php echo $fhelp->drawForm($colname['id']); ?>
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-title">
                            <h3><i class="<?php echo getIconClass($method); ?>"></i> <?php echo $page_title . $active ?>
                            </h3>
                            <div class="box-tool">
                                <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                <a data-action="close" href="#"><i class="icon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="row">
                                <!--left start-->
                                <div class="col-md-10">
                                    <!-- ## coder [formScript] -> ## -->
                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['status']); ?> </label>
                                        <div class="col-sm-5 controls">
                                            <?php echo $fhelp->drawForm($colname['status']); ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['agent_id']); ?> </label>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo class_admin::getName($row[$colname['agent_id']]); ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['openid']) ?> </label>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['openid']]; ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['username']) ?> </label>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['username']]; ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['carduser']) ?> </label>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['carduser']]; ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['card']) ?> </label>
                                        <div class="col-sm-2 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['card']] ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['cardname']) ?> </label>
                                        <div class="col-sm-2 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['cardname']] ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['province']) ?> </label>
                                        <div class="col-sm-2 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['province']] ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['city']) ?> </label>
                                        <div class="col-sm-2 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['city']] ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['create_time']) ?> </label>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['create_time']]; ?>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname['logintime']) ?> </label>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo $row[$colname['logintime']]; ?>
                                        </div>
                                    </div>

                                    <!-- [1]現金制[2]信用制 -->
                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname_ag['pay_type']) ?> </label>
                                        <?php echo $fhelp->drawForm($colname_ag['pay_type']) ?>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo $langary_pay_type[$row[$colname_ag['pay_type']]]; ?>
                                        </div>
                                    </div>

                                    <?php if($row[$colname_ag['pay_type']] == '1'){?>
                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp->drawLabel($colname_ud['amount']) ?> </label>
                                        <div class="col-sm-5 control-label" style="text-align: left;">
                                            <?php echo $row[$colname_ud['amount']]; ?>
                                        </div>
                                    </div>
                                    <?php }else if($row[$colname_ag['pay_type']] == '2'){?>
                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp_ud->drawLabel($colname_ud['quota']) ?> </label>
                                        <div class="col-sm-2 controls">
                                            <?php echo $fhelp_ud->drawForm($colname_ud['quota']) ?>
                                        </div>
                                    </div>
                                    <?php }?>

                                    <div class="form-group ">
                                        <label class="col-sm-3 col-lg-3 control-label">
                                            <?php echo $fhelp_ud->drawLabel($colname_ud['commission']) ?> </label>
                                        <div class="col-sm-2 controls">
                                            <?php echo $fhelp_ud->drawForm($colname_ud['commission']) ?>
                                        </div>
                                    </div>



                                    <!-- ## coder [formScript] <- ## -->
                                    <div class="form-group">
                                        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-3">
                                            <button type="submit" class="btn btn-primary"><i
                                                        class="icon-ok"></i>完成<?php echo $active ?></button>
                                            <button type="button" class="btn"
                                                    onClick="if(confirm('確定要取消<?php echo $active ?>?')){parent.closeBox();}">
                                                <i class="icon-remove"></i>取消<?php echo $active ?></button>
                                        </div>
                                    </div>
                                </div>
                                <!--left end-->

                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <?php if($method == 'edit'){?>
                <div class="col-md-<?php echo (isset($row_history)&& $adminuser['type']=='1') ? '10' : '12' ?>">
                    <div class="box">
                        <div class="box-title">
                            <h3><i class="<?php echo getIconClass($method) ?>"></i> 限額功能</h3>
                            <div class="box-tool"><a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                <a data-action="close" href="#"><i class="icon-remove"></i></a></div>
                        </div>
                        <div class="box-content">
                            <?php echo $listHelp->drawTable() ?>
                        </div>
                    </div>
                </div>
            <?php }?>
        </div>

        <!-- END Main Content -->
        <?php include('../footer.php'); $db->close();?>
        <a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i class="icon-chevron-up"></i></a>
    </div>
    <!-- END Content -->
</div>
<!-- END Container -->


<?php include('../js.php'); ?>
<script type="text/javascript" src="../assets/jquery-validation/dist/jquery.validate.js"></script>
<script type="text/javascript" src="../assets/jquery-validation/dist/additional-methods.js"></script>
<script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
<!-- 多圖上傳 -->
<script type="text/javascript" src="../assets/dropzone/downloads/dropzone.min.js"></script>
<!-- 裁圖&傳圖 -->
<script type="text/javascript" src="../assets/jcrop/jquery.Jcrop.min.js"></script>
<script type="text/javascript" src="../js/coderlisthelp.js"></script>
<!-- ## coder [includeScript] -> ## -->
<!-- ## coder [includeScript] <- ## -->
<script type="text/javascript">
    $(document).ready(function () {
        /* ## coder [jsScript] --> ## */
        /* ## coder [jsScript] <-- ## */
        <?php echo coderFormHelp::drawVaildScript();?>
        /* ## coder [jsVaildScript] --> ## */
        /* ## coder [jsVaildScript] <-- ## */

        $('#table1').coderlisthelp({
            debug: true, callback: function (obj, rows) {
                obj.html('');
                var count = rows.length;
                for (var i = 0; i < count; i++) {
                    var row = rows[i];
                    var $tr = $('<tr></tr>');
                    $tr.attr("orderlink", "order_id=" + row["<?php echo $colname_od['id'];?>"] + "&order_key=<?php echo $colname_od['id'];?>");
                    $tr.attr("editlink", "id=" + row["<?php echo $colname_od['id'];?>"]+"&level=3");
                    $tr.attr("delkey", row["<?php echo $colname_od['id'];?>"]);
                    $tr.attr("title", row["gname"]+":"+row["<?php echo $colname_od['odds_id'];?>"]);
                    $tr.append('<td>' + row["<?php echo $colname_od['id'];?>"] + '</td>');
                    $tr.append('<td>' + row["gname"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_od['odds_id'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_od['odds'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_od['odds_max'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_od['bet_min'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_od['bet_max'];?>"] + '</td>');



                    $tr.append('<td>' + row["<?php echo $colname_od['update_time'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_od['manager'];?>"] + '</td>');

                    obj.append($tr);
                }
            }, listComplete: function () {

            }
        });
    })


</script>
</body>
</html>
