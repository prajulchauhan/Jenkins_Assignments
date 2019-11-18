#!/bin/bash
check_dependancies()
{
sudo yum install java-1.8.0-openjdk -y
sudo yum install wget
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M10/bin/apache-tomcat-9.0.0.M10.tar.gz
}

jenkins_pkg_install()
{
read -r -p "To upgrade package type \/yes/\& To install from source provide version name : " VAR
if [[ $VAR =~ [0-9] ]];
then
        check_dependancies
        wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M10/bin/apache-tomcat-9.0.0.M10.tar.gz -O tomcat.tar.gz
        sudo tar xzf tomcat.tar.gz
        echo "<?xml version='1.0' encoding='utf-8'?>
        <tomcat-users>
            <role rolename="manager-gui"/>
            <role rolename="manager-script"/>
            <role rolename="manager-jmx"/>
            <role rolename="manager-jmx"/>
            <role rolename="admin-gui"/>
            <role rolename="admin-script"/>
            <user username="admin" password="admin" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui,admin-script"/>
        </tomcat-users>" > tomcat*/conf/tomcat-users.xml
        url=http://updates.jenkins-ci.org/download/war/"$VAR"/jenkins.war
        wget "{url}"
        sudo chmod -R 755 tomcat*
        sudo cd tomcat*
        ./bin/startup.sh
else
      if [[ $VAR == "yes"  ]];
      then
          sudo yum upgrade $1 -y
      else
          exit
      fi
fi
}

rpm -qa $1 &> /dev/null
if [ $? -eq 0 ];
then
        echo $1 "package is installed"
        jenkins_pkg_install
else
        sudo yum install jenkins -y
        jenkins_pkg_install
fi

