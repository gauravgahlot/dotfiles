#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch mainbar-i3
echo "---" | tee -a /tmp/mainbar-i3.log
polybar mainbar-i3 2>&1 | tee -a /tmp/mainbar-i3.log & disown

echo "Bars launched..."
