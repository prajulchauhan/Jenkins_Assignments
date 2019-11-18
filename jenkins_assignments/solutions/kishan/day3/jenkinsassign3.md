* Let's assume you are working on 3 projects, PROJECT1, PROJECT2, PROJECT3
* Project1 has 3 environments DEV, QA, PROD
* Project2 has 4 environment DEV, QA, UAT, PROD
* Project3 has 5 environment DEV, QA, UAT, PT, PROD
* Now as you are already aware for each project you will have CI jobs and deployment jobs, create dummy jobs.
* Arrange your jobs in Jenkins in such a fashion that it will be easy to manage them and for a new person it will be pretty easy to understand which job belong to which project.

![image](images/day3view1.png)

![image](images/day3view2.png)

![image](images/day3view3.png)


* Create a Jenkins job(ManageTemplate) that will take a template file, property file(value of variables used in template file) and location as input and then create a file in local system.

![image](images/tem.png)

![image](images/temp2.png)


* Modify ManageTemplate jenkins job to take remote system IP as input to create the file.

![image](images/addip2.png)

![image](images/addip.png)

![image](images/addip3.png)


* Modify ManageTemplate jenkins job to take additional parameters for file to be managed such as:
  * permission
  * owner of file
  * group owner of file

![image](images/perm1.png)

![image](images/perm2.png)

![image](images/perm3.png)

![image](images/perm4.png)


* Modify ManageTemplate jenkins job where a drop down will be provided of remote systems to be managed.

![image](images/choiip.png)

![image](images/choiip2.png)


* Modify ManageTemplate jenkins job where checkboxes are provided for multiple remote systems
![image](images/chec1.png)
![image](images/chec2.png)
