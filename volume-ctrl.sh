#!/bin/bash
for i in $( seq 1 $1 )
do
    amixer -D pulse sset Master $2 unmute;
    pkill -SIGRTMIN+10 i3blocks
    sleep 0.03s
done
