#!/bin/bash

# -----------------------------------------------------------------------------
# Info:
#  author:    N-Cen-Dainamix
#  file:      install.sh
#  created:   16/10/2019
#  version:   1.3.0 [for Termux Android]
# -----------------------------------------------------------------------------
# Requirements:
#  Perl, Python, cURL, ffmpeg, youtube-dl
# Description:
#  Youtube Automatic Converter Downloader for Termux
# -----------------------------------------------------------------------------

clear
echo "+++ Youtube Automatic Converter Downloader +++"
sleep 3;
echo "+++ Setup SDcard +++"
sleep 2;
termux-setup-storage
sleep 8;
echo "+++ Setup Directory +++"
echo "+++ Creates a Download Directory on: storage/dcim/DM-Termux";
sleep 2;
mkdir /data/data/com.termux/files/home/storage/dcim/DM-Termux
echo "+++ Install Python +++"
sleep 2;
pkg install python -y
echo "+++ Install Perl (For Youtube Automatic Converter Downloader ) +++"
sleep 2;
pkg install perl -y
echo "+++ Install cURL +++"
sleep 2;
pkg install curl -y
echo "+++ Install ffmpeg (For Audio Conversion) +++"
sleep 2;
pkg install ffmpeg -y
echo "+++ Downloading Youtube-dl +++"
curl -s -L https://yt-dl.org/downloads/latest/youtube-dl -o /data/data/com.termux/files/usr/bin/youtube-dl
echo "+++ Youtube-dl Downloaded Successfully +++"
sleep 2;
echo "+++ Set Permission to Execute the Script +++"
sleep 2;
chmod a+rx /data/data/com.termux/files/usr/bin/youtube-dl
echo "+++ Permission Granted +++"
sleep 2;
echo "+++ Setup Startup +++"
sleep 2;
cd ..
cp /data/data/com.termux/files/home/Youtube-dl/yt-downloader.pl /data/data/com.termux/files/home/storage/dcim/DM-Termux
echo clear >> ../usr/etc/bash.bashrc
echo cd storage/dcim/DM-Termux >> ../usr/etc/bash.bashrc
echo perl yt-downloader.pl >> ../usr/etc/bash.bashrc
echo "+++ Installation completed successfully +++"
echo "+++ Reboot Termux +++";
