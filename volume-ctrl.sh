#!/bin/bash
for i in $( seq 0 $1 )
do
    amixer -D pulse sset Master $2 unmute;
    sleep 0.05s
done
