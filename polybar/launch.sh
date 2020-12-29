#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top -c ~/.config/polybar/config-top.ini &
polybar bottom -c ~/.config/polybar/config-bottom.ini &

# # apply primary polybar
# for m in $(polybar -m | grep primary | cut -d":" -f1); do
#     MONITOR=$m polybar top -c ~/.config/polybar/config-top.ini &
#     MONITOR=$m polybar bottom -c ~/.config/polybar/config-bottom.ini &
#   echo $MONITOR
# done

# # apply secondary polybar only to non-primary monitors
# for m in $(polybar -m | grep -v primary | cut -d":" -f1); do
#   MONITOR=$m polybar top -c ~/.config/polybar/config-top-secondary.ini &
#   echo $MONITOR
# done

