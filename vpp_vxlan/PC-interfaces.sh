#!/bin/sh
sudo docker exec -d clab-frr01-PC1 ip link set dev eth2 address aa:aa:aa:aa:aa:aa
sudo docker exec -d clab-frr01-PC1 ip link set eth2 up
sudo docker exec -d clab-frr01-PC1 ip addr add 168.95.10.2/16 dev eth2
sudo docker exec -d clab-frr01-PC1 ip route add 0.0.0.0/0 dev eth2
#sudo docker exec -d clab-frr01-PC1 ip route add 10.10.10.0/24 via 192.168.11.1 dev eth1
 
sudo docker exec -d clab-frr01-PC2 ip link set dev eth2 address be:ef:be:ef:be:ef
sudo docker exec -d clab-frr01-PC2 ip link set eth2 up
sudo docker exec -d clab-frr01-PC2 ip addr add 168.95.10.1/16 dev eth2
#sudo docker exec -d clab-frr01-PC2 ip route add 0.0.0.0/0 via 203.0.113.2 dev eth1
#sudo docker exec -d clab-frr01-PC2 ip route add 0.0.0.0/0 dev eth2
#sudo docker exec -d clab-frr01-PC2 ip route add 10.10.10.0/24 via 192.168.12.1 dev eth1
 
sudo docker exec -d clab-frr01-router1 config interface ip add Ethernet0 10.0.1.1/31
sudo docker exec -d clab-frr01-router1 config interface startup Ethernet0
sudo docker exec -d clab-frr01-router1 config interface startup Ethernet1
#sudo docker exec -d clab-frr01-router1 config interface ip add Loopback0 10.10.10.1/32
#sudo docker exec -d clab-frr01-router1 config interface startup Loopback0

sudo docker exec -d clab-frr01-router2 config interface ip add Ethernet0 10.0.1.0/31
sudo docker exec -d clab-frr01-router2 config interface startup Ethernet0
sudo docker exec -d clab-frr01-router2 config interface startup Ethernet1
#sudo docker exec -d clab-frr01-router2 config interface ip add Loopback0 10.10.10.101/32
#sudo docker exec -d clab-frr01-router2 config interface startup Loopback0

#sudo docker exec -d clab-frr01-router1 ip route delete default 
#sudo docker exec -d clab-frr01-router2 ip route delete default
