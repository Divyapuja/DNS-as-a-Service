#!/bin/bash

# remove /24 from $2
Subnet_IP=$1

export Subnet_IP

ip route del default
ip route add default via $VPC_IP 
ansible-playbook -i inventory main.yml
