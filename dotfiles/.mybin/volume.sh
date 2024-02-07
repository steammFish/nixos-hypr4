#!/usr/bin/env bash

NOTIFICATION_ID=9999

# 检查参数数量
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <increase|decrease|mute>"
    exit 1
fi

# 调节声音
case $1 in
    increase)
        pamixer --increase 5 --allow-boost
        new_volume=$(pamixer --get-volume)
        notify-send "Volume Increased" "Current volume: $new_volume%" -r $NOTIFICATION_ID
        ;;
    decrease)
        pamixer --decrease 5 --allow-boost
        new_volume=$(pamixer --get-volume)
        notify-send "Volume Decreased" "Current volume: $new_volume%" -r $NOTIFICATION_ID
        ;;
    mute)
        pamixer --toggle-mute
        is_muted=$(pamixer --get-mute)
        if [ "$is_muted" = "true" ]; then
            notify-send "Volume Muted" "The sound has been muted." -r $NOTIFICATION_ID
        else
            notify-send "Volume Unmuted" "The sound has been unmuted." -r $NOTIFICATION_ID
        fi
        ;;
    *)
        echo "Invalid argument: $1"
        echo "Usage: $0 <increase|decrease|mute>"
        exit 1
        ;;
esac

