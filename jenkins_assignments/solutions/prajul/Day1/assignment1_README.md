# Assignment SOlution by Prajul Chauhan




###must

# Create a freestyle job to print "Hello world".

 
	Enter Item Name & opt for freestyle project. Give description & add build that'll execute your script 

#	##output

		Started by user Prajul Chauhan
		Running as SYSTEM
		Building in workspace /var/lib/jenkins/workspace/Hello World
		[Hello World] $ /bin/sh -xe /tmp/jenkins3180539208757622610.sh
		+ echo 'Hello World'
		Hello World
		Finished: SUCCESS```



#Create a freestyle job to which take absolute path of a directory then
    * List all files and directories inside that.
    * Print a message "drectory not exist" if directory doesn't exist on file system
    * Print "Inappropriate permissions" if you don't have permissions to list files.




		open new item
		Enter the name of project
		select free style
		press ok
		select "This project is parameterized"
		select string parameter 
		enter Name and Default value
		In build select Execute shell
		Enter the following lines


		      #!/bin/bash

		FILE="$1"
		[ "$FILE" == "" ] && { echo "Usage: $0 filename"; exit 1; }

		if [ -e "$FILE" ];
		then
		  echo "File $FILE exist"
		 ls -l
		else
		  echo "File $FILE does not exist" >&2



		fi


# Update the previously created freestyle job to only retain last 10 build history but not beyond 2 days.




		select your project
		select configure from side menu
		check discard old builds
		Days to keep [2]
		Max # of builds to keep [10]
		save the changes





# Clone the code available in the same repository.
    * Using git protocol
    * Using ssh protocol


		Give url & enter your credentials


### using ssh


	Add your public key to gitlab account in settings, keys then add your private key to jenkins & now clone using ssh link.





# Update above jenkins job so that it should be able to identify if there is a code commit in last 5 minutes it should get triggered.





	In Build Triggers tab, opt for  poll scm. Configure it to your build trigger needs.

	For 5 mins:  H/5 * * * * (just like we do for cron job)

	In the next 5 mins, scm will trigger the build.






# Enable colored console output


	install ANSI color plugin
