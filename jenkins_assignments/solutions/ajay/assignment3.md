# Create a Jenkins job(InstallPackage) that will take a package name as input and install it in local system.

 Create a new job =>
1. Under _General_ tab, _Select "This project is parameterized"_
2. Add Parameter => _String Parameter => _PACKAGE__
3. Build execute shell =>  _"sudo yum install $PACKAGE -y"_

# Modify InstallPackage jenkins job to take remote system IP as input to install the package.

1. Add Parameter => _String Parameter_ => REMOTEIP
2. Build execute shell =>  _ssh root@$REMOTEIP "COMMAND"_

![jenkins10](ninja/ajay/images/jenkins10.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/jenkins10.PNG) 
 
# Modify InstallPackage jenkins job so that it should be able to support different types of OS such as:
  * Ubuntu 14/16
  * CentOS 6/7

```bash
DISTRO=sudo cat /etc/os-release | grep -i  "^ID=" |cut -d"=" -f2
if [ $DISTRO=="ubuntu" ]
	apt-get install $PACKAGE -y
	
else
	yum install $PACKAGE -y

fi 
```

# Modify InstallPackage jenkins job to take additional parameters for remote system to be managed:
  * ssh username
  * PrivateKey file

1. Add Parameter => _String Parameter_ => _UserName_
2. Add Parameter => _String Parameter_ => _IpAddress_
3. Add Parameter => _File Parameter_ => _PrivateKeyFile_

![jenkins11](ninja/ajay/images/jenkins11.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/jenkins11.PNG)

# Modify InstallPackage jenkins job where a drop down will be provided of remote systems to be managed.

1. Add Parameter => _String Parameter_ => Name : _RemoteServerName_
2. Choices : _Application Server Database Server etc_

![jenkins12](ninja/ajay/images/jenkins12.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/jenkins12.PNG)

![jenkins13](ninja/ajay/images/jenkins13.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/jenkins13.PNG)

# Modify InstallPackage jenkins job where checkboxes are provided for multiple remote systems.

1. Install _Active Choices plugin_
2. Name: _RemoteServerNames_
3. Add Parameter => _Active Choices Parameter_
4. Groovy Script
```bash
return[
'Application Server',
'DB Server',
'AWS Server',
'Jenkins Server'
]
```
5. Choice Type: _Checkboxes_

![jenkins14](ninja/ajay/images/jenkins14.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/jenkins14.PNG)


