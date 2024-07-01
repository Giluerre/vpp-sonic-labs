R1# vppctl
  
create bridge-domain 100 learn 1 forward 1 uu-flood 1 flood 1 arp-term 0
create vxlan tunnel src 10.0.1.1 dst 10.0.1.0 vni 1000  encap-vrf-id 0 decap-next l2
set interface l2 bridge vxlan_tunnel0 100 1
set interface l2 bridge host-eth2 100
set interface l2 bridge tap1 100

R2# vppctl

create bridge-domain 10 learn 1 forward 1 uu-flood 1 flood 1 arp-term 0
create vxlan tunnel src 10.0.1.0 dst 10.0.1.1 vni 1000 encap-vrf-id 0 decap-next l2
set interface l2 bridge vxlan_tunnel0 100 1
set interface l2 bridge host-eth2 100
set interface l2 bridge tap1 100




PC1# ping 168.95.10.1
~                                                                                                                                                                                                                                                  
~                         
