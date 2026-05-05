#!/bin/bash
# ~/toptracker.sh

# Wait for TopTracker process
while ! pgrep -x "TopTracker" > /dev/null; do
    sleep 0.5
done

# Wait for main window after auto-login
sleep 4

max_attempts=20
attempt=0

while [ $attempt -lt $max_attempts ]; do
    wid=$(xdotool search --class "TopTracker" 2>/dev/null | tail -1)
    
    if [ -n "$wid" ]; then
        title=$(xdotool getwindowname "$wid" 2>/dev/null)
        
        if [[ "$title" != *"Login"* ]] && [[ "$title" != *"Sign"* ]]; then
            state=$(xprop -id "$wid" WM_STATE 2>/dev/null | grep "window state" | awk '{print $3}')
            
            if [ "$state" = "Withdrawn" ]; then
                echo "Fixing TopTracker window state..."
                
                # Set to Normal state
                xprop -id "$wid" -f WM_STATE 32c -set WM_STATE 1
                
                # Force the window to unmap and remap so BSPWM sees it fresh
                xdotool windowunmap "$wid"
                sleep 0.2
                xdotool windowmap "$wid"
                sleep 0.3
                
                # Now tell BSPWM about it
                hex_wid=$(printf "0x%x" "$wid")
                bspc node "$hex_wid" --to-desktop focused 2>/dev/null
                
                echo "TopTracker window fixed and remapped!"
                exit 0
            fi
        fi
    fi
    
    attempt=$((attempt + 1))
    sleep 0.5
done

echo "Failed to fix TopTracker window"
exit 1
