#!/bin/sh

updates=$(checkupdates 2> /dev/null)
success=$?

if [ ! $success -eq 0 ] || [ -z "$updates" ]
then
  count=0
else
  printf '%s\n' "$updates" > /tmp/bspwm-eos-polybar-updates
  count=$(wc -l "/tmp/bspwm-eos-polybar-updates" | awk '{print $1}')
fi

echo "%{T1}%{T-} %{T2}$count%{T-}"
