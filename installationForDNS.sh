#!/bin/bash
sudo docker exec -i $1 apt-get update
sudo docker exec -i $1 apt-get upgrade -y
sudo docker exec -i $1 apt-get install tcpdump -y
sudo docker exec -i $1 apt-get install net-tools -y
sudo docker exec -i $1 apt-get install iproute2 -y
sudo docker exec -i $1 apt install iputils-ping -y
sudo docker exec -i $1 apt-get install bind9 bind9utils bind9-doc -y
