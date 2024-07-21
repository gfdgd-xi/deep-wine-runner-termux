#!/data/data/com.termux/files/usr/bin/bash
###########################################
# 使用脚本快速安装 Wine 运行器 For Termux
# By gfdgd xi
###########################################
set -e
if [[ ! -d /data/data/com.termux/files ]]; then
    echo 非 termux,停止运行
    exit 1
fi
if [[ $TMPDIR == "" ]]; then
    export TMPDIR=/data/data/com.termux/files/usr/tmp
fi
echo Wine 运行器 For Termux 安装向导
echo ===================================
echo 更新 termux 环境

pkg upgrade -y
echo ===================================
echo 开始安装

pkg install x11-repo -y

echo ===================================
echo 为了提高下载速度，建议换源
echo 按回车打开源配置工具

read
termux-change-repo

echo ===================================
echo 继续安装
pkg install tigervnc aria2 jq -y
echo ===================================
echo 开始配置 VNCServer
echo 接下来需要设置 VNCServer 的密码

set +e
while [[ 1 ]];
do
    vncpasswd
    if [[ $? == 0 ]]; then
        break
    fi
    echo 设置有误，需重新设置
    sleep 1
done
set -e

echo 设置 VNC 访问权限
echo 1. 只允许本机访问（默认，推荐，较安全）
echo 2. 允许其它机器访问（不推荐，较不安全）
echo 请输入编号：

read result
if [[ $result == "2" ]]; then
    mkdir -p $HOME/.config/deepin-wine-runner/
    touch $HOME/.config/deepin-wine-runner/vnc-public
    vncPublic=1
fi

echo 为了使用体验，需要设置 X11 环境
echo 1. 使用完整的 xfce4 桌面环境（默认）
echo 2. 只使用 xfwm4 窗管（体积较小，没有任务栏等）
echo 请输入编号：

read result
if [[ $result == "2" ]]; then
    pkg install xfwm4 -y
else   
    pkg install xfce4 -y
fi

echo ===================================
jsonData=$(curl http://update.gfdgdxi.top/update.json)
url=$(echo $jsonData | jq -r '.["Url-termux"][0]')
version=$(echo $jsonData | jq -r '.["Version"]')
echo 安装版本：$version
echo $jsonData | jq -r '.["New"]'
echo ===================================
echo 提示：如果下载速度过慢，可以在其它地址下载 deb 包手动安装
echo "    https://sourceforge.net/projects/deep-wine-runner/files/"
echo "    https://github.com/gfdgd-xi/deep-wine-runner/releases"
echo "    http://ctfile.gfdgdxi.top/d/31540479-51790577-d0175d?p=2061 (访问密码: 2061)"
echo ===================================
echo 开始安装

rm -rf $TMPDIR/spark-deepin-wine-runner-installer
mkdir $TMPDIR/spark-deepin-wine-runner-installer -p
cd $TMPDIR/spark-deepin-wine-runner-installer
aria2c -x 16 -s 16 $url
pkg install ./*.deb wine-stable -y

echo 'Wine 运行器安装完成，如果没有设置 $DISPLAY 变量的情况下打开 Wine 运行器'
echo '可以在浏览器输入网址 http://localhost:6080/vnc.html 远程访问'
echo '或者用 VNC 远程工具输入 localhost:5 远程访问'
if [[ $vncPublic == 1 ]]; then
    echo 同时在其它机器浏览器输入 http://本机IP:6080/vnc.html 
    echo 或者在其它机器的 VNC 远程工具输入 本机IP:5 都可以远程访问
fi