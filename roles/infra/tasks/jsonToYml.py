#change json to yml file to fetch data as direct varialble
import sys
import json
import csv

with open('./roles/infra/tasks/dockerName_PID.json') as f:
    data = json.load(f)

f = open("./roles/infra/vars/input.yml","w")
for key,val in data.items():
	f.write( key+" : "+val )
f.close()
