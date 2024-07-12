#!/bin/bash

DARK='#130500'
COLOR1='#270d09'
COLOR2='#491d09'
COLOR3='#912900'
COLOR4='#db3e00'
LIGHT='#ffbfa1'

BLANK='00000000'
CLEAR=$LIGHT
DEFAULT=$COLOR4
TEXT=$LIGHT
WRONG=$COLOR4
TYPING=$COLOR2
VERIFYING=$COLOR3
BACKGROUND=$DARK

export LC_ALL=pt_PT.utf8

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
--ring-width=15 \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--color=$BACKGROUND          \
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$TYPING         \
--bshl-color=$TYPING          \
\
--screen 1                   \
--clock                      \
--indicator                  \
--time-str="%H:%M"           \
--date-str="%A, %B %d"       \
# --image=$BACKGROUND