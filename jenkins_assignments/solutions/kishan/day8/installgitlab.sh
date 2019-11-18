#!/bin/bash
read -p "enter the version: " version
set -x

function check_gitlab()
{
     sudo gitlab-ctl status

if [ "$?" -eq "0" ]
then
        echo "already installed"
        exit 0
else

     install
fi

}
function check_version() {
if ! [ $version ]
then
        ver="latest"
else
        ver=$version
fi

}
function install() 
{  check_version
if [ $ver == "latest" ]
then
  wget --content-disposition https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/bionic/gitlab-ce_12.4.1-ce.0_amd64.deb/download.deb
    sudo dpkg -i gitlab-ce_12.4.1-ce.0_amd64.deb
else
  wget --content-disposition https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/bionic/gitlab-ce_$ver-ce.0_amd64.deb/download.deb
    sudo dpkg -i gitlab-ce_$ver-ce.0_amd64.deb
fi
}
check_gitlab

