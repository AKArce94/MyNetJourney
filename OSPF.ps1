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

@CUCM:
config t
router ospf 1
router-id 10.32.100.8
network 10.32.100.0  0.0.0.255  area 0
end