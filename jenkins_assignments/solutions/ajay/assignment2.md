# [Git] Create a Jenkins job that will create a tag using Git plugin.

![mavenjob1](ninja/ajay/images/mavenjob1.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/mavenjob1.PNG)

![mavenjob1](ninja/ajay/images/mavenjob1.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/mavenjob1.PNG)

![gitplugin3](ninja/ajay/images/gitplugin3.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/gitplugin3.PNG)

![mavenjob1](ninja/ajay/images/mavenjob1.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/mavenjob1.PNG)

# [Maven] Create a maven based jenkins job to build the code available in same repository.

![mavenjob1](ninja/ajay/images/mavenjob1.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/mavenjob1.PNG)

![mavenjob2](ninja/ajay/images/mavenjob2.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/mavenjob2.PNG)

![disk_space1](ninja/ajay/images/disk_space1.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/disk_space1.PNG)

# [SSH Plugin] Run a script to find out top 5 files as major contributor to disk space

![disk_space1](ninja/ajay/images/disk_space1.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/disk_space1.PNG)

![disk_space2](ninja/ajay/images/disk_space2.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/disk_space2.PNG)


# [HTML Publisher]: Create a Jenkins job that will generate a HTML file for the commits happened in last 10 days and publishes it as HTML report

1. Install Plugin HTML Publisher

![html1](ninja/ajay/images/html1.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/html1.PNG)

![html2](ninja/ajay/images/html2.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/html2.PNG)

![html3](ninja/ajay/images/html3.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/html3.PNG)

![html4](ninja/ajay/images/html4.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/html4.PNG)

# Plugins

### [Join]
	Triggers a job after a group of jobs finish
### [Global Build Stats]
	Plugin 	_**build-metrics**_ => This plugin uses the Global Build Stats to generate some basic build metrics.
### [GitHub/GitLab Pull Request Builder]
	This plugin builds pull requests in github/gitlab and report results.
### [Job Configuration History Plugin]
	Job history plugin for Jenkins
### [Configuration Slicing Plugin]
	Allows configuration of a single property across a group of projects.
	
	If you want to make changes in multiple jenkins jobs, this plugin allows you to make multiple changes in multiple/all jobs in one go.
	
## _Pending Questions_

[Copy Artifacts]: Create 2 Jenkins job

1. ArtifactBuilder: This job will checkout the code corresponding to a static website and build artifact.
2. ArtifactDeployer: This job will use the artifact built from previous job and deploys it to a target server. Also make sure that this job will not run when ArtifactBuilder job is running and vice versa.

