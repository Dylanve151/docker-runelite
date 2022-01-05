#!/bin/bash
#startup script

if [ ! -f "/root/.vnc/passwd" ]; then
    x11vnc -storepasswd $PASSWORD /root/.vnc/passwd
fi

if [ -f "/tmp/.X20-lock" ]; then 
   rm /tmp/.X20-lock -f
fi

websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5900
Xvfb :20 -screen 0 $SCREENSIZE &

./start-rl.sh &

x11vnc -forever -shared -usepw -display :20
