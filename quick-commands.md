
## Auto Mount a Device
```
echo /dev/nvme0n1p1 /mnt ext4 defaults 0 0 >> /etc/fstab
```

## Performance Monitor (SAR)

* Install and Use SAR
```
apt-get insall sysstat

sar 1 3

# sar log dir
cd /var/log/sa/

# Adjust period of collecting logs
vim /etc/cron.d/sysstat

*/10 * * * * root /usr/lib64/sa/sa1 1 1
# 0 * * * * root /usr/lib64/sa/sa1 600 6 &
# Generate a daily summary of process accounting at 23:53
53 23 * * * root /usr/lib64/sa/sa2 -A
```

* Visualize SAR log
1. ksar https://github.com/CentaurusM/python-sarviz
2. sarviz https://github.com/CentaurusM/python-sarviz


## CPU Turbo 
```
yum install ncurses-devel ncurses
git clone https://github.com/ajaiantilal/i7z.git

cd i7z
make
./i7z

```

## Configure SSH with X11 Forwarding 
```
# /etc/ssh/sshd_config
X11Forwarding yes
yum install  xorg-x11-xauth
```

## Show "history" with Data & Time
```
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bash_profile
source ~/.bash_profile

# Other parameters
export HISTFILESIZE=50000000
export HISTSIZE=100000
export PROMPT_COMMAND="history -a"        #实时记录历史命令，防止丢失 
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


## DNS Setting in CentOS 7

1. Using nmcli tools
```
nmcli connection show

NAME UUID                                 TYPE           DEVICE
eno1 5fb06bd0-0bb0-7ffb-45f1-d6edd65f3e03 802-3-ethernet eno1

nmcli con mod eno1 ipv4.dns "114.114.114.114 8.8.8.8"

nmcli con up eno1
```

2. Editing the file "/etc/resolv.conf"

```
vim /etc/NetworkManager/NetworkManager.conf
# add "dns=none"
[main]
plugins=ifcfg-rh
dns=none

systemctl restart NetworkManager.service

vim /etc/resolv.conf
# add nameserver

nameserver 114.114.114.114
nameserver 8.8.8.8

```

## Route Trace - BestTrace
```
wget https://cdn.ipip.net/17mon/besttrace4linux.zip
unzip besttrace4linux.zip
chmod +x besttrace
./besttrace -q 1 IP
```
## PCI passthrough in centos
http://www.hanbaoying.com/2017/02/21/pci-passthrough-in-centos.html
