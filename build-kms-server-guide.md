
转自: https://www.koorka.com/wiki/How_to_setup_a_Microsoft_KMS_Server_to_Activate_Windows_and_Office

确保下载的软件版本是VL(volumn license) 版本。仅用于学习和实验，不可用于商业目的，否则后果自负。

### 搭建KMS服务器

Download the vlmcsd from <https://github.com/Wind4/vlmcsd.git>

cd /usr/local

git clone \<nowiki\>https://github.com/Wind4/vlmcsd.git\</nowiki\>

编译源代码：

make

启动
MKS服务

/usr/local/vlmcsd/bin/vlmcsd -l /var/log/vlmcsd.log 

echo "/usr/local/vlmcsd/bin/vlmcsd -l /var/log/vlmcsd.log \> /dev/null 2\>&1" \>\> /etc/rc.local

chmod +x /etc/rc.local

### 在Window客户端

1.  Click on '''Windows 7 Start Button'''

<!-- end list -->

1.  Go to '''All Programs-\> Accessories'''

<!-- end list -->

1.  Now right on '''Command Prompt（CMD）''' and select '''“Run as
    Administrator”''' from context

设置激活服务器 slmgr /skms www.koorka.cn 设置Windows Product Key: slmgr /ipk
xxxxx-xxxxx-xxxxx-xxxxx 激活Windows： slmgr /ato

### 其它参考命令

获取Windows 版本： wmic os get caption 从 ServerStandardEvaluation 升级/切换到
ServerStandard 版本\<syntaxhighlight lang="bash"\> Dism /online
/Set-Edition:ServerStandard /AcceptEula
/ProductKey:WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY
\</syntaxhighlight\>查看当前可升级到的目标版本：\<syntaxhighlight
lang="bash"\> Dism /online /Get-TargetEditions \</syntaxhighlight\>

获取激活信息：

slmgr /dlv

获取KMS Client Setup Keys：
<https://technet.microsoft.com/en-us/library/jj612867.aspx>

### Appendix A: KMS Client Setup Keys

#### Windows Server 2016

{| class="wikitable" \!Operating system edition \!KMS Client Setup Key
|- |Windows Server 2016 Datacenter |CB7KF-BWN84-R7R2Y-793K2-8XDDG |-
|Windows Server 2016 Standard |WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY |- |Windows
Server 2016 Essentials |JCKRF-N37P4-C2D82-9YXRT-4M63B |}

#### Windows 10

{| class="wikitable" \!Operating system edition \!KMS Client Setup Key
|- |Windows 10 Professional |W269N-WFGWX-YVC9B-4J6C9-T83GX |- |Windows
10 Professional N |MH37W-N47XK-V7XM9-C7227-GCQG9 |- |Windows 10
Enterprise |NPPR9-FWDCX-D2C8J-H872K-2YT43 |- |Windows 10 Enterprise N
|DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 |- |Windows 10 Education
|NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 |- |Windows 10 Education N
|2WH4N-8QGBV-H22JP-CT43Q-MDWWJ |- |Windows 10 Enterprise 2015 LTSB
|WNMTR-4C88C-JK8YV-HQ7T2-76DF9 |- |Windows 10 Enterprise 2015 LTSB N
|2F77B-TNFGY-69QQF-B8YKP-D69TJ |- |Windows 10 Enterprise 2016 LTSB
|DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ |- |Windows 10 Enterprise 2016 LTSB N
|QFFDN-GRT3P-VKWWX-X7T3R-8B639 |}

#### Windows Server 2012 R2 and Windows 8.1

{| class="wikitable" \!Operating system edition \!KMS Client Setup Key
|- |Windows 8.1 Professional |GCRJD-8NW9H-F2CDX-CCM8D-9D6T9 |- |Windows
8.1 Professional N |HMCNV-VVBFX-7HMBH-CTY9B-B4FXY |- |Windows 8.1
Enterprise |MHF9N-XY6XB-WVXMC-BTDCT-MKKG7 |- |Windows 8.1 Enterprise N
|TT4HM-HN7YT-62K67-RGRQJ-JFFXW |- |Windows Server 2012 R2 Server
Standard |D2N9P-3P6X9-2R39C-7RTCD-MDVJX |- |Windows Server 2012 R2
Datacenter |W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9 |- |Windows Server 2012 R2
Essentials |KNC87-3J2TX-XB4WP-VCPJV-M4FWM |}

#### Windows Server 2012 and Windows 8

{| class="wikitable" \!Operating system edition \!KMS Client Setup Key
|- |Windows 8 Professional |NG4HW-VH26C-733KW-K6F98-J8CK4 |- |Windows 8
Prof
