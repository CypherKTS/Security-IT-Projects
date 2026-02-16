#!/bin/bash
# portscanner.sh
# Author: Uzair Khan
# 02-15-2026
# Description: Bash TCP port scanner with timeout, interactive mode, and batch mode.
TIMEOUT=2
# pingcheck function
function pingcheck
{
pingresult=$(ping -c 1 $host | grep bytes | wc -l)
if [ "$pingresult" -gt 1 ]; then
    echo "$host is up"
else
    echo "$host is down, quitting"
    exit
fi
}
# portcheck function
function portcheck
{
for ((counter=$startport; counter<=$stopport; counter++))
do
    if timeout $TIMEOUT bash -c "echo >/dev/tcp/$host/$counter"
    then 
        echo "$counter open"
    else
        echo "$counter closed"
    fi
done
}

# Check for valid number of arguments
if [[ $# -ne 0 && $# -ne 2 && $# -ne 3 && $# -ne 5 ]]; then
	echo "Usage: ./portscanner.sh [-t timeout] [host startport stopport],"
	exit
fi

# Handle -t option
if [[ "$1" == "-t" ]]; then
	TIMEOUT=$2
	echo "Timeout changed to $TIMEOUT"
	shift 2
fi

# If the arguments continue, run a normal scan
if [[ $# -eq 3 ]]; then
	host=$1
	startport=$2
	stopport=$3
	
	pingcheck
	portcheck
	exit
fi

# Interactive mode
while true
do
	echo -n "Enter hostname: "
	read host
	
	if [[ -z "$host" ]]; then
		exit
	fi
	
	echo -n "Enter starting port: "
	read startport
	
	echo -n "Enter ending port: "
	read stopport
# first, check that the host is alive	
	pingcheck
# next, loop through the ports
	portcheck
done

