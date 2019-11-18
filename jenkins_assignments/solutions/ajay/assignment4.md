# jenkins pipeline

**Git Clone** | **Email Notification** | **Slack Notification** | **Input (Proceed/Abort)** | **Code Stability** | **Code Quality**
---------- |---------- |---------- |---------- |---------- |---------- 
Clone spring3hibernate | Send email notification before starting | Send Slack notification | Only root and ajay | Check Code Stability | Should fail if <80%

**Code Coverage** | **Publish Report** | **Input (Proceed/Abort)** | **Generate War file** | **Deploy War file** | **Slack Notification**
---------- |---------- |---------- |---------- |---------- |---------- 
Check Code Coverage | Publish Cobertura, Checkstyle and Findbugs reports|Can proceed for deployment?| Generate WAR file | Deploy | Send notification when Deployment is done

## Solution

![Pipeline Results](ninja/ajay/images/pipeline-results.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/pipeline-results.PNG)

### Required Plugins
    
    Build Pipeline
    Checkstyle (For Code Quality)
    FindBugs (test cases, Finding Bugs)
    Cobertura (Code Coverage)
    Slack Notification Plugin

### For Email notification

**Go to _gmail secure_ settings**
    
_**Enable 2 way authentication**_
    
_**App allowed => Add jenkins (password will be generated and paste below)**_

**Go to jenkins**

_**Manage Jenkins => Configure System => Email notification**_

![Email](ninja/ajay/images/email-notification.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/email-notification.PNG)

### For Slack notification

![Slack](ninja/ajay/images/slack-notification.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/slack-notification.PNG)

### Check Code Quality and to fail if below 80%, replace this code in below given pipeline

![Code Quality](ninja/ajay/images/code-quality.PNG)
![](https://gitlab.com/ot-devops-ninja/batch6/jenkins/tree/ajay/ninja/ajay/images/code-quality.PNG)


```
    pipeline {
        agent any
        stages
        {
                    stage ('Send slack message')
            {
                steps{
                    slackSend iconEmoji: '', message: 'ajay is going to deploy', tokenCredentialId: 'ajay', username: ''
    
                }
                    }
                    stage ('Git clone')
            {
                    steps {
                    sh 'rm -rf spring3hibernate; git clone git@github.com:opstree/spring3hibernate.git'
                }
            }
                    stage ('Email notification')
                    {
                            steps {
                                    emailtext body: '', subject: 'Going to start deployment', to: 'ajay.kalkhuriya@mygurukulam.org; ajaykalkhuriya@gmail.com'
                            }
                    }
                    stage ('submitter')
                    {
                            steps {
                                    input message: 'Only admin and user ajay can proceed', submitter: 'ajay'
                            }
                    }
                    stage ('Code stability')
            {
                    steps{
                    sh 'cd spring3hibernate; mvn compile'
    
                }
                    }
                    stage ('Code Quality')
            {
                steps{
                    sh 'cd spring3hibernate; mvn checkstyle:checkstyle; mvn findbugs:findbugs'
    
                }
                }
                    stage ('Code Coverage')
            {
                steps{
                    sh 'cd spring3hibernate; mvn cobertura:cobertura'
                }
                    }
                    stage ('Publish Cobertura')
                    {
                            steps {
                                    cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: 'spring3hibernate/target/site/cobertura/coverage.xml', enableNewApi: true, failUnhealthy: false, maxNumberOfBuilds: 0, onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
                            }
                    }
                    stage ('Publish Checkstyle')
            {
                steps{
                    checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '', unHealthy: ''
    
                }
                    }
                    stage ('Publish findbugs')
            {
                steps{
                    findbugs canComputeNew: false, defaultEncoding: '', excludePattern: '', healthy: '', includePattern: '', pattern: 'spring3hibernate/target/findbugs.xml', unHealthy: ''
    
                }
                    }
                    stage ('submitter1')
                    {
                            steps {
                                    input message: 'Can do deployment?', submitter: 'ajay'
                            }
                    }
                    stage ('WAR file generation')
            {
                steps{
                    sh 'cd spring3hibernate; mvn install'
    
                }
                    }
                    stage ('Deploy WAR file in tomcat')
            {
                steps{
                    sh 'cp -rp ~/.m2/repository/Spring3HibernateApp/Spring3HibernateApp/1.8-SNAPSHOT/Spring3HibernateApp-1.8-SNAPSHOT.war /opt/apache-tomcat-8.5.42/webapps/'
    
                }
                    }
		    stage ('restart  tomcat service')
            {
                steps{
                    sh 'service restart tomcat'
                }
                    }

                    stage ('Send slack message')
            {
                steps{
                    slackSend iconEmoji: '', message: 'Deployment is done', tokenCredentialId: 'ajay', username: ''
    
                }
                    }
            }
    }
```
