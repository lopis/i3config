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

echo arg1 is $1

# read mode from argument
if [ ! -z "$1" ] ; then
  monitor_mode="$1"

elif [ ! -f "/tmp/monitor_mode.dat" ] ; then
# if we don't have a file, start at zero
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

echo monitor mode is $monitor_mode


# Set screen mode
if [ $monitor_mode = "external" ]; then
  xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
  monitor_mode="internal"
elif [ $monitor_mode = "internal" ]; then
  xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
  monitor_mode="mirror"
elif [ $monitor_mode = "mirror" ]; then
  xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
  monitor_mode="all"
elif [ $monitor_mode = "all" ]; then
  xrandr --output $EXTERNAL_OUTPUT --auto --pos $EXTERNAL_POS --output $INTERNAL_OUTPUT --auto --pos $INTERNAL_POS
  monitor_mode="external"
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat
