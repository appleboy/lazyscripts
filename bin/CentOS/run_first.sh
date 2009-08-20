#!/bin/bash 

PLAT_NAME=`uname -i`
TOP_DIR=`pwd`
pushd /tmp

PKG_URL="http://dag.wieers.com/rpm/packages/rpmforge-release/"

DISTRO_VERSION=$(cat /etc/redhat-release | cut -d " " -f 3)

if [ $USER = "root" ];then
case $(getconf LONG_BIT) in
	"32")
	sudo yum -y install wget
    if [ -f rpmforge-release-0.3.6-1.el5.rf.i386.rpm ];then
        rm -rf rpmforge-release-0.3.6-1.el5.rf.i386.rpm 
    fi
	wget ${PKG_URL}rpmforge-release-0.3.6-1.el5.rf.i386.rpm
	yum -y install rpmforge-release-0.3.6-1.el5.rf.i386.rpm
    yum check-update
	yum -y install git gksu
	;;  
	"64")
	sudo yum -y install wget
    if [ -f rpmforge-release-0.3.6-1.el5.rf.x86_64.rpm ];then
        rm -rf rpmforge-release-0.3.6-1.el5.rf.x86_64.rpm 
    fi
	wget ${PKG_URL}rpmforge-release-0.3.6-1.el5.rf.x86_64.rpm
	yum -y install rpmforge-release-0.3.6-1.el5.rf.x86_64.rpm
    yum check-update
	yum -y install git gksu
	;;  
esac
else
    echo "Please run as root."
fi

popd
