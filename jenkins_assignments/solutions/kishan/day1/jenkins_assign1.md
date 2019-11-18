Create a freestyle job to print "Hello world".

ANS first create a new freesytle job .
 then give the description about the job.
 Then in build action select execute shell and give command .
echo "hello world" then save the job . 
Now build the job and see the console output.
 
* Create a freestyle job to which take absolute path of a directory then
    * List all files and directories inside that.
    * Print a message "drectory not exist" if directory doesn't exist on file system
    * Print "Inappropriate permissions" if you don't have permissions to list files.

ANS open new item
Enter the name of project
select free style
click ok
select "This project is parameterized" in general option.
select string parameter 
enter Name and Default value
In build, select Execute shell
Enter the following lines

#!/bin/bash

direc=$1

if ! [ -d $direc ]

then

	echo "Directory not found"

else

	ls $direc &2> /dev/null

	if [ $? -eq 0 ]

        then

		echo "Permission Denied"

        fi

 fi


 save the script and build.


* Update the previously created freestyle job to only retain last 10 build history but not beyond 2 days.

ANS select your project
select configure from side menu
click discard old builds
Days to keep [2]
Max  of builds to keep [10]
save the changes

* Clone the code available in the same repository.
    * Using git protocol
    * Using ssh protocol

ANS In source code management, select git
 clone the url  of http and copy in git repo and add Credentials
clone the url of ssh and copy in git repo and add Credentials

* Update above jenkins job so that it should be able to identify if there is a code commit in last 5 minutes it should get triggered.

ANS select poll SCM in Build Triggers
and write - */12 * * * * 

* Enable colored console output

ANS for color console output install the ansicolor plugin in manage plugin 
in Build Environment select ansicolor plugin for colored console output


