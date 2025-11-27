#!/bin/bash

# Turn on display power
hyprctl dispatch dpms on

# Get all external (non-eDP) monitors
monitors=($(hyprctl monitors -j | jq -r '.[] | select(.name | contains("eDP") | not) | .name'))

# If at least one external monitor exists
if [[ ${#monitors[@]} -ge 1 ]]; then
    # Set the first as normal
    hyprctl keyword monitor "${monitors[0]},preferred,0x0,1,transform,0"
fi

# If a second external monitor exists
if [[ ${#monitors[@]} -ge 2 ]]; then
    # Rotate second by 270° and position it to the right of the first
    hyprctl keyword monitor "${monitors[1]},preferred,1920x0,1,transform,3"
fi

# Disable the laptop's built-in display
hyprctl keyword monitor "eDP-1,disable"

