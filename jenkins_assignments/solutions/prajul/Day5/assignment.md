# Assignment Solution by Prajul Chauhan


## Create a pipeline job for CI which will include below stages.
  1. Checkout code (Clone spring3hibernate)


  2. Code Stability
 

  3. Code Quality
 

  4. Code Coverage


![image](image/1.png)

![image](image/2.png)

![image](image/3.png)

![image](image/4.png)


  5. Email Notification (Notification must contains job console URL and the username who started the job)


![image](image/9.png)



  6. Slack Notification (Notification must contains job console URL and the username who started the job)


![image](image/10.png)


# Publish Code coverage and checkstyle report in above pipeline job


![image](image/5.png)

![image](image/6.png)

![image](image/7.png)

![image](image/8.png)

* If issues in above health reports is greater than 2, then job should get failed.   
* Create a Job DSL for above pipeline job and using Job DSL, create same pipeline job with different name. 
