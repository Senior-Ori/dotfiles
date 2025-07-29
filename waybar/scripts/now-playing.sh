#!/bin/bash

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

if [ -n "$title" ]; then
    if [ -n "$artist" ]; then
        echo "$artist - $title"
    else
        echo "$title"
    fi
else
    echo ""
fi
