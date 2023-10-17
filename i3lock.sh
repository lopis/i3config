#!/bin/bash

# primary
COLOR1='#171439'
# secondary
COLOR2='#34224f'
# highlight
COLOR3='#8e2277'
COLOR31='#ff248a'
# text
COLOR4='#F8CCE9'

BLANK=$COLOR1
CLEAR=$COLOR4
DEFAULT=$COLOR3
TEXT=$COLOR4
WRONG=$COLOR31
VERIFYING=$COLOR2

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
--color=$COLOR1              \
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--clock                      \
--indicator                  \
--time-str="%H:%M"           \
--date-str="%A, %B %d"       \