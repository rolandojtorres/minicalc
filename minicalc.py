import tkinter as tk
w=tk.Tk()
code='''
proc tmsg {{txt ""} {ty "ok"} {img "info"}} {return [tk_messageBox -message $txt -type $ty -icon $img]}
set about "© Rolandojtorres@gmail.com\nLicencia CC BY-NC-SA"
catch {destroy .c}
toplevel .c -bg #AAA
wm geometry .c "400x300+00+00"
wm withdraw .
wm title .c $about
set c 0;set col "#AAA"
place [entry .c.ev -textvar evl -font "arial 20" -width 28 -font "arial 14"] -x 50 -y 50
foreach {t tc} "0 n 1 n 2 n 3 n 4 n 5 n 6 n 7 n 8 n 9 n . n pi o + o - o x o / o % o ^ o C r M r = r © o" {
if {$tc=="n"} {set col "#FAA"}
if {$tc=="o"} {set col "#FFA"}
if {$tc=="r"} {set col "#AFA"}
place [button .c.b$c -text $t -font "arial 14 bold" -bg $col -command "append evl [set t]"] -x [expr 50+($c/3)*40] -y [expr (($c%3)*50)+90] -width 40 -height 50
incr c}
.c.b11 config -command {set evl [expr 4*atan(1)]}
.c.b18 config -command {set evl ""}
.c.b20 config -command {set evl [expr [string map "{M} {\ } {\/} {*1.0/} {x} {*} {^} {**}" $evl]]}
.c.b21 config -command {tmsg $about}
'''
w.eval(code)
w.mainloop()
