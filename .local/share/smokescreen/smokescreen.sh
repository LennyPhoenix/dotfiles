#!/usr/bin/env sh

# Depends on:
# - scrot
# - bc
# - imagemagick
# - i3lock

# Abort if i3lock is already running
pgrep i3lock
if [[ $? -eq 0 ]] 
then
    exit 0
fi

# Settings
output="/tmp/lockimgbg"
scale_factor=6
blur="8x4"
brightness_threshold=34000
light_icon="$HOME/.local/share/smokescreen/circlelock.png"
dark_icon="$HOME/.local/share/smokescreen/circlelockdark.png"

down_factor=$(echo "scale=2;100/$scale_factor" | bc)
up_factor=$(echo "scale=2;100*$scale_factor" | bc)
icon_width=$(convert "$light_icon" -format "%w" info:)
icon_height=$(convert "$light_icon" -format "%h" info:)

scrot --format bmp -of "$output"

brightness=$(convert "$output" -gravity center -crop "${icon_width}x${icon_height}+0+0" +repage -colorspace Gray -format "%[mean]" info:)

if (( $(echo "$brightness > $brightness_threshold" | bc -l) ))
then
    icon=$dark_icon
else
    icon=$light_icon
fi

downscale_command="-sample ${down_factor}%"
blur_command="-blur ${blur}"
upscale_command="-sample ${up_factor}%"
icon_command="${icon} -gravity center -composite"

convert "$output" $downscale_command $blur_command $upscale_command $icon_command "png:$output"

i3lock -i "$output"
