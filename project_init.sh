#!/bin/bash
cur_dir=`pwd`
echo '输入项目名称'
read project_name
while [ -d $project_name ];
do
    echo '项目已经存在,请重新输入'
    read project_name
done;
`mkdir $project_name`
while [ $? -ne 0 ];
do 
    `mkdir $project_name`
done;
project_dir="$cur_dir/$project_name"
echo `git init $project_dir`
`chown -R along:along $project_dir`
#while [ $? -ne 0 ];
#do 
#    `git init $project_dir`
#done;
#`chown -R along:along $project_dir`
#while [ $? -ne 0 ];
#do 
#    `chown -R along:along $project_dir`
#done;

