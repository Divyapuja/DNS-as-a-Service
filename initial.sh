#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install -y ansible
sudo apt install -y docker.io
sudo apt-get install python -y
sudo sudo docker run -itd --privileged --name=PreSoupImage --hostname=PreSoupImage ubuntu
sh installationForSoup.sh PreSoupImage
sudo docker run -itd --privileged --name=PreSoupDNS --hostname=PreSoupDNS ubuntu
sh installationForDNS.sh PreSoupDNS
sudo docker commit PreSoupImage soupimage
sudo docker commit PreSoupDNS soupdns
