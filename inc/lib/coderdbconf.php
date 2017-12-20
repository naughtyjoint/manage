<?php

class coderDBConf
{
    /*↓↓必須↓↓*/
    public static $admin = 'admin';//後台管理者
    public static $admin_log = 'admin_log';//後台管理者操作紀錄
    public static $rules = 'rules';         //角色
    public static $rules_auth = 'rules_auth';    //角色權限

    public static $col_admin = array('id' => 'a_id','games_id'=>'a_games_id','all_upid'=>'a_all_upid','add_adminid'=>'a_add_adminid','first_upid'=>'a_first_upid','level' => 'a_level','service'=>'a_service', 'mid' => 'a_mid', 'username' => 'a_username', 'password' => 'a_password', 'name' => 'a_name', 'email' => 'a_email', 'pic' => 'a_pic', 'r_id' => 'r_id', 'forgetcode' => 'a_forgetcode', 'forgetcode_time' => 'a_forgetcode_time', 'ip' => 'a_ip', 'logintime' => 'a_logintime', 'ispublic' => 'a_ispublic', 'admin' => 'a_admin', 'updatetime' => 'a_updatetime', 'createtime' => 'a_createtime');
    public static $col_admin_log = array('id' => 'al_id', 'username' => 'a_username', 'main_key' => 'al_main_key', 'fun_key' => 'al_fun_key', 'descript' => 'al_descript', 'action' => 'al_action', 'ip' => 'al_ip', 'createtime' => 'al_createtime');
    public static $col_rules = array('id' => 'r_id', 'name' => 'r_name', 'depiction' => 'r_depiction','agents'=>'r_agents','service'=>'r_service', 'superadmin' => 'r_superadmin', 'system' => 'r_system', 'admin' => 'r_admin', 'updatetime' => 'r_updatetime', 'createtime' => 'r_createtime');
    public static $col_rules_auth = array('ra_id' => 'ra_id' ,'r_id' => 'r_id', 'main_key' => 'ra_main_key', 'fun_key' => 'ra_fun_key', 'auth' => 'ra_auth', 'admin' => 'ra_admin', 'updatetime' => 'ra_updatetime', 'createtime' => 'ra_createtime');
    /*↑↑必須↑↑*/
    public static $bank= 'bank'; //銀行
    public static $col_bank = array('id'=>'id','name'=>'name','bank_no'=>'bank_no','manager'=>'last_manager','create_time'=>'created_time');
    public static $bank_card = 'bank_card'; //銀行卡
    public static $col_bank_card = array('id'=>'id','name'=>'bank_name','bank_id'=>'bank_id','bank_card_no'=>'bank_card_no','manager'=>'last_manager','create_time'=>'created_time','update_time'=>'updated_time');
    public static $dispensing = 'dispensing'; //出款
    public static $col_dispensing = array('id'=>'id','user_id'=>'user_id','game_id'=>'game_id','bank_card_id'=>'bank_card_id','bank_id'=>'bank_id','num'=>'num','money'=>'money','contents'=>'contents','manager'=>'last_manager','create_time'=>'created_time','update_time'=>'updated_time','check_time'=>'check_time','is_pay'=>'is_pay');
    public static $dispensing_log = 'dispensing_log'; //出款歷程
    public static $col_dispensing_log = array('id'=>'id','dispensing_id'=>'dispensing_id','user_id'=>'user_id','game_id'=>'game_id','manager'=>'last_manager','update_time'=>'updated_time','contents'=>'contents','is_pay'=>'is_pay');
    // public static $deposit_pay = 'deposit_pay'; //第三方支付
    // public static $col_deposit_pay = array('id'=>'id','name'=>'pay_name','manager'=>'last_manager','create_time'=>'created_time');
    public static $platform = 'platform'; //平台名稱
    public static $col_platform = array('id'=>'id','name'=>'platform_name','manager'=>'last_manager','create_time'=>'created_time','update_time'=>'updated_time');
    public static $anchor = 'anchor'; //主播
    public static $col_anchor = array('id'=>'id','name'=>'name','email'=>'email','point'=>'point','create_time'=>'created_time','update_time'=>'update_time','manager'=>'last_manager');
    public static $member = 'member'; //會員
    public static $col_member = array('id'=>'id','member_id'=>'member_id','name'=>'member_name','platform_id'=>'platform_id','email'=>'email','point'=>'point','create_time'=>'created_time','update_time'=>'updated_time','manager'=>'last_manager');
    public static $deposit = 'deposit'; //入款申請
    public static $col_deposit = array('id'=>'id','user_id'=>'user_id','game_id'=>'game_id','money'=>'money','deposit_pay_id'=>'deposit_pay_id','pay_code'=>'pay_code','pay_id'=>'pay_id','status'=>'status','contents'=>'contents','create_time'=>'created_time','update_time'=>'updated_time','manager'=>'last_manager','check_time'=>'check_time');
    public static $deposit_check = 'deposit'; //入款審核
    public static $col_deposit_check = array('id'=>'id','user_id'=>'user_id','money'=>'money','company'=>'company','method'=>'method','status'=>'status','remark'=>'remark','create_time'=>'created_at','update_time'=>'updated_at','manager'=>'transfers_manager','statustime'=>'transfers_statustime');
    public static $deposit_log = 'deposit_log'; //入款歷程
    public static $col_deposit_log = array('id'=>'id','user_id'=>'user_id','deposit_id'=>'deposit_id','game_id'=>'game_id','status'=>'status','contents'=>'contents','updated_time'=>'updated_time','manager'=>'last_manager');
    public static $product = 'product'; //產品
    public static $col_product = array('id'=>'id','product_id'=>'product_id','name'=>'name','amount'=>'amount','point'=>'point','ratio'=>'ratio','bonus'=>'bonus','status'=>'status','create_time'=>'created_time','update_time'=>'updated_time','manager'=>'last_manager');
    public static $mycard = 'mycard'; //mycard入款審核
    public static $col_mycard = array('id'=>'id','user_id'=>'user_id','FacTradeSeq'=>'FacTradeSeq','member_id'=>'member_id','product_id'=>'product_id','Amount'=>'Amount','Currency'=>'Currency','Created_date'=>'Created_date','PayResult'=>'PayResult','ReturnCode'=>'ReturnCode','Pay_time'=>'Pay_time','Check_time'=>'Check_time','manager'=>'last_manager');
    public static $mycard_log = 'mycard_log'; //mycard入款歷程
    public static $col_mycard_log = array('id'=>'id','deposit_id'=>'deposit_id','user_id'=>'user_id','FacTradeSeq'=>'FacTradeSeq','PayResult'=>'PayResult','updated_time'=>'updated_time','manager'=>'last_manager');

}