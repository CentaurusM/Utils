
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
1. ksar https://github.com/CentaurusM/python-sarviz
2. sarviz https://github.com/CentaurusM/python-sarviz



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

