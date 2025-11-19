#!/bin/bash

hyprctl dispatch dpms on

# set internal monitor as the primary display
hyprctl keyword monitor ",preferred,auto,auto"

# disable the external monitor
hyprctl keyword monitor "HDMI-A-1,disable"

