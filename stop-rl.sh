#!/bin/bash
#closes RuneLite

export DISPLAY=:20

windowid=$(xdotool search --onlyvisible --name Runelite)

echo "Window id: $windowid"
echo "closing..."

xdotool windowclose $windowid
