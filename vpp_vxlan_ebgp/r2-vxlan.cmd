sudo config vlan add 100
config vlan member add -u 100 Ethernet1
sudo config vxlan add vtep 10.10.10.101
sudo config vxlan evpn_nvo add nvo vtep
sudo config vxlan map add vtep 100 1000
