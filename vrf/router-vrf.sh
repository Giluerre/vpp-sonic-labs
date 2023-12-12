#!/bin/sh
sudo docker exec -d clab-frr01-router1 ip link add dev 1 type vrf table 1 
sudo docker exec -d clab-frr01-router1 ip link set dev 1 up
sudo docker exec -d clab-frr01-router1 ip link set dev eth1 master 1 
sudo docker exec -d clab-frr01-router1 ip link set dev eth4 master 1 

sudo docker exec -d clab-frr01-router1 ip link add dev 2 type vrf table 2 
sudo docker exec -d clab-frr01-router1 ip link set dev 2 up 
sudo docker exec -d clab-frr01-router1 ip link set dev eth2 master 2 
sudo docker exec -d clab-frr01-router1 ip link set dev eth5 master 2 


sudo docker exec -d clab-frr01-router1 ip link add dev 3 type vrf table 3 
sudo docker exec -d clab-frr01-router1 ip link set dev 3 up 
sudo docker exec -d clab-frr01-router1 ip link set dev eth3 master 3 
sudo docker exec -d clab-frr01-router1 ip link set dev eth6 master 3 


