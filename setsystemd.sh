#!/bin/bash
echo "container=$container"
yum -y swap -- remove fakesystemd -- install systemd systemd-libs
yum clean all
cd /lib/systemd/system/sysinit.target.wants
for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done;
rm -f /lib/systemd/system/multi-user.target.wants/*
rm -f /etc/systemd/system/*.wants/*
rm -f /lib/systemd/system/local-fs.target.wants/*
rm -f /lib/systemd/system/sockets.target.wants/*udev*
rm -f /lib/systemd/system/sockets.target.wants/*initctl*
rm -f /lib/systemd/system/basic.target.wants/*
rm -f /lib/systemd/system/anaconda.target.wants/*

#yum -y swap -- remove fakesystemd -- install systemd systemd-libs
#yum clean all
#systemctl mask dev-mqueue.mount dev-hugepages.mount \
#    systemd-remount-fs.service sys-kernel-config.mount \
#    sys-kernel-debug.mount sys-fs-fuse-connections.mount
#systemctl mask display-manager.service systemd-logind.service
#systemctl disable graphical.target
#systemctl enable multi-user.target

#/usr/lib/systemd/systemd --system --show-status=1 --log-level=debug

