#!/bin/bash

# Sets device names
IFS=" " read HDMI_OUTPUT_DIRTY con < <(pacmd list-cards | grep output\: | grep "(HDMI)")
ANALOG_OUTPUT="output:analog-stereo"
HDMI_OUTPUT=${HDMI_OUTPUT_DIRTY::-1}

echo HDMI_OUTPUT is $HDMI_OUTPUT
echo ANALOG_OUTPUT is $ANALOG_OUTPUT
echo arg1 is $1

if [ "$(pactl info | grep hdmi)" ]; then
    isHdmi=true
    echo isHdmi=true
else
    isHdmi=false
    echo isHdmi=false
fi

echo is HDMI? $isHdmi

if [ $isHdmi = true ]; then
    pactl set-card-profile 0 $ANALOG_OUTPUT
else
    pactl set-card-profile 0 $HDMI_OUTPUT
fi