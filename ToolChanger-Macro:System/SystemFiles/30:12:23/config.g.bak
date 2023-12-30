; Configuration file for Duet WiFi / Ethernet running RRF3 on E3D Tool Changer
; executed by the firmware on start-up

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin
M667 S1 						; Select CoreXY mode	

; Network
M550 P"ToolChanger" 			; Set machine name
;M587 S"ssid" P"password"		; WiFi Settings
;M552 S1 P"ssid"				; Enable WiFi Networking
M552 S1							; Enable Networking
M586 P0 S1 						; Enable HTTP
M586 P1 S0 						; Disable FTP
M586 P2 S0 						; Disable Telnet

; Drive direction
M569 P0 S0 						; Drive 0 X
M569 P1 S0 						; Drive 1 Y
M569 P2 S1 						; Drive 2 Z
M569 P3 S0 						; Drive 3 E0
M569 P4 S0 						; Drive 4 E1
M569 P5 S1 						; Drive 5 E2
M569 P6 S1 						; Drive 6 E3
M569 P7 S0 						; Drive 7 COUPLER
M569 P8 S0 						; Drive 8 UNUSED
M569 P9 S0 						; Drive 9 UNUSED

M584 X0 Y1 Z2 C7 E3:4:5:6									; Apply custom drive mapping
M208 X-35:328.5 Y-49:243 Z0:300 C-45:360	 				; Set axis maxima & minima
M92 X100 Y100 Z800 C91.022 E391.9:391.2:392:472.4			; Set steps per mm assuming x16 microstepping
M350 E16:16:16:16 I1 										; Configure microstepping with interpolation
M350 C16 I10												; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1											; Configure microstepping with interpolation
M566 X480 Y480 Z240 C2 E900:900:1020:900					; Set maximum instantaneous speed changes (mm/min)
M203 X36000 Y36000 Z1200 C7500 E5000:5000:5000:5000			; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z400 C500 E2500:2500:2500:2500				; Set accelerations (mm/s^2)
M906 X1800 Y1800 Z1330 I30   								; Idle motion motors to 30%
M906 E1000:1000:1000:1000 C500 I10     						; Idle extruder motors to 10%

; Endstops
M574 X1 Y1 S3 						; Set X / Y endstop stall detection
M574 C0 Z0  						; No C Z endstop

; Z probe
M558 P8 C"zstop" H3 F360 I0 T20000 	; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X0 Y0 Z0	 				; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40 			; Define mesh grid

; Stall Detection
M915 X Y S3 F0 H400 R4700				; X / Y Axes

; Heaters
M308 S0 P"bedtemp" Y"thermistor" A"Bed" T100000 B4138 C0 		; Set thermistor 
M950 H0 C"bedheat" T0											; Bed heater
M143 H0 S225 													; Set temperature limit for heater 0 to 225C
M140 H0															; Bed heater is heater 0

M308 S1 P"e0temp" Y"pt1000" A"T0" 							 	; Set PT1000 sensor
M950 H1 C"e0heat" T1											; Extruder 0 heater
M143 H1 S510 													; Set temperature limit for heater 1 to 500C

M308 S2 P"e1temp" Y"pt1000" A"T1" 		 						; Set PT1000 sensor
M950 H2 C"e1heat" T2											; Extruder 0 heater
M143 H2 S510 													; Set temperature limit for heater 2 to 500C

M308 S3 P"e2temp" Y"thermistor" A"T2" T100000 B4725 C7.06e-8 	; Set thermistor
M950 H3 C"duex.e2heat" T3										; Extruder 0 heater
M143 H3 S360 													; Set temperature limit for heater 3 to 350C

M308 S4 P"e3temp" Y"pt1000" A"T3" 								; Set PT1000
M950 H4 C"duex.e3heat" T4										; Extruder 0 heater
M143 H4 S510 													; Set temperature limit for heater 4 to 500C


; Tools
M563 P0 S"T0" D0 H1 F2 					; Define tool 0
G10 P0 X0 Y0 Z0 						; Reset tool 0 axis offsets
G10 P0 R0 S0 							; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 F4 					; Define tool 1
G10 P1 X0 Y0 Z0 						; Reset tool 1 axis offsets
G10 P1 R0 S0 							; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 F6 					; Define tool 2
G10 P2 X0 Y0 Z0 						; Reset tool 2 axis offsets
G10 P2 R0 S0 							; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 F8 					; Define tool 3
G10 P3 X0 Y0 Z0 						; Reset tool 3 axis offsets
G10 P3 R0 S0 							; Reset initial tool 3 active and standby temperatures to 0C

; Fans
M950 F1 C"fan1"
M950 F2 C"fan2"
M950 F3 C"duex.fan3"
M950 F4 C"duex.fan4"
M950 F5 C"duex.fan5"
M950 F6 C"duex.fan6"
M950 F7 C"duex.fan7"
M950 F8 C"duex.fan8"

M106 P1 S255 H1 T70				; T0 HE
M106 P2 S0						; T0 PCF
M106 P3 S255 H2 T70 			; T1 HE
M106 P4 S0						; T1 PCF 
M106 P5 S255 H3 T70 			; T2 HE 
M106 P6 S0 						; T2 PCF
M106 P7 S255 H4 T70				; T3 HE
M106 P8 S0						; T3 PCF

; Filament sensors
M591 D0 P7 C"e0stop" S0 ; Extruder 0 L7 R50:250 E3
M591 D1 P7 C"e1stop" S0 ; Extruder 1 L7 R50:250 E3
M591 D2 P7 C"xstop" S0  ; Extruder 2 L7 R10:500 E3
M591 D3 P7 C"ystop" S0  ; Extruder 3 L7 R50:250 E3

; Accelerometer
M955 P0 I25 C"spi.cs6+spi.cs5" 	; Accelerometer all wires connected to temp DB connector, no temperature daughterboard
M593 P"zvddd" F46.6 			; cancel ringing at ZVDDD 46.6Hz original: ZVD at 42.2Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)
;M376 H15						; bed compensation taper

; tool offsets
; !ESTIMATED! offsets for:
; V6-tool: X-9 Y39 Z-5
; Volcano-tool: X-9 Y39 Z-13.5
; Hemera-tool: X20 Y43.5 Z-6

G10 P0 X19.45 Y43.97 Z-5.28 C0.00					; T0
G10 P1 X19.19 Y44.15 Z-5.52 C0.00					; T1
G10 P2 X-8.42 Y38.61 Z-13.36 C0.00					; T2
G10 P3 X13.76 Y51.28 Z-6.22 C0.00					; T3

; PID tune
M307 H0 R0.130 K0.150:0.000 D10.00 E1.35 S1.00 B1			; BANGBANG tune Bed 
M307 H1 R1.266 K0.213:0.197 D7.33 E1.35 S1.00 B0 V21.3	 	; PID tune T0  
M307 H2 R1.161 K0.211:0.160 D7.64 E1.35 S1.00 B0 V21.3		; PID tune T1 
M307 H3 R1.071 K0.221:0.041 D6.33 E1.35 S1.00 B0 V21.3		; PID tune T2
M307 H4 R3.886 K0.463:0.379 D2.58 E1.35 S1.00 B0 V21.3		; PID tune T3

; Pressure advance
M572 D0:1 S0.045 					; pressure advance T0 & T1 DD HEMERA
M572 D2 S0.62 						; pressure advance T2 BWDN HEMERA
M572 D3 S0.053 						; pressure advance T3 OMNIADROP V2.1

M575 P1 S1 B57600					; Enable LCD
M220 S100							; Speed set
G29 S2							    ; disable mesh
T-1								    ; deselect tools
M106 S0 							; fan off

M501                    			; load config-override.g
