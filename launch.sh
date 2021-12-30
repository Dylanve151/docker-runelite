#!/bin/bash
#Launch RuneLite and maximize window

export DISPLAY=:20

java -jar RuneLite.jar

loadpid=$(xdotool search --pid $(pidof java))

until [[ ! -z "$loadpid" ]]
do
        loadpid=$(xdotool search --pid $(pidof java))
        curpid=$(xdotool search --pid $(pidof java))
done

echo "load window id: $loadpid"

until [[ $curpid != *$loadpid* ]]
do
        echo "Window not loaded"
        sleep .5
        curpid=$(xdotool search --pid $(pidof java))
done

echo "Window loaded. Resizing..."
sleep 2

for n in $(xdotool search --pid $(pidof java))
do
        xdotool windowsize $n 100% 100%
        xdotool windowmove $n 0 0
done
