## Assignment Solution by Prajul Chauhan




# Create a Jenkins job(InstallPackage) that will take a package name as input and install it in local system.




	create a new project in freestyle.
	Choose the option for 'This project is Parameterized' & assign $package as a parameter.

	Execute the shell:
	
	sudo yum install -y $package 

	build the project.

###output

	
	Started by user Prajul Chauhan
	Running as SYSTEM
	Building in workspace /var/lib/jenkins/workspace/packageinstaller
	[packageinstaller] $ /bin/sh -xe /tmp/jenkins7629339462711628921.sh
	+ sudo yum install -y bind
	Last metadata expiration check: 0:31:26 ago on Mon 21 Oct 2019 08:24:16 AM UTC.
	Package bind-32:9.11.4-17.P2.el8_0.1.x86_64 is already installed.
	Dependencies resolved.
	Nothing to do.
	Complete!
	Finished: SUCCESS




# Modify InstallPackage jenkins job to take remote system IP as input to install the package.




	In the project, PackageInstaller:

	define two more parameters, $username & $ip under 'this project is parameterized'


###	Execute the shell:


	set +e

	ssh -tty $username@$ip

	if [ $os==centOS ]

	then
	    sudo yum install -y $package

	else

	sudo apt-get install -y $package

	fi

 

###output

	Started by user Prajul Chauhan
	Running as SYSTEM
	Building in workspace /var/lib/jenkins/workspace/pkginstaller
	[pkginstaller] $ /bin/sh -xe /tmp/jenkins7644225559144730913.sh
	+ set +e
	+ ssh -tty ec2-user@13.235.13.92
	+ sudo yum install -y samba
	Last metadata expiration check: 2:18:28 ago on Fri 18 Oct 2019 04:18:51 PM UTC.
	Package samba-4.9.1-8.el8.x86_64 is already installed.
	Dependencies resolved.
	Nothing to do.
	Complete!
	Finished: SUCCESS	



# Modify InstallPackage jenkins job so that it should be able to support different types of OS such as:
  * Ubuntu 14/16
  * CentOS 6/7


	 In the project, PackageInstaller:

         define three parameters: $username, $ip, $package under 'this project is parameterized'
	 
	 also define the choice parameter for OS Installation: $OS


###     Execute the shell:


        set +e

        ssh -tty $username@$ip

        if [ $os==centOS ]

        then
            sudo yum install -y $package

        else

        sudo apt-get install -y $package

        fi



###output

        Started by user Prajul Chauhan
        Running as SYSTEM
        Building in workspace /var/lib/jenkins/workspace/pkginstaller
        [pkginstaller] $ /bin/sh -xe /tmp/jenkins7644225559144730913.sh
        + set +e
        + ssh -tty ec2-user@13.235.13.92
        + sudo yum install -y samba
        Last metadata expiration check: 2:18:28 ago on Fri 18 Oct 2019 04:18:51 PM UTC.
        Package samba-4.9.1-8.el8.x86_64 is already installed.
        Dependencies resolved.
        Nothing to do.
        Complete!
        Finished: SUCCESS



# Modify InstallPackage jenkins job to take additional parameters for remote system to be managed:
  * ssh username
  * PrivateKey file



# Modify InstallPackage jenkins job where a drop down will be provided of remote systems to be managed.


	Install Extensible Choice Parameter plugin & then we can give remote system IP's there 
	& it will show them in drop down.




# Modify InstallPackage jenkins job where checkboxes are provided for multiple remote systems.

	

	Install Active Choice Plugin

	The Active Choices plug-in provides additional Jenkins parameter types that can be rendered as user interface (UI) controls in job forms. 
	It supports using system environment variables, global node properties, and you also have at least the Jenkins project in the Groovy context for Free	     style jobs at least.

	Once the plugin is installed three new parameter types become available:

	Active Choices Parameter
	Active Choices Reactive Parameter
	Active Choices Reactive Reference Parameter/	



# Modify InstallPackage jenkins job which will take a meta file as an input in below format

`host, ip, user, private_key_file, package



# Create below users in your system
  * dev
  * qa
  * devops
* qa user should be allowed only to execute the InstallPackage jenkins job
* dev user should be allowed to execute and view the content of InstallPackage jenkins job
* devops user should be admin of Jenkins server


			

	In manage Jenkins option, create 3 users dev, qa, devops.

	we can assign specified authorization & impose restrictions there.	

	Install "Role Based Authorization Plugin" 

	Go to "global security configure" & select "role based strategy".

	Now apply and save

	After installing the plugin, manage Jenkins and inside that choose manage and assign roles.

	Create and manage roles under global roles. Create roles by providing role names and clicking add button.

	Create two global roles Install and execute; install roles will be only to build the application/package for qa user. 

	Now give the read permission under overall section. This is needed so that user can login to their account. 

	Now under job section give only build access.



	Manage another global roll named as “execute”. Give Read access under overall section. 
	Configure access so that this user can build and view the code by configuring it.


	Now come to project roll section. Add roll and pattern in this section. 
	Assign the jobs “Install_package” to the roll created. 
	Make sure you write the exact project name/Job name in pattern section otherwise the roll will be unable to find the job name later. 
	Give the access to created roll as per the requirement above.
	Assign the rolls. Add the three user’s that we have created in global roles 
	check mark for respective project rolls that we have created above for respective users.
	For user “devops” give the admin access inside global assign rolls.
