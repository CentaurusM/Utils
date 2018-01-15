
## Auto mount a device
```
echo /dev/nvme0n1p1 /mnt ext4 defaults 0 0 >> /etc/fstab
```

## Performance Monitor (SAR)

* Install and Use SAR
```
apt-get insall sysstat

sar 1 3

```

* Visulize SAR log
1. ksar
2. sarviz




## Show history with data & Time
```
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bash_profile
source ~/.bash_profile

# Other parameters
export HISTFILESIZE=500000000
export HISTSIZE=1000000
```


## Axel Download Accelerator

```
# Debian or Ubuntu
apt-get install axel

# CentOS
yum install epel-release
yum install axel  

# Downloading with Axel
axel -n 10  http://hammurabi.acc.umu.se/debian-cd/6.0.6/amd64/iso-cd/debian-6.0.6-amd64-netinst.iso

```


## DNS setting in CentOS 7

使用命令行修改
```
#显示当前网络连接
#nmcli connection show
NAME UUID                                 TYPE           DEVICE
eno1 5fb06bd0-0bb0-7ffb-45f1-d6edd65f3e03 802-3-ethernet eno1

#修改当前网络连接对应的DNS服务器，这里的网络连接可以用名称或者UUID来标识
#nmcli con mod eno1 ipv4.dns "114.114.114.114 8.8.8.8"

#将dns配置生效
#nmcli con up eno1
```

或者使用传统方法，手工修改 /etc/resolv.conf

```
修改 /etc/NetworkManager/NetworkManager.conf 文件，在main部分添加 “dns=none” 选项：
[main]
plugins=ifcfg-rh
dns=none
NetworkManager重新装载上面修改的配置
# systemctl restart NetworkManager.service
手工修改 /etc/resolv.conf
nameserver 114.114.114.114
nameserver 8.8.8.8
详细参见：

# man NetworkManager.conf
# man nmcli
```

