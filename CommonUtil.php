<?php 
//在master分支上的修改
class OutUtil {
    public static function ec( $data,$isExit=true ) {
        echo $data;
        if( $isExit === true ) {
            exit;
        }
    }
    public static function pr( $data,$isExit=true ) {
        echo '<pre>';
        print_r($data);
        if( $isExit === true ) {
            exit;
        }
    }
    public static function vd( $data,$isExit=true ) {
        echo '<pre>';
        var_dump($data);
        if( $isExit === true ) {
            exit;
        }
    }
?>
