#!/bin/bash
sudo docker exec -i $1 yum install epel-release
sudo docker exec -i $1 yum install ansible
sudo docker exec -i $1 yum install python -y
sudo docker exec -i $1 iptables -I INPUT -p udp --dport 53 -m state --state NEW -m recent --set
sudo docker exec -i $1 iptables -I INPUT -p udp --dport 53 -m state --state NEW -m recent --update --seconds 2 --hitcount 10 -j DROP
sudo docker cp triggerDNSAnsible.sh $1:/triggerDNSAnsible.sh
sudo docker cp chDNSscript.yml $1:/main.yml

