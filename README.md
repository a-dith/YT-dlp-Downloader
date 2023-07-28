# YT-dlp Downloader
This script is intended to key bind the bash file. 
download YouTube videos using the yt-dlp command-line tool. 
It checks if a valid YouTube link is available in the clipboard and downloads the video in the set quality.

The number 1 in picture shows activation area for mouse to extract the URL of the video.  
The Top right in the picture shows the notification
![yt-dlp example](https://github.com/a-dith/YT-dlp-Downloader/blob/main/pics/yt-dl_downloader.jpg "sample")

# Prerequisites

Before using this script, make sure you have the following dependencies installed:
  *  yt-dlp: A command-line program to download videos from YouTube and other sites.![Download](https://github.com/yt-dlp/yt-dlp "yt-dlp")
  *  notify-send: A command-line program to display desktop notifications.
  *  xdotool: A command-line program to simulate keyboard and mouse actions.
  *  xclip: A command-line program to access the clipboard.

## Usage

1. Place the mouse on the YouTube video you want to download.
2. Alternatively copy a YouTube video link to your clipboard.
3. Run the script using the keybinding assigned to the command: `./yt-dl-downloader.sh`
4. The script will check if the clipboard contains a valid YouTube link.
    * If a valid link is found, the script will display a notification and proceed to download the video using yt-dlp.
    * If no valid link is found, a notification will be displayed indicating that a YouTube link was not found.

## Configuration

You can customize the script by modifying the following variables:
* `folder_name`: The directory where the downloaded files will be saved. Update this variable with the desired folder path.
* `pattern`: The regular expression pattern used to match a YouTube link. You can modify this pattern if needed.
* `man_ico`: The path to the Manjaro icon file used for the starting notification. Update this variable with the path to the desired icon file.
* `yt_ico`: The path to the YouTube icon file used for the `yt-dlp` notification. Update this variable with the path to the desired icon file.
* `yt_format`: The video and audio format to be downloaded by yt-dlp. Modify this variable if you want to change the format.
* `yt_op`: The output file format for downloaded videos. Modify this variable to change the format of the saved file.

Notifications

The script uses the notify-send command to display notifications. You can modify the notification icons by updating the paths specified in the man_ico and yt_ico variables.

## Note

* The script uses the notify-send command to display notifications. You can modify the notification icons by updating the paths specified in the man_ico and yt_ico variables.
* The paths specified for the notification icons (/usr/share/icons/custom/manjaro_128x128.png and /usr/share/icons/custom/yt-dlp.png) may vary depending on your system configuration. Make sure to update these paths if necessary.
* Ensure that the script has executable permissions (`chmod +x yt-dl-downloader.sh`) before running it.
* Please make sure you have the necessary dependencies installed and provide the correct paths to the icons used in the notifications.
* The script includes the set -e option, which ensures that the script exits immediately if any command fails. This helps to catch any potential errors during the execution of the script.
