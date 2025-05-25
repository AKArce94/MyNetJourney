CALLMANAGER EXPRESS CONFIGURATION FOR VOIP/TELEPHONY ENGINEERS
!!cisco unified call manager Express command
!@@@CUCM-M
config t
   hostname CUCM-32
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
   Int Fa 0/0
     no shutdown
	 ip add 10.32.100.8 255.255.255.0 
	 end

!!!CUCM ANALOG PHONES CONFIG
configure terminal
dial-peer voice 1 pots
   destination-pattern 3200
   port 0/0/0
dial-peer voice 2 pots
   destination-pattern 3201
   port 0/0/1
dial-peer voice 3 pots
   destination-pattern 3202
   port 0/0/2
dial-peer voice 4 pots
   destination-pattern 3203
   port 0/0/3
end