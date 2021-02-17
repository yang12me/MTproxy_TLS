## MTproxy TLS 一键安装脚本

基于 https://github.com/sunpma/mtp 修改
基本使用方法请参考上游

## 内容变更
* 非绿色版，但提供卸载功能，会清空相关残留文件
* 默认端口由 443 变更为 990 防止和 xray 默认端口冲突
* 去除管理端口的手动设置(一律使用默认值8888)  
* 添加 systemd 进程守护，mtproxy 通过 systemd 控制 启停 与 开机自启
* 删除了通过脚本控制启停的部分
* 脚本仅支持使用systemd管理的系统 (建议 Centos7+ / Ubuntu18.04+ / Debian9+ )