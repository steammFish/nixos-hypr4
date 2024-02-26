#!/usr/bin/env bash

DOWNLOAD_DIR=/home/ck/.cache/qq/
APPIMAGE_PATH="$DOWNLOAD_DIR/linuxqq.AppImage"
DOWNLOAD_URL=https://dldir1.qq.com/qqfile/qq/QQNT/852276c1/linuxqq_3.2.5-21453_x86_64.AppImage


# Function to show notification
show_notification() {
    notify-send -u normal -i "$DOWNLOAD_DIR/tencent-qq.png" "Linux QQ" "$1"
}

# Function to show echo message
show_message() {
    echo "Linux QQ: $1"
}

# Function to download AppImage
download_appimage() {
    show_notification "Downloading Linux QQ AppImage..."
    show_message "Downloading Linux QQ AppImage..."
    mkdir -p "$DOWNLOAD_DIR"  # Create the directory if it doesn't exist
    wget -P "$DOWNLOAD_DIR" -O "$APPIMAGE_PATH" "$DOWNLOAD_URL"
    chmod +x "$APPIMAGE_PATH"
    show_notification "Download complete."
    show_message "Download complete."
}

# Function to run AppImage
run_appimage() {
    show_notification "Launching Linux QQ..."
    show_message "Launching Linux QQ..."
    appimage-run "$APPIMAGE_PATH"
}

# Check if the AppImage file exists
if [ ! -f "$APPIMAGE_PATH" ]; then
    download_appimage
fi

run_appimage

