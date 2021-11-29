#!/bin/bash
#startup script

websockify -D --web=/usr/share/novnc/ --cert=/home/root/novnc.pem 6080 localhost:5900
Xvfb :20 -screen 0 1048x504x24
export DISPLAY=:20
java -jar /root/Runelite.jar
unset DISPLAY
x11vnc -forever -shared -usepw -display :20
