#!/bin/bash
base_dir='/data/vip'
deploy_dir='/data/vip/deploy'
vhost_dir='/var/vhost/sdongpo'
#获取项目目录
function getProjecDir(){
    read project_name
    project_dir="$base_dir/$project_name"
}
#改变目录权限为777,如果目录不存在则创建目录
function changeDir777(){
    for dir in $@;
    do
        if [ ! -d $dir ];
        then
            `mkdir -p $dir`
        fi;
        `chmod -R 777 $dir`
    done;
}
#创建目录
function makeDir(){
    for dir in $@;
    do
        if [ ! -d $dir ];
        then
            `mkdir -p $dir`
        fi;
    done;

}
#复制
function copy(){
    if [ -f $1 ];then
	`cp $1 $2`
    elif [ -d $1 ];then
	`cp -r $1 $2`
    fi;
}
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

echo '输入项目名称'
getProjecDir
while [ ! -d $project_dir ];
do
    echo '项目不存在，重新输入项目名称'
    getProjecDir
done;
runtime_dir="$project_dir/protected/runtime"
assets_dir1="$project_dir/www/assets"
assets_dir2="$project_dir/kucun/backend/assets"
assets_dir3="$project_dir/kucun/backend/web/assets"
upload_dir="$project_dir/www/upload_pic"
word_dir="$project_dir/www/word"
download_dir="$project_dir/www/download"

config_file1="$deploy_dir/main.php"
config_file2="$deploy_dir/kucun-common/main-local.php"
config_file3="$deploy_dir/kucun-common/params-local.php"
config_file4="$deploy_dir/kucun-backend/main-local.php"
config_file5="$deploy_dir/kucun-backend/params-local.php"
vendor_path="$deploy_dir/vendor"
index_file1="$deploy_dir/index.php"
index_file2="$deploy_dir/index_kucun.php"

kucun_dir="$project_dir/kucun/"
config_dir1="$project_dir/protected/config/"
config_dir2="$project_dir/kucun/common/config/"
config_dir3="$project_dir/kucun/backend/config/"
www_dir="$project_dir/www/"
web_dir="$project_dir/kucun/backend/web/"

config_file1_new="${config_dir1}main.php"
config_file2_new="${config_dir2}main-local.php"
config_file5_new="${config_dir3}params-local.php"

changeDir777 $runtime_dir $assets_dir1 $assets_dir2 $assets_dir3 $upload_dir $word_dir $download_dir
makeDir $config_dir1 $config_dir2 $config_dir3

copy $config_file1 $config_dir1;
copy $config_file2 $config_dir2;
copy $config_file3 $config_dir2;
copy $config_file4 $config_dir3;
copy $config_file5 $config_dir3;
copy $vendor_path $kucun_dir;
copy $index_file1 $www_dir;
copy $index_file2 "$web_dir/index.php";

#修改数据库名字
inputConfirm "database_name" "数据库名字"
`sed -i "s/database_name/$database_name/" $config_file1_new`
`sed -i "s/database_name/$database_name/" $config_file2_new`

#修改后台密码
inputConfirm "super_password" "后台密码"
`sed -i "s/super_password/$super_password/" $config_file1_new`

#修改财务密码
inputConfirm "caiwu_password" "财务密码"
`sed -i "s/caiwu_password/$caiwu_password/" $config_file1_new`

#修改库存密码
inputConfirm "kucun_password" "库存密码"
`sed -i "s/kucun_password/$kucun_password/" $config_file5_new`

#设置后台二级域名
inputConfirm "second_domain_admin" "后台二级域名"
`sudo ln -s "$project_dir/www" "$vhost_dir/$second_domain_admin"`

#设置库存二级域名
inputConfirm "second_domain_kucun" "后台二级域名"
`sudo ln -s "$project_dir/kucun/backend/web" "$vhost_dir/$second_domain_kucun"`
