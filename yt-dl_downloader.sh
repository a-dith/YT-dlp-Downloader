#!/bin/bash

# Set the shell option to exit immediately if any command exits with a non-zero status
set -e

# Specify the folder name where the downloaded files will be saved
folder_name="/home/e15/Downloads/"

# Regular expression pattern to match YouTube URLs
pattern="^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+"

# Path to the custom Manjaro icon
man_ico="/usr/share/icons/custom/manjaro_128x128.png"

# Path to the custom YouTube-dl icon
yt_ico="/usr/share/icons/custom/yt-dlp.png"

# YouTube format specification for the downloaded video and audio
#yt_format="bestvideo[height<=?1080]+bestaudio[ext=m4a]"
yt_format="bestvideo[height<?1080]+bestaudio[ext=m4a]"

# Output template for the downloaded file
yt_op="$folder_name%(title)s_[%(id)s].%(ext)s"

# Display a notification indicating the start of the Yt-dlp process
notify-send -t 3000 -i $man_ico "Starting Yt-dlp"

# Simulate a right-click using xdotool
xdotool click 3
sleep .1

# Simulate the 'l' key press to select the 'Copy Link Address' option
xdotool key l
sleep .1

# Get the URL from the clipboard using xclip
link="$(xclip -o -selection clipboard)"

# Check if the URL matches the specified YouTube pattern
if [[ $link =~ $pattern ]]; then
    # Get the name of the file to be downloaded using yt-dlp
    urls+=("$link")
else
    # Display a notification if the provided link is not a YouTube link
    notify-send -t 3000 -i $yt_ico "YouTube link not Found."
fi

if [[ ${#urls[@]} -gt 0 ]]; then
    for url in "${urls[@]}"; do
        name=$(yt-dlp --get-title "$url")
        notify-send -t 3000 -i $yt_ico "Downloading File:" "$name"
        yt-dlp -w --no-mtime -f $yt_format -o $yt_op -i "$url"
        notify-send -t 3000 -i $yt_ico "Download Complete:" "$name"
    done
fi
