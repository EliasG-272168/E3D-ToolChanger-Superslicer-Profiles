; tpre1.g
; called before tool 1 is selected

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to location
G1 X77.5 Y200 F30000

;Move in
G1 Y215 F25000

;Collect
G1 Y227 F2500

;Close Coupler
M98 P"/macros/Coupler - Lock"

M566 X360 Y360 ; Set maximum instantaneous speed changes (mm/min)
M201 X2500 Y2500 ; Set accelerations (mm/s^2)

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z4 F1000
G90

;Move Out
G1 Y150 F4000