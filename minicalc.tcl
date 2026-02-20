proc tmsg {{txt ""}} {return [tk_messageBox -message $txt]}
catch {destroy .k}
toplevel .k -bg #AAA
wm geometry .k "350x350+0+0"
wm withdraw .
set about "© Rolandojtorres@gmail.com\nLicencia CC BY-NC-SA"
set c 0
set col "#AAA"
place [entry .k.ev -textvar evl -width 29] -x 50 -y 50
foreach {t tc} "0 n 1 n 2 n 3 n 4 n 5 n 6 n 7 n 8 n 9 n . n pi o + o - o x o / o % o ^ o C r \( r = r \) r © r" {
if {$tc=="n"} {set col "#FAA"}
if {$tc=="o"} {set col "#FFA"}
if {$tc=="r"} {set col "#AFA"}
place [button .k.b$c -text $t -bg $col -command "append evl [set t]"] -x [expr 50+($c/3)*30] -y [expr (($c%3)*40)+90] -width 30
incr c
}
.k.b11 config -command {set evl [expr 4*atan(1)]}
.k.b18 config -command {set evl ""}
.k.b20 config -command {set evl [expr [string map "{M} {\ } {\/} {*1.0/} {x} {*} {^} {**}" $evl]]}
.k.b22 config -command {tmsg $about}
