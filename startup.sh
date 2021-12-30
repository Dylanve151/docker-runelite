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
export DISPLAY=:20
java -jar /root/RuneLite.jar

until [ $(xdotool search --pid $(pidof java) | wc -l) -gt 1 ]
do
	sleep .5
done

for n in $(xdotool search --pid $(pidof java))
do
	xdotool windowsize $n 100% 100%
done

x11vnc -forever -shared -usepw -display :20
