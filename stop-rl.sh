#!/bin/bash
#closes RuneLite

windowid=$(xdotool search --onlyvisible --name Runelite)

echo "Window id: $windowid"
echo "closing..."

xdotool windowclose $windowid
