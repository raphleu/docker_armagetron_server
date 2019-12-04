#!/bin/bash

loc="/home/root/armagetronad/"
tron=$loc"bin/armagetronad-dedicated"
server=$loc"servers/"$1"/"
var=$server"var"
settings=$server"settings"
command=$server"command.txt"
console=$server"console.txt"

### Comment ###
# $1 is the folder name of server given from start.sh it is executed

#mkdir $server"logs"
#screen -S $1 -X log on
#screen -S $1 -X logfile $server"logs/$1.log"
#screen -S $1 -X logstamp on

while true; do
	$tron --userdatadir $server --vardir $var --userconfigdir $settings --input $command >> $console
	echo "!============================== SERVER RESTARTING IMMEDIATELY ==============================!" >> $console
	sleep 1
done
