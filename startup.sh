#!/bin/bash
#startup script

if [ ! -f "/root/.vnc/passwd" ]; then
    x11vnc -storepasswd $PASSWORD /root/.vnc/passwd
fi
websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5900
Xvfb :20 -screen 0 $SCREENSIZE &
export DISPLAY=:20
java -jar /root/RuneLite.jar
unset DISPLAY
x11vnc -forever -shared -usepw -display :20
