#!/bin/bash
USERNAME="ubuntu centos "
HOSTS="13.233.158.85 host2 host3"
SCRIPT="cd /tmp; ./nginx.sh" 
for HOSTNAME in ${HOSTS} ; do
    scp /home/aj/nginx.sh ${USERNAME}@${HOSTNAME}:/tmp
    ssh ${USERNAME}@${HOSTNAME} "${SCRIPT}"
done
