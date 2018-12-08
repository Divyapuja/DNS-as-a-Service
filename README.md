# DNS-as-a-Service
DNS as a service using docker ansible and BIND9

# Steps to run the script
 - sh initial.sh
 - ansible-playbook -i inventory main.yml
 
# Note: Currently we have checked this code on ubuntu 16.04 with VCL machine. So the access to /etc folder is denied to place the userInput.yml file. While running the code in course provided linux machines, as an management admin make sure to add the file to /etc and update the code to copy file from /etc to var instead of from current folder.
