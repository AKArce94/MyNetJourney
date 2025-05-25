!!CREATING AND PLACING PORTS INSIDEAVLAN:
( LINE 103 to 141 PASTE TO COREBABA SWITCH )
config t
vlan 10
   name WIFIVLAN
vlan 32
    name AARCE
vlan 50
   name IPCCTVLAN
vlan 69
   name UPPERMGMT
vlan 70
    name ACCOUNTING
vlan 71\
    name HR
vlan 100
   name VOICEVLAN
Int Fa 0/2
  switchport mode access
  switchport access vlan 10  
Int Fa 0/4
  switchport mode access
  switchport access vlan 10
Int Fa 0/6
  switchport mode access
  switchport access vlan 50  
Int Fa 0/8
  switchport mode access
  switchport access vlan 50    
Int Fa 0/3
  switchport mode access
  switchport access vlan 100     
Int Fa 0/5
  switchport mode access  
  switchport voice vlan 100
  mls qos trust device cisco-phone 
  switchport access vlan 1
Int Fa 0/7
  switchport mode access
  switchport voice vlan 100 
  mls qos trust device cisco-phone 
 switchport access vlan 1
 end