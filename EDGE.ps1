config t
   hostname EDGE-32
   enable secret pass
   service password-encryption
   no logging console
   no ip domain-lookup
   line console 0
     password pass
     login
     exec-timeout 0 0
    line vty 0 14
      password pass
      login
      exec-timeout 0 0
   Int Gi 0/0/0
     description FIBEROPTIC-TO-SWITCH
     ip add 10.32.32.1 255.255.255.0
	 no shutdown
   Int Gi 0/0/1
     description PLDT-ME-WAN
	 ip add 200.0.0.32 255.255.255.0
	 no shutdown
   Int Loopback 0
     description VIRTUALIP-FOR-ROUTING
	 ip add 32.0.0.1 255.255.255.255
 end



!!!STATIC ROUTING FOR MININUM WAGERS: 645php/day
 !!! EDGE route NOT dikit to ClassMate:
conf t
 ip routing 
 ip route 10.11.0.0 255.255.0.0 200.0.0.11
 NO ip route 10.32.0.0 255.255.0.0 200.0.0.32
 ip route 10.12.0.0 255.255.0.0 200.0.0.12
 ip route 10.21.0.0 255.255.0.0 200.0.0.21
 ip route 10.22.0.0 255.255.0.0 200.0.0.22
 ip route 10.31.0.0 255.255.0.0 200.0.0.31
 ip route 10.32.0.0 255.255.0.0 200.0.0.32
 ip route 10.41.0.0 255.255.0.0 200.0.0.41
 ip route 10.42.0.0 255.255.0.0 200.0.0.42
 ip route 10.51.0.0 255.255.0.0 200.0.0.51
 ip route 10.52.0.0 255.255.0.0 200.0.0.52
 ip route 10.61.0.0 255.255.0.0 200.0.0.61
 ip route 10.62.0.0 255.255.0.0 200.0.0.62
 ip route 10.71.0.0 255.255.0.0 200.0.0.71
 ip route 10.72.0.0 255.255.0.0 200.0.0.72
 ip route 10.81.0.0 255.255.0.0 200.0.0.81
 ip route 10.82.0.0 255.255.0.0 200.0.0.82
 ip route 10.32.0.0 255.255.0.0 10.32.32.4
 end
 
*********************************************
Layer three/3 switch ROUTING = 300k up!!!
@SWITCH/COREBABA
!SI SWITCH ASA/DIKIT KAY EDGE PARA MAKALABAS
conf t 
ip routing
ip route 0.0.0.0 0.0.0.0 10.32.32.1
end

@CUCM:DEFAULT ROUTING( 0.0.0.0 0.0.0.0) FOR CUCM:
!SI CUCM ASA/DIKIT KAY SWITCH VLAN 100 PARA MAKALABAS
conf t
ip routing
ip route 0.0.0.0 0.0.0.0 10.32.100.4
end

!How to Static Route windows Server:
cmd
route  add   10.0.0.0   mask   255.0.0.0    10.32.1.4
route  add  200.0.0.0   mask  255.255.255.0   10.32.1.4

OPEN SHORTEST PATH FIRST/OSPF CONFIG.
@EDGE:
siib: sh ip int brief
sirc: sh ip route connected
@EDGE:
config t
router ospf 1
router-id 32.0.0.1
network 200.0.0.0  0.0.0.255 area 0
network 10.32.32.0  0.0.0.255 area 0
network 32.0.0.1  0.0.0.0 area 0
Interface gi 0/0/0
 ip ospf network point-to-point
end

@CoreBABA:
config t
router ospf 1
router-id 10.32.32.4
network 10.32.0.0  0.0.255.255 area 0
int gi 0/1
 ip ospf network point-to-point
end
ping
@CUCM:
config t
router ospf 1
router-id 10.32.100.8
network 10.32.100.0  0.0.0.255  area 0
end