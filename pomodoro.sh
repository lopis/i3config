#!/bin/bash

set_time () {
    echo $1 > /tmp/termdown.tmp
    echo $1 >> /tmp/termdown.tmp
    echo $2 >> /tmp/termdown.tmp
}

time=$((45 * 60))

while ((time > 0))
do
    echo $time
    minutes=time/60
    seconds=time%60
    set_time "  $(seq -f "%02g" $((minutes)) $((minutes))):$(seq -f "%02g" $((seconds)) $((seconds)))" ""
    sleep 1
    time=$((time-1))
done

set_time "  Take a break" "#50ce00"
paplay /usr/share/sounds/freedesktop/stereo/bell.oga