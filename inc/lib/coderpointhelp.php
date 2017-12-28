<?php
/**
 * Created by PhpStorm.
 * User: user
 * Date: 2017/12/28
 * Time: 下午 03:43
 */

class coderPointHelp
{

    public $table_member = 'member';

    public function __construct()
    {

    }



    public function MoneyToPoint($mem_id,$point){
        $db = Database::DB();
        $query_member = "SELECT point FROM member WHERE member_id=:member_id";
        $member_row = $db->query_first($query_member,[':member_id' => $mem_id]);
        $orig_point = $member_row['point'];

        $totalpoint = $orig_point+$point;

        $db->query_update($this->table_member,['point' => $totalpoint]," member_id='$mem_id'");

    }

}