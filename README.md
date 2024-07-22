<p width=100px align="center"><img src="https://storage.deepin.org/thread/202208031419283599_deepin-wine-runner.png"></p>
<h1 align="center">Wine 运行器 For Termux</h1>
<hr>
<a href='https://gitee.com/gfdgd-xi/deep-wine-runner-termux/stargazers'><img src='https://gitee.com/gfdgd-xi/deep-wine-runner-termux/badge/star.svg?theme=dark' alt='star'></img></a>
<a href='https://gitee.com/gfdgd-xi/deep-wine-runner-termux/members'><img src='https://gitee.com/gfdgd-xi/deep-wine-runner-termux/badge/fork.svg?theme=dark' alt='fork'></img></a>  
<br>
Wine 运行器：<a href='https://gitee.com/gfdgd-xi/deep-wine-runner/stargazers'><img src='https://gitee.com/gfdgd-xi/deep-wine-runner/badge/star.svg?theme=dark' alt='star'></img></a>
<a href='https://gitee.com/gfdgd-xi/deep-wine-runner/members'><img src='https://gitee.com/gfdgd-xi/deep-wine-runner/badge/fork.svg?theme=dark' alt='fork'></img></a>  

## 介绍
Wine 运行器在 Termux 的移植  
注：因为 termux 不是完整的 Linux 环境，所以体验不会很好，可以使用 proot/chroot 来运行相对完整的 Linux 容器以获得更多的体验  
推荐使用下面的命令进行安装，也可以使用 deb 进行安装  

![](https://t.tutu.to/img/8NWtw)  
![](https://t.tutu.to/img/8NZho)  

## 安装
```bash
wget http://termux.gfdgdxi.top/a.sh 
bash a.sh
rm a.sh
# 或者
wget http://termux.gfdgdxi.top/install.sh 
bash install.sh
rm a.sh
```
## 注
如果在没有设置 $DISPLAY 变量的情况下打开 Wine 运行器，将会默认打开 VNC 服务以显示 UI  
可以在浏览器输入网址 http://localhost:6080/vnc.html 远程访问或者用 VNC 远程工具输入 localhost:5 远程访问  
如果在上面的安装脚本选择允许其它机器访问（deb 安装默认不开启）则同时可以在其它机器浏览器输入 http://本机IP:6080/vnc.html 或者在其它机器的 VNC 远程工具输入 本机IP:5 都可以访问  

# ©2020～Now gfdgd xi