#!/bin/sh

program_name=$1
desktop_number=$2

target_desktop_id=$(bspc query -D -d "^$desktop_number")
pid_path="/tmp/program_freezing/$program_name.pid"

mkdir -p /tmp/program_freezing/

cleanup() {
    if [ -f "$pid_path" ]; then
        PID=$(cat "$pid_path")
        kill -CONT $PID 2>/dev/null
        rm "$pid_path"
    fi
}
trap cleanup EXIT INT TERM

$program_name &
PID=$!
echo "Launched $program_name with PID $PID"

echo "Pausing..."
kill -STOP $PID
echo $PID > "$pid_path"
echo "Stored PID in $pid_path"

bspc subscribe desktop_focus | while read -r event monitor desktop_id; do
    if [ -f "$pid_path" ]; then
        PID=$(cat "$pid_path")
        
        if ! kill -0 $PID 2>/dev/null; then
            echo "PID no longer valid, deleting $pid_path and exiting..."
            rm "$pid_path"
            exit 0
        fi
        
        echo "Current desktop: $desktop_id, target: $target_desktop_id"
        if [ "$desktop_id" = "$target_desktop_id" ]; then
            echo "Continuing $PID"
            kill -CONT $PID
        else
            echo "Freezing $PID"
            kill -STOP $PID
        fi
    fi
done
