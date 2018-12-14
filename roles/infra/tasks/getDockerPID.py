#This file gets dcoker pid and stores it in json file
import sys
import subprocess
import json

k = sys.argv[1]
def proc():
	args = ['sudo', 'docker', 'inspect', '-f', '{{.State.Pid}}', k]
	proc = subprocess.Popen(args, stdout=subprocess.PIPE)
	output = proc.stdout.read()


	data = {}
	data[k] = output

#	with open('./roles/infra/tasks/dockerName_PID.json') as f:
#	    newData = json.load(f)


<<<<<<< HEAD
#	with open('./roles/infra/tasks/dockerName_PID.json', 'w') as f:
#	    newData.update(data)
#	    json.dump(newData, f)

	return output

proc()

