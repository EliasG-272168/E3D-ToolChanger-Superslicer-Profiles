;Drop Bed
G91
G1 Z3 F1000
G90

M106 S0.0 ;fan off

T-1 ; Drop off the tool

G29 S2 ; Disable Mesh Compensation.

G1 X-20 Y200 F25000 ; Park
M220 S100 ;Speed set

M106 P2 S0.0
M106 P4 S0.0
M106 P6 S0.0
M106 P8 S0.0
G10 P0 R0 S0 ;extruder 0 heater off
G10 P1 R0 S0 ;extruder 1  heater off
G10 P2 R0 S0 ;extruder 2 heater off
G10 P3 R0 S0 ;extruder 3 heater off
M140 S0 ;heated bed heater off
