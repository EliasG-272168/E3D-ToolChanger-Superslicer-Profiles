; tfree2.g
; called when tool 2 is freed

M220 S100 ;Set speed

;Drop the bed
G91
G1 Z8 F1000
G90

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X213.7 Y150 F30000
G53 G1 Y170 F30000
G53 G1 Y200 F25000
G53 G1 Y225.9 F5000

;Open Coupler
M98 P"/macros/Coupler - Unlock"
M98 P"/macros/ResetAcceleration"

;fan off
M106 P6 S0

;Move Out
G53 G1 Y175 F30000
