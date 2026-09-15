; /sys/adaptive_mesh.g
; Logic: Ensures mesh covers the print + the 60mm purge line + optional Wipe Tower
; Fixed for RRF 3.5 Array Syntax to avoid M557 errors

if !(exists(param.X) && exists(param.Y) && exists(param.Z) && exists(param.A))
    abort "adaptive_mesh.g expects X,Y,Z,A"

; --- Configuration ---
var xpad = 10
var bedMinX = 0
var bedMaxX = 300
var bedMinY = 0
var bedMaxY = 200

; --- Calculate Initial Print Bounds (ensure integers) ---
var xmin = floor(max(var.bedMinX, param.X - var.xpad))
var xmax = ceil(min(var.bedMaxX, param.Z + var.xpad))

; --- Calculate Y Bounds ---
var ymin = floor(max(var.bedMinY, param.Y - 5)) 
var purgeTop = floor(param.Y + 62)
var ymax = ceil(max(param.A, var.purgeTop))

; --- Dynamic Check for Wipe Tower Parameters ---
if exists(param.U) && exists(param.V) && exists(param.W)
    ; param.U = wipe_tower_x (center point)
    ; param.V = wipe_tower_y (center point)
    ; param.W = wipe_tower_width
    
    var wt_xmin = floor(param.U - (param.W / 2) - var.xpad)
    var wt_xmax = ceil(param.U + (param.W / 2) + var.xpad)
    
    ; A safe 30mm footprint radius around the tower center to account for purge scaling
    var wt_ymin = floor(param.V - 30 - var.xpad)
    var wt_ymax = ceil(param.V + 30 + var.xpad)
    
    ; Compare print bounds with wipe tower bounds and keep the absolute outer limits
    set var.xmin = min(var.xmin, var.wt_xmin)
    set var.xmax = max(var.xmax, var.wt_xmax)
    set var.ymin = min(var.ymin, var.wt_ymin)
    set var.ymax = max(var.ymax, var.wt_ymax)

; --- Clamp Final Combined Bounds to Physical Bed Limits ---
set var.xmin = max(var.bedMinX, var.xmin)
set var.xmax = min(var.bedMaxX, var.xmax)
set var.ymin = max(var.bedMinY, var.ymin)
set var.ymax = min(var.bedMaxY, var.ymax)

; --- Mesh Density (Calculated after calculating final boundaries) ---
var spanX = var.xmax - var.xmin
var spanY = var.ymax - var.ymin

var pX = floor(max(4, min(8, var.spanX / 25)))
var pY = floor(max(4, min(8, var.spanY / 25)))

echo "Mesh Area: X", var.xmin, ":", var.xmax, " Y", var.ymin, ":", var.ymax, " P", var.pX, ":", var.pY

; --- Execute ---
G29 S2 ; Clear

; Use Array Syntax {min, max} instead of {min}:{max} for RRF 3.5 stability
M557 X{var.xmin, var.xmax} Y{var.ymin, var.ymax} P{var.pX, var.pY}

G29 S0 ; Probe

; Restore safe default for manual use
M557 X10:290 Y20:180 P8:5