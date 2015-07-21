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
?>
