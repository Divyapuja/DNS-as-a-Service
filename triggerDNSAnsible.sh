#!/bin/bash

#Subnet_IP, VPC_IP, Domain_url
Subnet_IP=$1
VPC_IP=$2
Domain_url=$3

export Subnet_IP
export VPC_IP
export Domain_url

ansible-playbook -i inventory main.yml
