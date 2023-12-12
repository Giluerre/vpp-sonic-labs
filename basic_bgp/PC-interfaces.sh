#!/bin/sh
sudo docker exec -d clab-frr01-PC1 ip link set eth1 up
sudo docker exec -d clab-frr01-PC1 ip addr add 192.0.2.2/24 dev eth1
sudo docker exec -d clab-frr01-PC1 ip route add 0.0.0.0/0 via 192.0.2.1 dev eth1
#sudo docker exec -d clab-frr01-PC1 ip route add 10.10.10.0/24 via 192.168.11.1 dev eth1

sudo docker exec -d clab-frr01-PC2 ip link set eth1 up
sudo docker exec -d clab-frr01-PC2 ip addr add 203.0.113.2/24 dev eth1
sudo docker exec -d clab-frr01-PC2 ip route add 0.0.0.0/0 via 203.0.113.1 dev eth1
#sudo docker exec -d clab-frr01-PC2 ip route add 10.10.10.0/24 via 192.168.12.1 dev eth1

