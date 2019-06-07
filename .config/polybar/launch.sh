#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars 
MONITOR="HDMI-2" polybar main_bar -r &
MONITOR="DP-1-1" polybar main_bar -r &
MONITOR="DP-1-2" polybar main_bar -r &
MONITOR="eDP-1" polybar main_bar -r &

echo "Bars launched..."
