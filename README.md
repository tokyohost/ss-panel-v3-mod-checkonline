# ss-panel-v3-mod-checkonline
适用于 ss-panel-v3-mod 面板对应的SSR后端运行监控脚本（检测服务端是否正在运行，在检测到停止运行时主动启动服务端）【自用】

仅用于Çentos 系统（已在Centos 7.1 中实验成功）

使用方法：

确保shadowsocks 程序安装在 /root/shadowsocks/ 目录中

第一步：
  cd /root
  
  wget https://github.com/tokyohost/ss-panel-v3-mod-checkonline/archive/master.zip

  下载文件
  
第二步：
  unzip master.zip

  解压文件
  
第三步：
  cd ss-panel-v3-mod-checkonline-master

  进入目录
  
第四步：
        chmod +x runcheck.sh

        chmod +x check.sh
        
        
  添加权限
  
第五步：
  ./runcheck.sh &

  运行程序
  
第六步：
  vi /etc/rc.d/rc.local

按下键盘<i>键，并在文件末尾添加：sh /root/ss-panel-v3-mod-checkonline-master/runcheck.sh & 
  
然后：按下<Esc>键，输入<:wq>(尖括号内内容)

最后：chmod +x /etc/rc.d/rc.local
  
  添加开机自启
  
  大功告成
  
最后必要时断开服务器时选择exit命令。

/root/ss-panel-v3-mod-checkonline-master/check.txt 为脚本日志。


