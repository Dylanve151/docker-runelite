#!/bin/bash
#resize window script

export DISPLAY=:20

loadpid=$(xdotool search --pid $(pidof java))

until [[ ! -z "$loadpid" ]]
do
        loadpid=$(xdotool search --pid $(pidof java))
        curpid=$(xdotool search --pid $(pidof java))
done

echo "loadpid: $loadpid"

until [[ $curpid != *$loadpid* ]]
do
        echo "window not loaded"
        sleep .5
        curpid=$(xdotool search --pid $(pidof java))
done

for n in $(xdotool search --pid $(pidof java))
do
        sleep 2
        echo "window loaded. resizing"
        xdotool windowsize $n 100% 100%
done
