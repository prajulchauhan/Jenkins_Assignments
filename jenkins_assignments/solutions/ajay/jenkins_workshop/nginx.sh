#!/bin/bash


DISTRO=sudo cat /etc/os-release | grep -i  "^ID=" |cut -d"=" -f2
	if [ $DISTRO=="ubuntu" ]
	then

 if 

     [[ ! -z "$APT_CMD" ]]; 
 
 then
     {

    sudo apt update
        sudo apt install nginx -y
        sudo systemctl enable nginx
        sudo systemctl status nginx

read -p "Do you want to install package... Enter Y/N" answer
        if [ "$answer" != "${answer#[Yy]}" ]
        then
        read -p "Enter package name" package

        sudo apt-get install $package -y


else
    echo "Thanks"
    fi
}

       else
           {
   sudo yum update
   sudo yum install nginx -y
    sudo systemctl enable nginx
    sudo systemctl status nginx


read -p "Do you want to install package... Enter Y/N" answer
        if [ "$answer" != "${answer#[Yy]}" ]
        then
        read -p "Enter package name" package

        sudo yum install $package -y

else
    echo "Thanks"
    fi

}
fi
