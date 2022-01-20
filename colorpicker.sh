#!/bin/bash

COLOR=$(grim -g "$(slurp -p -b 00000000)" -t ppm - | convert - txt:- | sed -n '1!p')

SRGB=$(echo $COLOR | cut -d " " -f 2)
HEX=$(echo $COLOR | cut -d " " -f 3)

swaynag -m "sRGB: $SRGB   HEX: $HEX" \
	--background $HEX \
	--button-background $HEX \
	--border $HEX \
	-z "Copy HEX" "wl-copy '${HEX}'" \
	-z "Copy sRGB" "wl-copy '${SRGB}'"

