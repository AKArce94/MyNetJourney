!!IP telephony or Six Digit Salary.
config t   
no telephony-service
telephony-service
   no auto assign
   no auto-reg-ephone
   max-ephones 5
   max-dn 20
   ip source-address 10.32.100.8 port 2000
   create cnf-files
ephone-dn 1
  number 3211
ephone-dn 2
  number 3222
ephone-dn 3
  number 3233
ephone-dn 4
  number 3244
ephone-dn 5
  number 3255
ephone-dn 6
  number 3266
ephone-dn 7
  number 3277
ephone-dn 8
  number 3288
 ephone-dn 9
   number 3299
ephone-dn 10
 number 3298
Ephone 1
  Mac-address ccd8.c1fb.1045
  type 8945
  button 1:8 2:7 3:6 4:5
  restart
Ephone 2
  Mac-address dca5.f43f.3b7f
  type 8945
  button 1:4 2:3 3:2 4:1
  restart  
end
