#change json to yml file to fetch data as direct varialble
import sys
import json
import csv

with open('dockerName_PID.json') as f:
    data = json.load(f)

f = open("main.yml","w")
for key,val in data.items():
	f.write( key+" : "+val )
f.close()
