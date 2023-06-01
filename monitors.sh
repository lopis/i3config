#!/bin/bash

# Sets monitor names
RGX_NAME="([a-zA-Z0-9-]*) .*"
RGX_RES="([0-9]+)x([0-9]+)"

PRIMARY=$(xrandr|grep ' connected primary')
SECONDARY=$(xrandr | grep connected | grep -Ev 'disconnected|primary')

if [[ $PRIMARY =~ $RGX_NAME ]]
then
  INTERNAL_OUTPUT="${BASH_REMATCH[1]}"
  echo internal monitor is $INTERNAL_OUTPUT
fi

if [[ $SECONDARY =~ $RGX_NAME ]]
then
  EXTERNAL_OUTPUT="${BASH_REMATCH[1]}"
  echo external monitor is $EXTERNAL_OUTPUT
fi

if [[ $PRIMARY =~ $RGX_RES ]]
then
  INTERNAL_WIDTH="${BASH_REMATCH[1]}"
  INTERNAL_HEIGHT="${BASH_REMATCH[2]}"
  echo internal monitor is $INTERNAL_WIDTH x $INTERNAL_HEIGHT
else
  echo No match internal
fi

if [[ $SECONDARY =~ $RGX_RES ]]
then
  EXTERNAL_WIDTH="${BASH_REMATCH[1]}"
  EXTERNAL_HEIGHT="${BASH_REMATCH[2]}"
  echo external monitor is $EXTERNAL_WIDTH x $EXTERNAL_HEIGHT
else
  echo No match external
fi

# Position horizontal x vertical
EXTERNAL_POS="0x0"
INTERNAL_POS="0x${EXTERNAL_HEIGHT}"
xrandr --output $EXTERNAL_OUTPUT --auto --pos $EXTERNAL_POS --output $INTERNAL_OUTPUT --auto --pos $INTERNAL_POS

echo arg1 is $1

if [ "$SECONDARY" = "" ]; then
  monitor_mode="internal"
elif [ "$PRIMARY" = "" ]; then
  monitor_mode="external"
fi

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

# EXTERNAL_OUTPUT="DP-1"
# INTERNAL_OUTPUT="eDP-1"

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
nm-applet&