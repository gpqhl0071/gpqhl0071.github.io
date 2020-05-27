解决方案：
进入系统，etc 下多出了 x11 文件夹，新增 xorg.conf 文件，关闭自动休眠
`vim /etc/X11/xorg.conf`
添加文本内容

```
Section “ServerFlags”
Option “BlankTime” “0”
Option “StandbyTime” “0”
Option “SuspendTime” “0”
Option “OffTime” “0”
EndSection

Section “Monitor”
Option “DPMS” “false”
EndSection
```


重启系统，即可