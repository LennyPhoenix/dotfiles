#!/usr/bin/env sh

# Depends on:
# - scrot
# - bc
# - imagemagick
# - i3lock

# Abort if screen is already locked
pgrep i3lock
if [[ $? -eq 0 ]] 
then
    exit 0
fi

# Settings
output="/tmp/lockimgbg"
scale_factor=8
blur="8x4"
brightness_threshold=33000
light_icon="$HOME/.local/share/smokescreen/circlelock.png"
dark_icon="$HOME/.local/share/smokescreen/circlelockdark.png"

down_factor=$(echo "scale=2;100/$scale_factor" | bc)
up_factor=$(echo "scale=2;100*$scale_factor" | bc)

scrot --format bmp -f - | convert - -scale "$down_factor%" -blur "$blur" -sample "$up_factor%" "png:$output"

width=$(convert "$light_icon" -format "%w" info:)
height=$(convert "$light_icon" -format "%h" info:)
brightness=$(convert "$output" -gravity center -crop "${width}x${height}+0+0" +repage -colorspace Gray -format "%[mean]" info:)

if (( $(echo "$brightness > $brightness_threshold" | bc -l) ))
then
    icon=$dark_icon
else
    icon=$light_icon
fi

convert "$output" "$icon" -gravity center -composite "$output"

i3lock -i "$output"
