config t
ip routing
ip dhcp pool CAMERA6
host 10.32.50.6 255.255.255.0
client-identifier 001a.0709.c25f 
ip dhcp pool CAMERA8
host 10.32.50.8 255.255.255.0
client-identifier 001a.070b.471d
end
show ip dhcp binding