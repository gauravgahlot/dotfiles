#!/bin/bash

hyprctl dispatch dpms on

# set external monitor as the primary display
# hyprctl keyword monitor "HDMI-A-1, preferred, 0x0, auto"

# set internal monitor as the extended display
hyprctl keyword monitor "eDP-1, preferred, auto, auto"

