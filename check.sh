#!/bin/bash
ps_out=`ps -C 'python server.py m'`
result=$(echo $ps_out)
	#echo "$result"
if [[ "$result" != "PID TTY TIME CMD" ]];then
    echo "Running"
else
    echo "Not Running"
fi
