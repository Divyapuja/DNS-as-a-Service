import json, ast
import sys
import os
import random

def new_ip():
	new_ip = str(random.randint(10,254)) + '.' +str(random.randint(10,168))
	new_ip += '.0.5'
	for key in db:
		new_vpc_ip1 = db[key]['VPC_IP'].split('/.')
		if new_vpc_ip1[0:2]== new_ip[0:2]:
			new_ip()
	return new_ip
	#check_ip_vpc(new_ip)


def check_ip_vpc(check_ipaddr):
	if not bool (db):
		check_ip = check_ipaddr.split('.')
		check_ip[-1] = '5'						### Hardcoded for VPCs to start from x.x.x.5/mask
		new_check_ip = '.'.join(check_ip)
		return new_check_ip

	for key in db:
		new_vpc_ip = db[key]['VPC_IP'].split('.')
		if new_vpc_ip[0:1]== ip_addr[0:1]:
			return new_ip()
		else:
			check_ip = check_ipaddr.split('.')
			check_ip[-1] = '5'
			new_check_ip = '.'.join(check_ip)
			return new_check_ip


vpc_name = sys.argv[1]
ip_type = sys.argv[2]
ip_raw = sys.argv[3]
temp = ip_raw.split('/')
ip = temp[0]
mask = temp[1]
ip_addr = ip.split('.')


if os.path.isfile('./var/log/db.json'): 				##Check file location for json log file
	ip_file = open("db.json", 'r')
	db = json.load(ip_file)
else:
	db = dict()

if db.has_key(vpc_name):
	if ip_type == 'subnet':
		if not db[vpc_name]['subnet1']:
			added_ip = '.'.join(ip_addr[0:3]) + '.10'
			db[vpc_name]['subnet1'].append(added_ip + '/' + mask)

		elif db[vpc_name]['subnet1']:
			last_ip = db[vpc_name]['subnet1'][-1].replace('/','.').split('.')
			print (last_ip)
			if last_ip[0:3] == ip_addr[0:3]:
				print ("IP already exists")
				added_ip = '.'.join(last_ip[0:3])
				added_ip+='.'+str(int(last_ip[-2])+1)
				db[vpc_name]['subnet1'].append(added_ip + '/' + mask)
			elif not db[vpc_name]['subnet2']:
				added_ip = '.'.join(ip_addr[0:3]) + '.10'
				db[vpc_name]['subnet2'].append(added_ip + '/' + mask)

			elif db[vpc_name]['subnet2']:
				last_ip = db[vpc_name]['subnet2'][-1].replace('/','.').split('.')
				if last_ip[0:3] == ip_addr[0:3]:
					print ("IP already exists")
					added_ip = '.'.join(last_ip[0:3])
					added_ip+= '.'+str(int(last_ip[-2])+1)
					db[vpc_name]['subnet2'].append(added_ip + '/' + mask)
				else:
					print ("VPC already has 2 different subnets")
				
else:
	if ip_type == 'vpc':
		new_ip = check_ip_vpc(ip)
		new_ip+='/'+mask
		db.update({vpc_name: {'VPC_IP': new_ip, 'subnet1': [], 'subnet2': []}})


ip_file = open("db.json", 'w')
json.dump(db, ip_file)
