; tpre2.g
; called before tool 2 is selected

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;Move to location
G1 X213.7 Y170 F30000

;Move in
G1 Y200 F25000

;Collect
G1 Y225.9 F2500

;Close Coupler
M98 P"/macros/Coupler - Lock"

M566 X480 Y480 ; Set maximum instantaneous speed changes (mm/min)
M201 X4000 Y4000 ; Set accelerations (mm/s^2)
M220 S120 ;Speed set

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z8 F1000
G90

;Move Out
G1 Y150 F4000
