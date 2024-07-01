#!/bin/bash

set -x

execute() {
if [[ "$2" == *.vtysh ]]; then
	commands=$(cat $2)
     $1 vtysh -c "$commands"
else
    mapfile -t commands < $2
    
    for cmd in "${commands[@]}"; do
    $1 $cmd 
    done
fi
}


ROUTER1="docker exec clab-frr01-router1"
ROUTER2="docker exec clab-frr01-router2"

sudo clab deploy --topo frr01.clab.yml
sleep 50

$ROUTER1 swssloglevel -l INFO -c syncd
$ROUTER1 swssloglevel -l INFO -c fdbsyncd 
$ROUTER1 swssloglevel -l INFO -c orchagent
$ROUTER1 swssloglevel -l SAI_LOG_LEVEL_INFO -s -a  

$ROUTER2 swssloglevel -l INFO -c syncd
$ROUTER2 swssloglevel -l SAI_LOG_LEVEL_INFO -s -a  
$ROUTER2 swssloglevel -l INFO -c fdbsyncd 
$ROUTER2 swssloglevel -l INFO -c orchagent


./PC-interfaces.sh

sleep 10 
execute "$ROUTER1" "r1-1.vtysh"  
execute "$ROUTER2" "r2-1.vtysh"

#sleep 10
#execute "$ROUTER1" "r1-vxlan.cmd"  
#execute "$ROUTER2" "r2-vxlan.cmd" 

#sleep 10
#$ROUTER1 swssloglevel -l DEBUG -c syncd
#execute "$ROUTER1" "r1-2.vtysh"
#execute "$ROUTER2" "r2-2.vtysh"



# First sleep is intentional to load all services inside of the containers
# The others are only for better visibility in syslog


