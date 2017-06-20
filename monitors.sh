#!/bin/bash
EXTERNAL_OUTPUT="DP1"
INTERNAL_OUTPUT="eDP1"

INTERNAL_POS="0x1440"
EXTERNAL_POS="0x0"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

xrandr --output DP1 --auto --pos 0x0 --output eDP1 --auto --pos 320x1440

if [ $monitor_mode = "all" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
else
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --pos $INTERNAL_POS --output $EXTERNAL_OUTPUT --auto --pos $EXTERNAL_POS
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat
