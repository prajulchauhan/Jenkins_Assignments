#!/bin/bash
function installJenkins()
{
	checkUserInput
	checkVersionAvailability
	jenkinsInstallation


}
function checkVersionAvailability(){
	wget -q -O - https://pkg.jenkins.io/debian/binary/jenkins_$VER/_all.deb | sudo apt-key add -
	if [ $? -ne 0 ]
	then
		wget -q -O - https://pkg.jenkins.io/debian/binary/jenkins_2.184_all.deb | sudo apt-key add -

	fi
}
function jenkinsInstallation(){
	echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
	checkJavaInstallation
        sudo apt update
        sudo apt install -y jenkins
	sudo ufw allow 8080
}
function checkJavaInstallation(){
		java -version
		if [ $ -ne 0 ]
		then
			sudo apt install -y openjdk-8-jdk
		fi

}
function checkUserInput()
{
	VER=2.184
	if [ ! -z $1]
	then	
		VER=$1
	fi
}

installJenkins
