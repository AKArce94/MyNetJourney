**static route for network engineer

r4: route 10.1.1.4/30 and 10.1.1.0./30 1sthop: 10.1.1.9
config t 
ip rout 10.1.1.4 255.255.255.252 10.1.1.9 1
ip route 10.1.1.0 255.255.255.252 10.1.1.9 1

@R1
config t 
ip rout 10.1.1.8 255.255.255.252 10.1.1.2 1
ip route 10.1.1.4 255.255.255.252 10.1.1.2 1

@R2
config t 
ip rout 10.1.1.8 255.255.255.252 10.1.1.6 1


@R3
config t 
ip rout 10.1.1.0 255.255.255.252 10.1.1.5 1
