#!/bin/bash
version=$1
function installSonar(){
checkpostgres
checkVersionAvailability
configSonar
systemdService
}
function checkSonar(){
 systemctl status sonar
    if [ "$?" -eq "0" ]
    then
         exit 0
    else
        installSonar
    fi
   
}
function defaultSonarInstall(){
        wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.7.6.zip
        unzip sonarqube-6.7.6.zip
        sudo cp -r sonarqube-6.7.6 /opt/sonarqube
}
function checkVersionAvailability(){
 if [ -z "$version" ]
 then
        defaultSonarInstall
 else
    wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-$version.zip 
   if [ "$?" -eq "0" ]
   then
        unzip sonarqube-$version.zip
        sudo cp -r sonarqube-$version /opt/sonarqube 
   else
         defaultSonarInstall
    fi
 fi

}
function configSonar(){
sudo chown -R sonar:sonar /opt/sonarqube
sudo sed -i 's/^\#RUN_AS_USER=/RUN_AS_USER=sonar/1g' /opt/sonarqube/bin/linux-x86-64/sonar.sh
sudo sed -i 's/^\#sonar.jdbc.username=/sonar.jdbc.username=sonar/1g' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's/^\#sonar.jdbc.password=/sonar.jdbc.password=sonar/1g' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's/^\#sonar.jdbc.url=jdbc\:postgresql:\/\/localhost\/sonar/sonar.jdbc.url=jdbc\:postgresql\:\/\/localhost\/sonar/1g' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's/^\#sonar.web.host=0.0.0.0/sonar.web.host=127.0.0.1/1g' /opt/sonarqube/conf/sonar.properties
sudo sed -i 's/^\#sonar.search.javaOpts=-Xms512m \\/sonar.search.javaOpts=-Xms512m -Xms512m/1g' /opt/sonarqube/conf/sonar.properties
}
function systemdService(){
sudo bash -c 'cat <<EOF > /etc/systemd/system/sonar.service
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking

ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop

User=sonar
Group=sonar
Restart=Always

[Install]
WantedBy=multi-user.target
EOF'
sudo systemctl daemon-reload
sudo systemctl start sonar
sudo systemctl enable sonar

}
function installPostgreSQL(){
checkJava
sudo sh -c echo "deb http://apt.postgresql.org/pub/repos/apt/`lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list;
wget -q https://www.postgresql.org/media/keys/ACCC4CF8. asc -O- | sudo apt-key add - 
sudo apt-get update -y 
 sudo apt install -y postgresql postgresql-contrib 
 userSonar
 postgreConf
}
function postgreConf(){
sudo -u postgres bash -c "psql -c \"CREATE USER sonar WITH PASSWORD 'sonar';\""
sudo -u postgres bash -c "psql -c \"Create DATABASE sonar OWNER sonar;\""

}
function userSonar(){
    sudo useradd sonar
    echo "sonar:sonar" | sudo chpasswd   
}
function checkpostgres(){
    psql --version
    if [ "$?" -eq "0" ]
    then
          continue
    else
        installPostgreSQL
    fi

}
function checkJava(){

    java -version
    if [ "$?" -eq "0" ]
    then
        continue
    else
    sudo apt update -y
    sudo apt install -y openjdk-8-jdk
fi
}
checkSonar