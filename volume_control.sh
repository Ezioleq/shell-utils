#!/bin/bash

amixer set Master $1

CURRENT=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }')

notify-send "Volume change" \
	$CURRENT \
	-h int:value:$CURRENT \
	-h string:x-canonical-private-synchronous:volume

