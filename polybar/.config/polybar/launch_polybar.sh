if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload toph &
  done
else
  polybar --reload toph &
fi

# Set brightness permissions when starting the session
sudo chmod g+w /sys/class/backlight/intel_backlight/brightness
sudo chgrp video /sys/class/backlight/intel_backlight/brightness
