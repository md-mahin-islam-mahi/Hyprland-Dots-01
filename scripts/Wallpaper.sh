#!/bin/bash

wallDIR="$HOME/.config/hypr/Wallpaper"
SCRIPTSDIR="$HOME/.config/hypr/scripts"

PICS=($(find ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}


# Transition config
FPS=60
TYPE="any"
DURATION=2
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"


swww query || swww init && swww img ${RANDOMPICS} $SWWW_PARAMS

sleep 0.5
${SCRIPTSDIR}/pywal.sh
sleep 0.2
${SCRIPTSDIR}/Refresh.sh
