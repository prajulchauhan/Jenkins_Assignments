
# Learning by Doing | Jenkins

## Introduction
In this section we will learn to manage log rotation via jenkins

## Assignments
### Must Do
* Create a jenkins pipeline job which will manage log rotation of log files (based on disk space left) which is mentioned in a specific txt file.
* eg of txt file :
    /var/log/jenkins/jenkins.log
    /var/log/nginx.log
    /var/log/mysql.log
* Pipeline will read above txt file and put log rotation based on disk utilisation
  1. 30% - 50 % --> log rotation of 5 days
  2. 50% - 70 % --> log rotation of 3 days
  3. more than 70% --> log rotation of 2 days
* Pipeline should run every 5 mins and notification should be send to users about disk utilisation of the server and log rotation status(days)

### Good to do
* Instead of using shell script for implementing log rotate .. use log rotate utility.

