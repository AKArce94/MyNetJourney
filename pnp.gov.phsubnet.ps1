config t
vlan 23
 name PNP.GOV.PH
 exit
Int vlan 23
 no shut
 ip add 10.0.1.1 255.255.255.0
 ip ospf 1 area 0
ip dhcp excluded-add 10.0.1.1 10.0.1.100
ip dhcp pool PNP.GOV.PH
 network 10.0.1.0 255.255.255.0
 default-router 10.0.1.1
 domain-name PNP.GOV.PH
 dns-server 10.1.1.10
 option 150 ip 10.1.100.8
 Int Fa 0/7
  swi Voice vlan 23
  do sh ip dhcp binding