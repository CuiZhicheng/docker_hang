#!/bin/bash

psm=$1

containerid=`docker ps | grep $psm | awk '{print $1}'`

#echo $containerid

pids=`ps aux | grep shim | grep $containerid | grep -v grep | grep -v dockerd | awk '{print $2}'`

#echo $pids

for pid in $pids; do
#	echo $pid
	count=`lsof -p $pid | grep init-stdin | wc -l`
#	echo "count is" $count
	if [ $count -gt 0 ]; then

		echo $pid
	fi
done
