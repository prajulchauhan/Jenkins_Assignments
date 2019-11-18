#!/bin/bash

echo "Welcome to Postgress Installation! Version available are 9,10,11"

read -p "What version of PostgreSQL database you want to install? " num

        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -




if [ "$num" = "9" ]; then

	sudo apt-get update
	sudo apt-get install -y postgresql-9
  
echo "Postgress 9.6 is installed"

elif [ "$num" = "10" ]; then

	sudo apt-get update
	sudo apt-get install -y postgresql-10


echo "Postgress 10 is installed"

else 
	sudo apt-get update
	sudo apt-get install -y postgresql-11

echo "Postgress 11 is installed"

systemctl restart postgresql

echo 	"START psql --------"
  
	sudo -u postgres psql postgres

echo 	"END psql --------"


fi
