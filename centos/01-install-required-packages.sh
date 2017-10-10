#!/bin/bash

yum groupinstall "Development Tools"    -y
yum install ncurses-devel -y
yum install hmaccalc zlib-devel binutils-devel elfutils-devel libelf-devel newt-devel python-devel -y
yum install audit-libs-devel numactl-devel pciutils-devel -y
yum install bc bison perl-ExtUtils-Embed.noarch xmlto asciidoc wget net-tools -y
#For FIO building
yum install libaio-devel librdmacm-devel -y
#For iperf3 building
yum install libuuid-devel -y

#For efi building
yum install glibc-static -y
# - Build (using popt.spec) and install popt*.rpm

#For fwupdate
yum install gnu-efi gnu-efi-devel pesign -y

#For freeipmi
yum install libgcrypt-devel texinfo -y

#For ipmitool
yum install openssl-devel readline-devel -y

#For xf86-video-modesetting
#yum -y groups install "GNOME Desktop" 
#yum install xorg-x11-server-devel
# yum install libXrandr-devel
