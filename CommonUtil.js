/**
 * 获取lowerValue(包括lowerValue)到upperValue(包括upperValue)之间的随机数
 */
function selectFrom( lowerValue,upperValue ) {
    var choices = upperValue - lowerValue + 1;
    return Math.floor( Math.random() * choices + lowerValue );
}
