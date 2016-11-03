/**
 * 获取lowerValue(包括lowerValue)到upperValue(包括upperValue)之间的随机数
 */
function selectFrom( lowerValue,upperValue ) {
    var choices = upperValue - lowerValue + 1;
    return Math.floor( Math.random() * choices + lowerValue );
}

// 获取星座
function xz(m,d) { return "魔羯水瓶双鱼牡羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯".substr(m*2-(d<"102223444433".charAt(m-1)- -19)*2,2);}
