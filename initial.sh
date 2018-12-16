#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install -y ansible
sudo apt install -y docker.io
sudo apt-get install python -y
sudo docker run -itd --privileged --name=PreSoupImage --hostname=PreSoupImage divyapuja/host
#sh installationForSoup.sh PreSoupImage
sudo docker run -itd --privileged --name=PreSoupDNS --hostname=PreSoupDNS divyapuja/subnetdns1
sh installationForDNS.sh PreSoupDNS
sudo docker run -itd --privileged --name=SoupVPCDNS --hostname=SoupVPCDNS divyapuja/vpcdnsdns1
sh installationForDNS.sh SoupVPCDNS
sudo docker run -itd --privileged --name=SoupCentralDNS --hostname=SoupCentralDNS divyapuja/centraldns
sh installationForDNS.sh SoupCentralDNS
sudo docker run -itd --privileged --name=PreSoupNginx --hostname=PreSoupNginx divyapuja/nginxlb
sh installationForNgnix.sh PreSoupNginx
sudo docker commit PreSoupImage soupimage
sudo docker commit PreSoupDNS soupsubnetdns
sudo docker commit SoupVPCDNS soupvpcdns
sudo docker commit SoupCentralDNS soupcentraldns
sudo docker commit PreSoupNginx soupnginx
sudo docker stop PreSoupImage
sudo docker stop PreSoupDNS
sudo docker stop SoupVPCDNS
sudo docker stop SoupCentralDNS
sudo docker stop PreSoupNginx
sudo docker system prune

