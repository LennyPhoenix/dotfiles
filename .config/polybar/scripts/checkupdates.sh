#!/bin/sh

updates=$(yay -Qu | wc -l)
success=$?

if [ ! $success -eq 0 ] || [ -z "$updates" ]
then
  updates=0
fi

echo "%{T1}󰏔%{T-} %{T2}$updates%{T-}"
