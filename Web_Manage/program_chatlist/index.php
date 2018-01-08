<?php
include_once('_config.php');
include_once('filterconfig.php');
$getid = (get('id')!="")?get('id'):0;

/* ## coder [listHelp] --> ## */
$listHelp = new coderListHelp('table1', $page_title);
$listHelp->ajaxSrc = "service.php?id=".$getid;
$listHelp->check_auth = false;

$listHelp->delSrc = "delservice.php";

$col = array();
$col[] = array('column' => $colname_ep['id'], 'name' => '開播編號',                             'order' => true,  'width' => '100');
$col[] = array('column' => $colname['name'],         'name' => $langary_Web_Manage_all['pgram_name'], 'order' => false, 'width' => '100');
$col[] = array('column' => $colname_ep['anchors'],                'name' => '節目主播', 'order' => false, 'width' => '100');
$col[] = array('column' =>$colname_ep['start_time'],'name' => '開始時間',                          'order' => false, 'width' => '100');
$col[] = array('column' => $colname_ep['end_time'], 'name' => '最後時間',                          'order' => false, 'width' => '100');
$col[] = array('column' => 'episode_length',         'name' => '節目時長(時:分:秒)',                          'order' => false, 'width' => '100');
//$col[] = array('column' => 'cl_start_time',             'name' => '開始聊天時間',                          'order' => false, 'width' => '100');
//$col[] = array('column' => 'cl_end_time',               'name' => '最後聊天時間',                          'order' => false, 'width' => '100');
$col[] = array('column' => 'chatlog_count',             'name' => '留言數量 ',                            'order' => false, 'width' => '80');
$col[] = array('column' => $colname['id'],           'name' => $langary_Web_Manage_all['chatlog'],    'order' =>false,  'width' => '80','classname'=>'text-center');
$col[] = array('column' => $colname_ep['updatetime'],  'name' => $langary_Web_Manage_all['update_time'],'order' => false, 'width' => '80');
$col[] = array('column' => $colname_ep['manage'],     'name' => $langary_Web_Manage_all['manager'],    'order' => false, 'width' => '50');

$listHelp->Bind($col);
$listHelp->bindFilter($filterhelp);

/* ## coder [listHelp] <-- ## */

$db = Database::DB();

$db->close();
?>
<!DOCTYPE html>
<html>
<head>
    <?php include('../head.php'); ?>
    <link rel="stylesheet" type="text/css" href="../assets/jquery-ui/jquery-ui.min.css"/>
    <style>
        .ui-sortable-helper {
            background-color: white !important;
            border: none !important;
        }
    </style>
</head>
<body>
<?php //include('../navbar.php'); ?>
<!-- BEGIN Container -->
<div class="container" id="main-container">
    <?php //include('../left.php'); ?>
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

        <!-- BEGIN Breadcrumb -->
        <div id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="../home/index.php">Home</a>
                    <span class="divider"><i class="icon-angle-right"></i></span>
                </li>
                <?php echo $mtitle; ?>

            </ul>
        </div>
        <!-- END Breadcrumb -->

        <!-- BEGIN Main Content -->
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-title">
                        <h3 style="float:left"><i class="icon-table"></i> <?php echo $page_title; ?></h3>
                        <div class="box-tool">
                            <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                            <a data-action="close" href="#"><i class="icon-remove"></i></a>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="box-content">
                        <?php echo $listHelp->drawTable(); ?>
                    </div>
                </div>
            </div>
        </div>


        <?php include('../footer.php'); ?>

        <a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i class="icon-chevron-up"></i></a>
    </div>
    <!-- END Content -->
</div>
<!-- END Container -->
<?php include('../js.php'); ?>

<script type="text/javascript" src="../js/coderlisthelp.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        /* ## coder [listRow] --> ## */
        $('#table1').coderlisthelp({
            debug: true, callback: function (obj, rows) {
                obj.html('');
                var count = rows.length;
                for (var i = 0; i < count; i++) {
                    var row = rows[i];
                    var $tr = $('<tr></tr>');
                    $tr.attr("orderlink", "order_id=" + row["<?php echo $colname_ep['id'];?>"] + "&order_key=<?php echo $colname_ep['id'];?>");
                    $tr.attr("delkey", row["<?php echo  $colname_ep['id'];?>"]);
                    $tr.attr("title",  " " + row["<?php echo $colname['name'];?>"] + " " + row["chatlog_count"] + " 筆聊天紀錄");
                    $tr.append('<td >' + row["<?php echo $colname_ep['id'];?>"] + '</td>');
                    $tr.append('<td >' + row["<?php echo $colname['name'];?>"] + '</td>');
                    $tr.append('<td >' + row["<?php echo $colname_ep['anchors'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_ep['start_time'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_ep['end_time'];?>"] + '</td>');
                    $tr.append('<td>' + row["episode_length"] + '</td>');
                    $tr.append('<td >' + row["chatlog_count"] + '</td>');
                    $tr.append('<td class="text-center"><button class="btn btn-sm btn-warning" onclick="openBox(\'../program_chatlog/index.php?id=' + row["<?php echo $colname['id']?>"] + "&r_id="+ row["<?php echo $colname_ep['id']?>"] + '\',\'95%\',\'95%\',\'fade\',function(){$(\'#table1\').find(\'#refreshBtn\').click()})"><span class="glyphicon  glyphicon-list-alt"></span></button></td>');
                    $tr.append('<td>' + row["<?php echo $colname_ep['updatetime'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_ep['manage'];?>"] + '</td>');
                    obj.append($tr);
                }
            }, listComplete: function () {

            }
        });
        /* ## coder [listRow] <-- ## */
    });
</script>
</body>
</html>
