catch {destroy .c}
toplevel .c -bg #AAA
wm geometry .c "350x350+0+0"
wm withdraw .
set c 0
set col "#AAA"
place [entry .c.ev -textvar evl -width 20] -x 50 -y 50
foreach {t tc} "0 n 1 n 2 n 3 n 4 n 5 n 6 n 7 n 8 n 9 n . n pi o + o - o x o / o % o ^ o C r \( r = r \) r B r" {
if {$tc=="n"} {set col "#FAA"}
if {$tc=="o"} {set col "#FFA"}
if {$tc=="r"} {set col "#AFA"}
place [button .c.b$c -text $t -bg $col -command "append evl [set t]"] -x [expr 50+($c/3)*30] -y [expr (($c%3)*50)+90] -width 30
incr c
}
.c.b11 config -command {set evl [expr 4*atan(1)]}
.c.b18 config -command {set evl ""}
.c.b20 config -command {set evl [expr [string map "{M} {\ } {\/} {*1.0/} {x} {*} {^} {**}" $evl]]}
.c.b22 config -command {set evl [string range $evl 0 end-1]}
