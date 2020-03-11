#!/usr/bin/env bash

IMAGE=/tmp/i3lock.png
TEXT="locked"
SCRIPTPATH="/home/julien/.config/i3lock"
LOCK=$SCRIPTPATH/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
#RES=$(xrandr --current | grep '*' | uniq | awk '{print $1}')
#This is a bit cheaty
BOXSIZE=$(expr $(echo $RES | cut -d 'x' -f1) / 2)

if [[ $1 != "" ]]; then
    TEXT=$1
fi

if [[ $RES == "1920x2104" ]]; then
    #BOXSIZE=1080
    ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,drawtext=fontfile=$SCRIPTPATH/Digital_tech.otf:text=$TEXT:fontcolor='#ffffffe0':fontsize=40:x=880:y=1300:shadowcolor='#1d1f21d0':shadowx=2:shadowy=2:box=1:boxcolor=#1a1b22@0.4:boxborderw=2104,overlay=700:1400" -vframes 1 $IMAGE -loglevel quiet
else
    ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,drawtext=fontfile=$SCRIPTPATH/Digital_tech.otf:text=$TEXT:fontcolor='#ffffffe0':fontsize=40:x=(w-tw)/2:y=(h/PHI)+th:shadowcolor='#1d1f21d0':shadowx=2:shadowy=2:box=1:boxcolor=#1a1b22@0.4:boxborderw=$BOXSIZE,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $IMAGE -loglevel quiet
fi

i3lock --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c -i $IMAGE -u -c 000000

rm $IMAGE
