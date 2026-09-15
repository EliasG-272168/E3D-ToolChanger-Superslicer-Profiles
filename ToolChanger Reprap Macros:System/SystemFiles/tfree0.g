; tfree0.g
; called when tool 0 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X-12.7 Y150 F30000
G53 G1 Y200 F30000
G53 G1 Y215 F25000
G53 G1 Y226.2 F5000

;Open Coupler
M98 P"/macros/Coupler - Unlock"
M98 P"/macros/ResetAcceleration"

;fan off
M106 P2 S0

;Move Out
G53 G1 Y175 F30000
