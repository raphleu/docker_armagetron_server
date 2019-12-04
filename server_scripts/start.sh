#!/bin/sh

server=$servername

loc="/home/root/armagetronad/servers/"$server"/"
command=$loc"command.txt"
console=$loc"console.txt"

case $1 in
	start)
		if ! screen -list | grep -q $server; then
    			rm -rf $command
			touch $command

	    		rm -rf $console
    
			echo "Starting "$server" immediately!"
			screen -dmS $server ./server.sh $server
		else
			echo $server" is already running..."
		fi
	;;
	stop)
		if ! screen -list | grep -q $server; then
			echo $server" server is already stopped..."
		else
			echo "Stopping "$server" immediately!"
			echo "EXIT" >> $command
			sleep 1
			screen -S $server -X quit 
		fi
	;;
esac
