#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "$#"
    exit
fi

if [ $1 -eq 1 ]; then
    xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
else
    count=`ps ax | grep vim| wc -l`
    echo "$count"
    if [ $count -le 3 ]; then
        xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
    fi
fi
