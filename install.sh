#!/bin/bash

# -----------------------------------------------------------------------------
# Info:
#  author:    N-Cen-Dainamix
#  file:      install-yt.sh
#  created:   16/10/2019
#  version:   1.3.0
# -----------------------------------------------------------------------------
# Requirements:
#  Perl, Python, cURL, ffmpeg, youtube-dl
# Description:
#  Youtube Automatic Converter Downloader for Termux
# -----------------------------------------------------------------------------

clear
echo "+++ Youtube Automatic Converter Downloader ++"
echo "+++ Script Automatic Install +++"
echo "+++ Install Python +++"
echo "\\n"
sleep 2;
pkg install python -y
echo "\\n"
echo "+++ Install Perl (For Youtube Automatic Converter Downloader ) +++"
echo "\\n"
sleep 2;
pkg install perl -y
echo "\\n"
echo "+++ Install ffmpeg (For Audio Conversion) +++"
echo "\\n"
sleep 2;
pkg install ffmpeg -y
echo "\\n"
echo "+++ Install cURL +++"
echo "\\n"
sleep 2;
pkg install curl -y
echo "\\n"
echo "+++ Downloading Youtube-dl +++"
sleep 3;
curl -s -L https://yt-dl.org/downloads/latest/youtube-dl -o /data/data/com.termux/files/usr/bin/youtube-dl
echo "+++ Youtube-dl Downloaded Successfully +++"
echo "\\n"
sleep 2;
echo "+++ Set Permission to Execute the Script +++"
sleep 2;
chmod a+rx /data/data/com.termux/files/usr/bin/youtube-dl
echo "+++ Permission Granted +++"
echo "\\n"
echo "+++ Setup SDcard +++"
sleep 2;
termux-setup-storage
sleep 8;
echo "\\n"
echo "+++ Setup Directory +++"
echo "+++ Creates a Download Directory on: storage/dcim/DM-Termux";
sleep 2;
cd ..
mkdir -p storage/dcim/DM-Termux
cd Youtube-dl
cp yt-downloader.pl storage/dcim/DM-Termux/yt-downloader.pl
echo "\\n"
echo "+++ Setup Startup +++"
sleep 2;
cd ..
echo cd storage/dcim/DM-Termux >> ../usr/etc/bash.bashrc
echo clear >> ../usr/etc/bash.bashrc
echo perl yt-downloader.pl >> ../usr/etc/bash.bashrc
echo "\\n"
echo "+++ Installation completed successfully +++"
echo "+++ Reboot Termux +++";
sleep 5;
