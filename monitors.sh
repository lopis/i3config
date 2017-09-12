#!/bin/bash

# Sets monitor names
IFS=" " read INTERNAL con < <(xrandr|grep " connected primary")
IFS=" " read EXTERNAL con < <(xrandr|awk  "/ connected/ && !/ primary/")
INTERNAL_OUTPUT="eDP-1"
EXTERNAL_OUTPUT="DP-1"
echo internal monitor is $INTERNAL_OUTPUT
echo external monitor is $EXTERNAL_OUTPUT

# Position horizontal x vertical
INTERNAL_POS="0x0"
EXTERNAL_POS="-320x-1440"
# xrandr --output $EXTERNAL_OUTPUT --auto --pos $EXTERNAL_POS --output $INTERNAL_OUTPUT --auto --pos $INTERNAL_POS


# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

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
  xrandr --output $EXTERNAL_OUTPUT --auto --pos $EXTERNAL_POS --output $INTERNAL_OUTPUT --auto --pos $INTERNAL_POS
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat
