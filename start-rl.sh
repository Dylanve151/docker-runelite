#!/bin/bash
#Launch RuneLite and maximize window

export DISPLAY=:20

java -jar RuneLite.jar

until [[ ! -z "$loadid" ]]
do
        loadid=$(xdotool search --onlyvisible --name Runelite)
        sleep 0.5
done

until [[ ! -z "$windowid" ]] && [[ $windowid != $loadid ]]
do
        windowid=$(xdotool search --onlyvisible --name Runelite)
        sleep 0.5
done

echo "load window id: $loadid"
echo "Window id: $windowid"
echo "Resizing..."

sleep 2

xdotool windowsize $windowid 100% 100%
xdotool windowmove $windowid 0 0
