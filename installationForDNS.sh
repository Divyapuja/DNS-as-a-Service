#!/bin/bash
sudo docker exec -i $1 apt-get update
sudo docker exec -i $1 apt-get upgrade -y
sudo docker exec -i $1 apt-add-repository ppa:ansible/ansible -y
sudo docker exec -i $1 apt-get update
sudo docker exec -i $1 apt-get install -y ansible
sudo docker exec -i $1 apt-get install python -y
#need to copy ansible script as well
