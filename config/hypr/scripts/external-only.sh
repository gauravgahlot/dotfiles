#!/bin/bash

hyprctl dispatch dpms on

# set external monitor as the primary display
hyprctl keyword monitor "HDMI-A-1,preferred,auto,auto"

# disable the internal monitor
hyprctl keyword monitor "eDP-1,disable"

