#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch polybar monitor internal
polybar left -c ~/.config/polybar/config.ini &
polybar center -c ~/.config/polybar/config.ini &
polybar right -c ~/.config/polybar/config.ini &

## Launch polybar monitor external
if [ $(xrandr -q | grep "HDMI-1 connected" | cut -d ' ' -f1) = "HDMI-1" ]; then
	polybar leftExternal -c ~/.config/polybar/config.ini &
	polybar centerExternal -c ~/.config/polybar/config.ini &
	polybar rightExternal -c ~/.config/polybar/config.ini &
fi


