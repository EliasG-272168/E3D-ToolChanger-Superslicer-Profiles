; tfree1.g
; called when tool 1 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X77.5 Y150 F30000
G53 G1 Y200 F30000
G53 G1 Y215 F25000
G53 G1 Y227 F5000

;Open Coupler
M98 P"/macros/Coupler - Unlock"
M98 P"/macros/ResetAcceleration"

;fan off
M106 P4 S0

;Move Out
G53 G1 Y175 F30000
