<?php
class DateUtil {
    /**
     *获取某个日期所在的那周的周一对应的日期
     *@param $day 指定的日期
     *return 周一对应的日期
     */
    public static function firstDayOfWeek( $day ) { 
        $weekOfDay = date( "w",strtotime( $day ) );
        if( $weekOfDay == 1 ) { 
            $firstDay = date( 'Y-m-d',strtotime("$day Monday" ) );
        }   
        else {
            $firstDay = date( 'Y-m-d',strtotime("-7 day $day Monday" ) );
        }   
        return $firstDay;
    }

    /** 
     * 获取本周的第一天
     * @return bool|string
     */
    static function firstDayOfThisWeek() {
        $firstDay = date('Y-m-d',strtotime('this week'));
        return $firstDay;
    }   

    /** 
     * 获取本周的最后一天
     * @return bool|string
     */
    public static function lastDayOfThisWeek() {
        $lastDay = date('Y-m-d',strtotime('last day next week'));
        echo  $lastDay;
    }

    /**
     * @author ddcoder
     * @desc 获取,$start - $end 的连续日期
     * @param $start 开始日期,如: 2017-06-10
     * @param $end 结束日期,如: 2017-06-21
     * @return array
     */
    public static function rangeDate($start, $end) {
        $ret = [];
        for($day = $start; $day <= $end;) {
            $ret[] = $day;
            $day = date('Y-m-d', strtotime($day) + 3600 * 24);
        }
        return $ret;
    }

}   
