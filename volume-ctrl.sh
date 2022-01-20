#!/bin/bash
for (( i = 1; i <= $1; i++ ))
do
    amixer -D pulse sset Master $2 unmute
    sleep 0.05s
done
