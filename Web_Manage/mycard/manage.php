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
        $row = $db->query_prepare_first("select * from $table  WHERE {$colname['id']}=:id", array(':id' => $id));
        if (empty($row)) {
            throw new Exception("查無相關資料!");
        }
        /* ## coder [bindData] --> ## */

        //$fhelp->setAttr($colname['status'], 'validate', array('required' => 'yes'));
        $manageinfo = '  管理者 : ' . $row[$colname['manager']] . ' | 申請時間 : ' . $row[$colname['Created_date']] . ' | 付款時間 : ' . $row[$colname['Pay_time']];
        /* ## coder [bindData] <-- ## */
        /* ## coder [beforeBind] --> ## */
        /* ## coder [beforeBind] <-- ## */

        $fhelp->bindData($row);

        $method = 'edit';
        $active = '編輯';

        //$db->close();
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
                <?php echo $fhelp->drawForm($colname['id']) ?>
                <input type="hidden" name="nowstatus" id="nowstatus" value="<?php echo ($method == 'edit')?$row[$colname['PayResult']]:'0'?>">
                <input type="hidden" name="AuthC" id="AuthC" value="<?php echo $row['AuthCode']; ?>">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-title">
                            <h3><i class="<?php echo getIconClass($method) ?>"></i> <?php echo $page_title . $active ?>
                            </h3>
                            <div class="box-tool">
                                <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                                <a data-action="close" href="#"><i class="icon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content">
                            <div class="row">
                                <!--left start-->
                                        <div class="form-group ">
                                            <label class="col-sm-3 col-lg-3 control-label">
                                                <?php echo $fhelp->drawLabel($colname['ReturnCode']) ?> </label>
                                            <div class="col-sm-5 control-label" style="text-align: left;">
                                                <?php echo $langary_mycard[$row[$colname['ReturnCode']]] ?>
                                            </div>
                                        </div>

                                        <div class="form-group ">
                                            <label class="col-sm-3 col-lg-3 control-label">
                                                <?php echo $fhelp->drawLabel($colname['PayResult']) ?> </label>
                                            <div class="col-sm-5 control-label" style="text-align: left;">
                                                <?php echo $langary_mycard_pay[$row[$colname['PayResult']]] ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-sm-3 col-lg-3 control-label">
                                                <?php echo $fhelp->drawLabel($colname['CustomerId']) ?> </label>
                                            <div class="col-sm-3 control-label" style="text-align: left;">
                                                    <?php
                                                        echo $row[$colname['CustomerId']];
                                                    ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-sm-3 col-lg-3 control-label">
                                                <?php echo $fhelp->drawLabel($colname['ProductName']) ?> </label>
                                            <div class="col-sm-3 control-label" style="text-align: left;">
                                                    <?php
                                                        echo class_mycard::getName($row[$colname['ProductName']]);
                                                    ?>
                                                
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-sm-3 col-lg-3 control-label">
                                                <?php echo $fhelp->drawLabel($colname['Amount']) ?> </label>
                                            <div class="col-sm-3 control-label" style="text-align: left;">
                                                <?php
                                                    echo $row[$colname['Amount']];
                                                ?>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-sm-3 col-lg-3 control-label">
                                                <?php echo $fhelp->drawLabel($colname['Currency']) ?> </label>
                                            <div class="col-sm-3 control-label" style="text-align: left;">
                                                <?php
                                                    echo $row[$colname['Currency']];
                                                ?>
                                            </div>
                                        </div>
    

                                    <!-- ## coder [formScript] <- ## -->
                                    <div class="form-group">
                                        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-3">
                                        <?php if($row[$colname['PayResult']] == 0){?>
                                        <button type="button" class="btn btn-danger" onClick="$.confirm({
                                            title: '確認完成請款?',
                                            content: '',
                                            type: 'red',
                                            typeAnimated: true,
                                            buttons: {
                                                tryAgain: {
                                                text: langary_jsall['confirm_ok'],
                                                btnClass: 'btn-red',
                                                    action: function(){
                                                        $('#myform').submit();
                                                    }
                                                },
                                                alphabet: {
                                                    text: langary_jsall['confirm_cancel'],
                                                        action: function(){
                                                    }
                                                }
                                            }
                                        });">
                                    <i class="icon-ok"></i><?php echo $langary_manage['ok'];?>請款</button>
                                    <?php }?>
                                    <button type="button" class="btn btn-primary" onClick="parent.closeBox();">
                                        <i class="icon-remove"></i><?php echo $langary_manage['close'];?><?php echo $active ?>
                                    </button>
                                        </div>
                                    </div>
                                </div>
                                <!--left end-->

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- END Main Content -->
        <?php include('../footer.php');$db->close(); ?>
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
<!-- ## coder [includeScript] -> ## -->
<!-- ## coder [includeScript] <- ## -->
<script type="text/javascript">
    $(document).ready(function () {
        /* ## coder [jsScript] --> ## */
        /* ## coder [jsScript] <-- ## */
        <?php echo coderFormHelp::drawVaildScript();?>
        /* ## coder [jsVaildScript] --> ## */
        /* ## coder [jsVaildScript] <-- ## */
    })


</script>
</body>
</html>
