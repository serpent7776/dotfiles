#!/bin/sh
xset r rate 250 25
xset m 3 5
xrandr -r 75
dbus-launch
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
dunst &
stalonetray &
copyq &
xcompmgr -ncC &
feh --no-fehbg --bg-center `frand ~/var/wallpapers`
openbox &
yeahconsole &
mrxvt -geometry 120x59-0+0 -o 33 -title 'uxvt' -sb -hb -vb +it -tnum 3 -vt0.e 'top -aw' -vt0.tt 'top' -vt1.e 'sh -c "while true; do sysctl dev.cpu.0.temperature dev.cpu.1.temperature; sleep 5; done"' -vt1.tt 'Temperature' -vt2.e 'tail -F /var/log/messages' -vt2.tt 'messages'
xterm
pkill dbus-daemon
