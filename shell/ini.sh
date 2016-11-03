#!/bin/bash
#提示输入和确认输入
function inputConfirm(){
     while true
     do
          echo "请输入$2"
          read input 
          #生成动态变量
          eval $1="$input"
          echo "确认使用$2$input?"
          echo "Y:使用"
          echo "N:重新输入"
          read confirm
          if [ "$confirm" = "N" -o "$confirm" = "n" ];then
              continue;
          else
              break;
          fi; 
     done
}
inputConfirm project_name "项目名称"
user='ddcoder'
echo "请选择用户用户："
echo "0 : ddcoder"
echo "1 : jami918"
echo "2 : cui"
echo "3 : pngzy"
echo "4 : tangshiliang"
read user_choose
if [ $user_choose -eq 1 ];
then
    user="jami918"
elif [ $user_choose -eq 2 ];
then
    user="cui"
elif [ $user_choose -eq 3 ];
then
    user="pngzy"
elif [ $user_choose -eq 4 ];
then
    user="tangshiliang"

fi;
`git clone git@localhost:$user/$project_name.git`
`cd $project_name && git remote add ${project_name}123 along@123.57.51.123:/data/vip/$project_name && git deploy setup -r ${project_name}123 && git deploy init`
