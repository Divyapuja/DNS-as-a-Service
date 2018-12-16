#!/bin/bash
sudo docker exec -i $1 iptables -I INPUT -p udp --dport 53 -m state --state NEW -m recent --set
sudo docker exec -i $1 iptables -I INPUT -p udp --dport 53 -m state --state NEW -m recent --update --seconds 2 --hitcount 10 -j DROP
sudo docker cp triggerNginxAnsible.sh $1:/triggerNginxAnsible.sh
sudo docker cp chNginxscript.yml $1:/main.yml


