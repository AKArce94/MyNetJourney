@@@@@@@@@IVRS: interActive Voice Response System: maticSagot

config t
dial-peer voice 69 voip
 service rivanaa out-bound
 destination-pattern 3269
 session target ipv4:10.32.100.8
 incoming called-number 3269
 dtmf-relay h245-alphanumeric
 codec g711ulaw
 no vad
!
telephony-service
 moh "flash:/en_bacd_music_on_hold.au"
!
application
 service rivanaa flash:app-b-acd-aa-3.0.0.2.tcl
  paramspace english index 1        
  param number-of-hunt-grps 2
  param dial-by-extension-option 8
  param handoff-string rivanaa
  param welcome-prompt flash:en_bacd_welcome.au
  paramspace english language en
  param call-retry-timer 15
  param service-name rivanqueue
  paramspace english location flash:
  param second-greeting-time 60
  param max-time-vm-retry 2
  param voice-mail 1234
  param max-time-call-retry 700
  param aa-pilot 3269
 service rivanqueue flash:app-b-acd-3.0.0.2.tcl
  param queue-len 15
  param aa-hunt1 3200
  param aa-hunt2 3277
  param aa-hunt3 3201
  param aa-hunt4 3233
  param queue-manager-debugs 1
  param number-of-hunt-grps 4









  HOW TO FIX THE SHYT
config t
 application
  no service callqueue flash:app-b-acd-2.1.2.2.tcl
  no service rivanaa flash:app-b-acd-aa-2.1.2.2.tcl
!!!THEN PASTE ALL IVR COMMANDS AGAIN