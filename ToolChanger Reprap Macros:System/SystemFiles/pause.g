G91 					; use relative positioning
G1 H2 Z5 F5000			; lift Z 5mm
G90 					; back to absolute positioning

if tools[2].state = "active"
	G1 X210 Y175 F50000		; move out the way.
elif tools[3].state = "active"
	G1 X210 Y175 F50000		; move out the way.
else
	G1 X20 Y175 F50000		; move out the way.
