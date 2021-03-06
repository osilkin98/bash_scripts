#!/bin/bash

# this is a script for displaying powerful information regarding
# battery device information, mostly for laptops, however
# other devices running off of power reserves could implement
# this utility as well.
# I'm unsure as to whether or not other *nix derivatives would
# be able to support this exact implementation, if not, I'll
# have to adapt it for that as well. Macintosh does not support
# freedesktop, and most likely has its own power management utility,
# and as such, this script is obsolete on that platform.


# todo: 1. make a --help printout to display possible parameters and usage
#       2. make an installation script which copies this script into a local
#          directory, and creates a symlink from there to one directory in the
#          local user's path variable.


if [ "$1" = "-p" ] || [ "$1" = "--percent" ] || [ "$1" = "--power" ]; then
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage"
elif [ "$1" = "-c" ] || [ "$1" = "--capacity" ]; then
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "capacity"
elif [ "$1" = "-t" ] || [ "$1" = "--time-remaining" ]; then
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "time to empty"
else
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
fi
