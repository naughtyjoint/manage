<?php
/**
 * Created by PhpStorm.
 * User: user
 * Date: 2017/12/28
 * Time: 下午 03:43
 */

class coderPointHelp
{

    private $table_member = 'member';
    private $table_anchor = 'anchor';
    private $table_contribution = 'contribution';



    public function __construct()
    {
        $this->table_member;
        $this->table_anchor;
        $this->table_contribution;
    }

    //取得單一會員點數總數
    private function getPoint($mem_id){
        $db = Database::DB();
        $query_member = "SELECT point FROM member WHERE member_id=:member_id";
        $row = $db->query_first($query_member,[':member_id' => $mem_id]);
        $db->close();
        return $row['point'];
    }

    //取得單一主播點數總數
    private function getPoint_anc($id){
        $db = Database::DB();
        $query= "SELECT point FROM anchor WHERE id=:id";
        $row = $db->query_first($query,[':id' => $id]);
        $db->close();
        return $row['point'];
    }

    //錢轉點
    public function MoneyToPoint($mem_id,$point){

        $orig_point = $this->getPoint($mem_id);
        $totalpoint = $orig_point+$point;
        $db = Database::DB();
        $db->query_update($this->table_member,['point' => $totalpoint]," member_id='$mem_id'");
        $db->close();
    }


    //打賞轉點
    public function PointToPoint($mem_id,$anc_id,$point,$content){
        $member_point = $this->getPoint($mem_id);
        $anchor_point = $this->getPoint_anc($anc_id);
        $member_point -= $point;
        $anchor_point += $point;
        $db = Database::DB();
        $db->query_update($this->table_member,['point' => $member_point]," member_id='$mem_id'");
        $db->query_update($this->table_anchor,['point' => $anchor_point]," id='$anc_id'");
        $contribution = array(
            'anchor_id' => $anc_id,
            'member_id' => $mem_id,
            'point' => $point,
            'contents' => $content
        );
        $db->query_insert($this->table_contribution,$contribution);
        $db->close();

        $result['success']=true;
        $result['result']=$contribution;
        $result['message']='Accessed successfully';
        echo json_encode($result);


    }

}