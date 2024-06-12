Satomi's MultiRelay for OpenSim

All the imported MultiRelays I found where broken or partially broken on OpenSim  
So I made a working version! It works on both XEngine and YEngine.  

I provide two versions, one works via http, the other via email.  
The email version only works if your grid supports object2object email.  
Most grids however, don't have email so the http version is the safest option.  



To make the http version work (no email scripts required):  
In OpenSim.ini:  

```
[Network]
;your server's hostname (can be dyndns as well):
ExternalHostNameForLSL = myserver.example.com

;or just your server's ip address:
ExternalHostNameForLSL = 12.34.56.78
```


To make the email version work:
In OpenSim.ini:
```
[Startup]
emailmodule = DefaultEmailModule

[SMTP]
; Enabling this without enableEmailToExternalObjects or enableEmailToSMTP
; will make email work just sim-local between objects:
Enabled = true

; Inter-sim with OpenSim/lickx. Requires IMAP setup, otherwise false for sim-local!:
enableEmailToExternalObjects = false

; Inter-grid with OpenSim/lickx. Requires SMTP setup, otherwise false for sim-local!:
enableEmailToSMTP = false
; If SMTP is configured, you could have lsl.yourgrid.com; otherwise leave as default:
;internal_object_host = lsl.opensim.local
```
