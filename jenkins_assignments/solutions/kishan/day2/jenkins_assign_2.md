1 Create a Jenkins job that should send an EmailAlert on every execution.

 ANS  Go to manage plugins and setting email configuration.
 Go to system configuration and  extendable email Notification. Click on  smtp authentication and use ssl. And fill the options-
SMTP server - smtp.gmail.com
Default user E-mail suffix - @gmail.com
User Name -
Password -
SMTP port - 465                           
Default Recipients – Give the  email id
Now configure the job on which you want to have email alert.
And under trigger section click 'always'.

2 Modify above Jenkins job to send notification only in case of state change i.e when it fails for first time, or succeed after failure

ANS Goes in post build actions
click on editable email notification and click on trigger option 
in trigger select the option fails for first time or success 
  
3 Modify above Jenkins job to send console output as an attachment.

ANS Goes in post build actions
click on editable email notification and click on the attaach build log and select the attach build log option
 
4 Modify above Jenkins job to add console output as mail body instead of attachment.

ANS Goes in post build actions
click on editable email notification 
in editable email notification fill the default content

5 Create a Jenkins job(ManageUser) that will take a user name as input and create it in local system.

ANS Go to Build section  and click on execute shell and write 
sudo useradd $username
