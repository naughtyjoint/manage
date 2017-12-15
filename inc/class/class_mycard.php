<?php
class class_mycard{
    public static function getList(){ //
        global $db;
        $colname = coderDBConf::$col_product;
        $sql = "select `{$colname['name']}` as name,`{$colname['product_id']}` as value
                    from ".coderDBConf::$product."
                    ORDER BY `{$colname['product_id']}` DESC";

        return $db->fetch_all_array($sql);
    }
    public static function getName($_val){
        $ary = self::getList();
        return coderHelp::getArrayPropertyVal($ary, 'value', $_val, 'name');
    }
}