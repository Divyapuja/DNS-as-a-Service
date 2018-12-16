#!/bin/bash

# remove /24 from $2
centralDNS1_IP=$1
centralDNS2_IP=$2
export centralDNS1_IP
export centralDNS2_IP

ip route del default
ip route add default via 50.50.50.1 
ansible-playbook -i inventory main.yml
