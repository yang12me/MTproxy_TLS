## MTproxy TLS 一键安装脚本

基于 https://github.com/sunpma/mtp 修改
基本使用方法请参考上游


## 安装 MTproxy

sudo -i

mkdir /home/mtproxy && cd /home/mtproxy

wget -N --no-check-certificate "https://github.com/wulabing/mtp/raw/master/mtproxy.sh" && chmod +x mtproxy.sh && bash mtproxy.sh

## 提取自：

wulabing/Xray_onekey: Xray 基于 Nginx 的 VLESS + XTLS 一键安装脚本

https://github.com/wulabing/Xray_onekey


## 内容变更
* 非绿色版，但提供卸载功能，会清空相关残留文件
* 默认端口由 443 变更为 990 防止和 xray 默认端口冲突
* 去除管理端口的手动设置(一律使用默认值8888)  
* 添加 systemd 进程守护，mtproxy 通过 systemd 控制 启停 与 开机自启
* 删除了通过脚本控制启停的部分
* 脚本仅支持使用systemd管理的系统 (建议 Centos7+ / Ubuntu18.04+ / Debian9+ )


## 配置文件: 
/usr/local/src/mtproxy/mtp_config


## 使用方式:
	 运行	           systemctl start mtproxy
	 停止	      	   systemctl stop mtproxy
	 重启 	  	   systemctl restart mtproxy
	 开机自启动 	   systemctl enable mtproxy
	 卸载              bash mtproxy.sh uninstall
