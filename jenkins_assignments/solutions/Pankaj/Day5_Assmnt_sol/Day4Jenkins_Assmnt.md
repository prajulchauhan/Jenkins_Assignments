Must Do

Create a pipeline job for CI which will include below stages.

Checkout code (Clone spring3hibernate)
Code Stability
Code Quality
Code Coverage

![image](images/code1.png)

![image](images/codecoverage.png)

Email Notification (Notification must contains job console URL and the username who started the job)

![image](images/email.png)

Slack Notification (Notification must contains job console URL and the username who started the job)

![image](images/slack.png)

Publish Code coverage and checkstyle report in above pipeline job

![image](images/code2.png)

![image](images/cdp1.png)

![image](images/cdp2.png)

![image](images/cdp3.png)

If issues in above health reports is greater than 2, then job should get failed.

![image](images/unhlty.png)

![image](images/unhlty.png)

Create a Job DSL for above pipeline job and using Job DSL, create same pipeline job with different name.

![image](images/dsl1.png)

![image](images/dsl2.png)

![image](images/dsl3.png)

Good to Do

Write scripted pipeline instead of declarative pipeline for above task.

Instead of using "sh" parameter in pipeline script for maven commands, use maven plugin
Create functions for slack and email notification in pipeline script.