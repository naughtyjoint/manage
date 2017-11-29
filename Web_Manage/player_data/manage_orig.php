<?php
include_once('_config.php');
include_once('filterconfig_orig.php');
coderAdmin::vaild($auth, 'view');

$getid = (get('id')!="")?get('id'):0; //userId
if($getid <= 0) {
    die('<script>parent.closeBox();parent.showNotice("alert","'.$page_title.'","'.$langary_Web_Manage_all['die_error'].'")</script>');
}
/* ## coder [listHelp] --> ## */
$listHelp = new coderListHelp('table1', $page_title);
$listHelp->mutileSelect=false;
//$listHelp->editLink = "manage.php";
//$listHelp->addLink = "manage.php";
$listHelp->ajaxSrc = "service_orig.php?id=".$getid;
//$listHelp->delSrc = "delservice.php";
//$listHelp->orderSrc = "orderservice.php";
//$listHelp->ordersortable = "orderservice.php";
$listHelp->orderColumn = $orderColumn;
$listHelp->orderDesc = $orderDesc;

$col = array();
$col[] = array('column' => $colname_bo['id'], 'name' => 'ID', 'order' => true, 'width' => '60');
//$col[] = array('column' => $colname['status'], 'name' => '開獎', 'order' => true, 'width' => '60');
//$col[] = array('column' => 'uid', 'name' => '玩家ID', 'order' => true, 'width' => '80');
$col[] = array('column' => $colname['nickname'], 'name' => '暱稱', 'order' => false, 'width' => '100');
$col[] = array('column' => $colname_bo['gameId'], 'name' => '玩法', 'order' => false, 'width' => '100');
//$col[] = array('column' => $colname_b['period_number'], 'name' => '期數', 'order' => true, 'width' => '100');
//$col[] = array('column' => $colname_bo['content'], 'name' => '投注內容', 'order' => true,'width'=>'120');
$col[] = array('column' => 'profits', 'name' => '總盈虧', 'order' => true/*,'width'=>'300'*/);



$col[] = array('column' => 'ball', 'name' => '注單量(有效注單/總注單)', 'order' => true, 'width' => '200');
$col[] = array('column' => $colname_bo['create_time'], 'name' => '投注時間', 'order' => true, 'width' => '120');
$col[]=array('column'=>$colname_bo['id'],'name'=>'撤單','order'=>false,'width'=>'100','classname'=>'text-center');
//$col[] = array('column' => $colname_bo['manager'], 'name' => '最後管理者', 'order' => true, 'width' => '100');
$col[]=array('column'=>$colname_bo['id'],'name'=>'注單明細','order'=>false,'width'=>'80','classname'=>'text-center');
$listHelp->Bind($col);
$listHelp->bindFilter($filterhelp);

/* ## coder [listHelp] <-- ## */

$db = Database::DB();
coderAdminLog::insert($adminuser['username'], $main_auth_key, $fun_auth_key, 'view', '列表');
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
                <?php echo $mtitle ?>

            </ul>
        </div>
        <!-- END Breadcrumb -->

        <!-- BEGIN Main Content -->
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-title">
                        <h3 style="float:left"><i class="icon-table"></i> 下注紀錄</h3>
                        <div class="box-tool">
                            <a data-action="collapse" href="#"><i class="icon-chevron-up"></i></a>
                            <a data-action="close" href="#"><i class="icon-remove"></i></a>
                        </div>
                        <div style="clear:both"></div>
                    </div>
                    <div class="box-content">
                        <?php echo $listHelp->drawTable() ?>
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
                    $tr.attr("orderlink", "order_id=" + row["<?php echo $colname_bo['id'];?>"] + "&order_key=<?php echo $colname_bo['id'];?>");
                    $tr.attr("editlink", "id=" + row["<?php echo $colname_bo['id'];?>"]);
                    $tr.attr("delkey", row["<?php echo $colname_bo['id'];?>"]);
                    $tr.attr("title", row["<?php echo $colname_bo['id'];?>"]);
                    $tr.append('<td>' + row["<?php echo $colname_bo['id'];?>"] + '</td>');
                    //$tr.append('<td>' + row["<?php //echo $colname_b['status'];?>"] + '</td>');
                    //$tr.append('<td>' + row["uid"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname['nickname'];?>"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_bo['gameId'];?>"] + '</td>');
                    //$tr.append('<td>' + row["<?php //echo $colname_b['period_number'];?>"] + '</td>');
                    //$tr.append('<td>' + row["<?php //echo $colname['content'];?>"] + '</td>');
                    $tr.append('<td>' + row["profits"] + '</td>');



                    $tr.append('<td>' + row["ball"] + '</td>');
                    $tr.append('<td>' + row["<?php echo $colname_bo['create_time'];?>"] + '</td>');
                    //$tr.append('<td>' + row["<?php //echo $colname_b['manager'];?>"] + '</td>');
                    if(row["bstatus"]>0) {
                        $tr.append('<td class="text-center"><button class="btn btn-sm btn-inverse my_btn" thisid="'+row["<?php echo $colname_bo['id'];?>"]+'" data-title="撤銷注單?"><span class="glyphicon glyphicon-remove"></span></button></td>');
                    }
                    else{
                        $tr.append('<td class="text-center"><span class="red">已全部撤單</span></td>');
                    }
                    $tr.append('<td class="text-center"><button class="btn btn-sm btn-warning" onclick="openBox(\'manage_log.php?id=' + row["<?php echo $colname['id']?>"] + '\',\'95%\',\'95%\',\'fade\',function(){$(\'#table1\').find(\'#refreshBtn\').click()})"><span class="glyphicon  glyphicon-list-alt"></span></button></td>');
                    obj.append($tr);
                }
            }, listComplete: function () {

            }
        });
        /* ## coder [listRow] <-- ## */
        $("table").on("click","button.my_btn",function(){
            var id = $(this).attr("thisid");
            $.confirm({
                title: '撤銷注單',
                content: '確定要撤銷注單?',
                type: 'red',
                typeAnimated: true,
                buttons: {
                    tryAgain: {
                        text: langary_jsall['confirm_ok'],
                        btnClass: 'btn-red',
                        action: function(){
                            $.confirm({
                                title: '撤銷注單',
                                content: '確定要撤銷注單?',
                                type: 'red',
                                typeAnimated: true,
                                buttons: {
                                    tryAgain: {
                                        text: langary_jsall['confirm_ok'],
                                        btnClass: 'btn-red',
                                        action: function(){
                                            $.ajax({
                                                url : "../do/bettingsdel.php",
                                                async : false,
                                                type : "POST",
                                                data: {
                                                    id:id,
                                                    type:'1'
                                                },
                                                dataType : "json",
                                                success : function(data){
                                                    if(data.result == true){
                                                        showNotice("ok","撤單成功","ID："+data.id);
                                                    }else{
                                                        showNotice('alert','撤單失敗',data.msg);
                                                    }
                                                    $('#table1').find('#refreshBtn').click();
                                                },
                                                error : function(xhr, ajaxOptions){
                                                    alert("讀取資料時發生錯誤,請梢候再試!");
                                                }
                                            });


                                        }
                                    },
                                    alphabet: {
                                        text: langary_jsall['confirm_cancel'],
                                        action: function(){
                                        }
                                    }
                                }
                            });


                        }
                    },
                    alphabet: {
                        text: langary_jsall['confirm_cancel'],
                        action: function(){
                        }
                    }
                }
            });
        });

    });
</script>
</body>
</html>
