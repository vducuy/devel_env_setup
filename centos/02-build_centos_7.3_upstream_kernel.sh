#!/bin/bash

#Get source code from CentOS site
git clone git://git.centos.org/centos-git-common.git
git clone git://git.centos.org/sig-altarch/kernel.git sig-altarch-kernel

#Checkout branch
cd sig-altarch-kernel/
git branch -a
#remotes/origin/3.19
#remotes/origin/HEAD -> origin/master
#remotes/origin/cavium
#* remotes/origin/master
#remotes/origin/sig-altarch7-aarch64
#remotes/origin/xen
git checkout -b sig-altarch7-aarch64 remotes/origin/sig-altarch7-aarch64

#Get Source and patches
#cd sig-altarch-kernel/
../centos-git-common/get_sources.sh

#Start to build
rpmbuild --define "%_topdir `pwd`" -bb SPECS/kernel-alt.spec

