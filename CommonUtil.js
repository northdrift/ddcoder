/**
 * 获取lowerValue(包括lowerValue)到upperValue(包括upperValue)之间的随机数
 */
function selectFrom( lowerValue,upperValue ) {
    var choices = upperValue - lowerValue + 1;
    return Math.floor( Math.random() * choices + lowerValue );
}

// 获取星座
function xz(m,d) { return "魔羯水瓶双鱼牡羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯".substr(m*2-(d<"102223444433".charAt(m-1)- -19)*2,2);}

/**
 * 获取某个月的最后一天
 */
function getLastDay(year,month) {         
    var new_year = year;    //取当前的年份          
    var new_month = month++;//取下一个月的第一天，方便计算（最后一天不固定）          
    if(month>12) {         
        new_month -=12;        //月份减          
        new_year++;            //年份增          
    }         
    var new_date = new Date(new_year,new_month,1);                //取当年当月中的第一天          
    return (new Date(new_date.getTime()-1000*60*60*24)).getDate();//获取当月最后一天日期          
} 

