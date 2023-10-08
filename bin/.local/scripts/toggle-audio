#!/bin/sh
default_device="$(pactl get-default-sink)"

new_device="hdmi"
case "$default_device" in
    *hdmi*) new_device="pro" ;;
    *) echo "leaving as hdmi" ;;
esac

new_sink="$(pactl list sinks short | grep -i $new_device | awk '{print $2}')"

pactl set-default-sink $new_sink
