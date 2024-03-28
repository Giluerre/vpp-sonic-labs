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
ROUTER3="docker exec clab-frr01-router3"
ROUTER4="docker exec clab-frr01-router4"

sudo clab deploy --topo frr01.clab.yml
sleep 60

$ROUTER1 swssloglevel -l INFO -c syncd
$ROUTER1 swssloglevel -l INFO -c fdbsyncd 
$ROUTER1 swssloglevel -l INFO -c orchagent
$ROUTER1 swssloglevel -l SAI_LOG_LEVEL_INFO -s -a  

$ROUTER2 swssloglevel -l INFO -c syncd
$ROUTER2 swssloglevel -l SAI_LOG_LEVEL_INFO -s -a  
$ROUTER2 swssloglevel -l INFO -c fdbsyncd 
$ROUTER2 swssloglevel -l INFO -c orchagent


./interfaces.sh

sleep 10 
execute "$ROUTER1" "r1.vtysh"  
execute "$ROUTER2" "r2.vtysh"
execute "$ROUTER3" "r3.vtysh"
execute "$ROUTER4" "r4.vtysh"


# First sleep is intentional to load all services inside of the containers
# The other is only for better visibility in syslog


