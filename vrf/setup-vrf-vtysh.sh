#!/bin/sh

sudo docker exec -d clab-frr01-router1 vtysh -c "
	conf t
	int eth1 
	ip addr 192.168.1.1/24
	int eth4
	ip addr 192.168.2.1/24
	int eth2 
	ip addr 192.168.1.1/24
	int eth5
	ip addr 192.168.2.1/24
	int eth3 
	ip addr 192.168.1.1/24
	int eth6
	ip addr 192.168.2.1/24
	exit
"



