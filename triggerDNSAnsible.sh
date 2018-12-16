#!/bin/bash

#Subnet_IP, VPC_IP, Domain_url,secondary_Subnet_IP, secondary_VPC_IP
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

ansible-playbook -i inventory main.yml
