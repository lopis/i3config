#!/bin/zsh

# Controls webcam brightness

v4l2-ctl --get-ctrl brightness | cut -d ' ' -f2 | read -d '' x
((x = x + $1))
v4l2-ctl --set-ctrl brightness=$x