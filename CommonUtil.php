<?php 
//---class---//
/**
 * 我的调试类
 */
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
}


//---function---//
/**
 * 下载文件
 * @param type $filename 文件名
 */
function downLoadFile($file)
{
    if (file_exists($file)) {
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename='.basename($file));
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file));
        ob_clean();
        flush();
        readfile($file);
        exit;
    }
}

/**
 * 
 * 产生随机字符串，不长于32位
 * @param int $length
 * @return 产生的随机字符串
 */
function getRandomStr($length = 32) 
{
    $chars = "abcdefghijklmnopqrstuvwxyz0123456789";  
    $str ="";
    for ( $i = 0; $i < $length; $i++ )  {  
        $str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);  
    } 
    return $str;
}
?>
