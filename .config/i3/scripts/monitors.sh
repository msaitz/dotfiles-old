#!/bin/bash

LEFT_M=DP-1-1
RIGHT_M=DP-1-2
STANDALONE_M=HDMI
INTERNAL_M=eDP-1

function SetSingleMonitor {
  local monitor=$1
  RestartCompton
  xrandr --output $INTERNAL_M --primary --mode 1920x1080 --pos 0x1200 --output $monitor --mode 1920x1200 --pos 0x0
  i3-msg restart
  pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
}

function SetDualMonitors {
  RestartCompton
  xrandr --output eDP-1 --off --output DP-1-1 --mode 1920x1200 --pos 0x0 --rotate normal --output DP-1-2 --mode 1920x1200 --pos 1920x0 --rotate normal
  i3-msg restart
  pactl set-card-profile 0 output:hdmi-stereo+input:analog-stereo
}

function SetInternalMonitorOnly {
  RestartCompton
  xrandr --output $INTERNAL_M --auto --output DP-1 --off --output HDMI-1 --off --output HDMI-2 --off --output DP-1-1 --off --output DP-1-2 --off
  i3-msg restart
  pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
}

function IsMonitorConnected {
  local monitor=$1
  xrandr | grep "$monitor connected"
}

function RestartCompton {
  $HOME/.config/i3/scripts/compton-restart.sh &
}

if IsMonitorConnected $LEFT_M && IsMonitorConnected $RIGHT_M; then
  SetDualMonitors
elif IsMonitorConnected "$STANDALONE_M-2"; then
  SetSingleMonitor "$STANDALONE_M-2"
elif IsMonitorConnected $LEFT_M; then 
  SetSingleMonitor "$LEFT_M"
else
  SetInternalMonitorOnly
fi
