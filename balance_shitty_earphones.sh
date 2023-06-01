#!/bin/bash

# Changes the audio balance in the bluetooth device
# to compensate for malfuncitoning earphones.

# This like extracts the device ID from the list of audio sinks
pactl list short sinks |grep blue|IFS="     " read -r id string

# This one sets the volume in the left/right channel to 100%/50%
pactl set-sink-volume "$id" 100% 50%
