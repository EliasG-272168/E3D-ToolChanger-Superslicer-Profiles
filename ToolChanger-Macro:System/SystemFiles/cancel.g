; purge tool
;M98 P"purge.g"

M106 S0 ;fan off

; park tool
T-1

M591 D0 ; Filament Sensor T0
M591 D1 ; Filament Sensor T1
M591 D2 ; Filament Sensor T2
M591 D3 ; Filament Sensor T3

G10 P0 R0 ;extruder 0 heater off
G10 P1 R0 ;extruder 1  heater off
G10 P2 R0 ;extruder 2 heater off
G10 P3  R0 ;extruder 3 heater off
M140 S0 ;heated bed heater off
