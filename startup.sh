#!/bin/bash
#startup script

DISP=${DISPLAY:1}

if [ ! -f "/root/.vnc/passwd" ]; then
    x11vnc -storepasswd $PASSWORD /root/.vnc/passwd
fi

if [ -f "/tmp/.X$DISP-lock" ]; then 
   rm /tmp/.X$DISP-lock -f
fi

websockify -D --web=/usr/share/novnc/ --cert=/root/novnc.pem 6080 localhost:5900
Xvfb $DISPLAY -screen 0 $SCREENSIZE &

#need some time to statup the virtual screen
sleep 1s

./start-rl.sh &

x11vnc -forever -shared -usepw -display $DISPLAY
