#!/bin/bash

#Subnet_IP, VPC_IP, Domain_url,secondary_Subnet_IP, secondary_VPC_IP
# remove /24 from $2
Subnet_IP=$1
VPC_IP=$2
Domain_url=$3
secondary_Subnet_IP=$4
secondary_VPC_IP=$5

export Subnet_IP
export VPC_IP
export Domain_url
export secondary_Subnet_IP
export secondary_VPC_IP

ip route del default
ip route add default via $VPC_IP 
ansible-playbook -i inventory main.yml
