#!/bin/bash
#startup script

websockify -D --web=/usr/share/novnc/ --cert=/home/debian/novnc.pem 6080 localhost:5900
x11vnc -forever -shared -usepw -create
