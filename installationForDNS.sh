#!/bin/bash
sudo docker exec -i $1 yum install epel-release
sudo docker exec -i $1 yum install ansible
sudo docker exec -i $1 yum install python -y
sudo docker cp triggerDNSAnsible.sh $1:/triggerDNSAnsible.sh
sudo docker cp chDNSscript.yml $1:/main.yml

