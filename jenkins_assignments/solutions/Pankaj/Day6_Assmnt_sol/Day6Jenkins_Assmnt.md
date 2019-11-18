Must Do


Create a pipeline job which will include below stages (Same like Day5 assignment).

Checkout code (Clone spring3hibernate)
Code Stability

![image](images/cd1.png)

Code Quality
Code Coverage

![image](images/cd2.png)

Code Vulnerablity (Using snyk plugin, scan code vulnerablities and publish the report)

![image](images/cd3.png)

![image](images/snk1.png)

![images](images/snk2.png)

Email Notification (Notification must contains job console URL, the username who started the job)

![image](images/eml1.png)

![image](images/all1.png)

![image](images/eml2.png)

Slack Notification (Notification must contains job console URL and the username who started the job)

![image](images/slk1.png)

![image](images/all1.png)

![image](images/slk2.png)

Approval (Pipeline should wait for the input from the submitter. message will be "Do you want to continue Yes/No") NOTE: only specific submitter should be able to approve to continue it, not other users.

![image](images/appr.png)

![image](images/all1.png)

Deployment (if submitter approved in previus stage, code should be deployed in remote server.)

![image](images/dpl1.png)

![image](images/dpl2.png)

![image](images/dpl3.png)

![image](images/dpl4.png)

Slack Notification (Notification must contains job console URL and the username who started the job)
Rollback (Pipeline should wait for the input from the submitter. Pipeline should ask submitter below inputs:
a. Rollback Yes/No
b. Git tag for rollback ) NOTE: only specific submitter should be able to approve to continue it, not other users. If submitter approve this, rollback job should be triggered  (see below for rollback job)



Create a pipeline job for rollback with below stages

Checkout code (checkout code acc to git tag passed by above deployment job)
Package
Deployment (Deploy above code to remote server)
Slack Notification (Notification must contains job console URL)


NOTE


If pipeline fails in any stage, slack notification should be triggered and it should mention stage name where pipeline failed and error msg.



Good to Do

Write scripted pipeline instead of declarative pipeline for above task.
Instead of using "sh" parameter in pipeline script for maven commands, use maven plugin
Create functions for slack and email notification in pipeline script.
Store each artifact created by CI job in your server with <job_name>_<build_no> name. and then use this artifact while rollback, so that you dont have to recompile the previous code while rollback.