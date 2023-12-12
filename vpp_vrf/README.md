config vrf add Vrf-red
config vrf add Vrf-blue
config vrf add Vrf-black
config interface vrf bind Ethernet0 Vrf-blue
config interface vrf bind Ethernet3 Vrf-blue
config interface vrf bind Ethernet1 Vrf-red
config interface vrf bind Ethernet4 Vrf-red
config interface vrf bind Ethernet2 Vrf-black
config interface vrf bind Ethernet5 Vrf-black

config interface ip add Ethernet0 192.168.1.1
config interface ip add Ethernet1 192.168.1.1
config interface ip add Ethernet2 192.168.1.1
config interface ip add Ethernet3 192.168.2.1
config interface ip add Ethernet4 192.168.2.1
config interface ip add Ethernet5 192.168.2.1

