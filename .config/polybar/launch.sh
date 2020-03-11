#!/usr/bin/env sh

killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Monitor 1
DISPLAY1="$(xrandr -q | grep 'eDP1' | cut -d ' ' -f1)"
[[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar -r -c ~/.config/polybar/config main &

# Monitor 2
DISPLAY2="$(xrandr -q | grep 'HDMI2' | cut -d ' ' -f1)"
[[ ! -z "$DISPLAY2" ]] && MONITOR="$DISPLAY2" polybar -r -c ~/.config/polybar/config second &

echo "Bar launched..."
