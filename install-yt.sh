#!/bin/bash

# -----------------------------------------------------------------------------
# Info:
#  author:    N-Cen-Dainamix
#  file:      install-yt.sh
#  created:   16/10/2019
#  version:   1.3.0
# -----------------------------------------------------------------------------
# Requirements:
#  Perl, Python, ffmpeg, youtube-dl
# Description:
#  Youtube Automatic Converter Downloader for Termux
# -----------------------------------------------------------------------------

echo -e "\\n"
echo -e "+++ Install Python +++"
echo -e "\\n"
pkg install python -y
sleep 2;
echo -e "\\n"
echo -e "+++ Install Perl (For Youtube Automatic Converter Downloader ) +++"
echo -e "\\n"
pkg install perl -y
sleep 2;
echo -e "\\n"
echo -e "+++ Install ffmpeg (For Audio Conversion) +++"
echo -e "\\n"
pkg install ffmpeg -y
sleep 2;
echo -e "\\n"
echo -e "+++ Downloading Youtube-dl +++"
echo -e "+++ Please Wait +++"
curl -s -L https://yt-dl.org/downloads/latest/youtube-dl -o /data/data/com.termux/files/usr/bin/youtube-dl
sleep 2;
echo -e "+++ Youtube-dl Downloaded Successfully +++"
echo -e "\\n"
sleep 2;
echo -e "+++ Set Permission to Execute the Script +++"
chmod a+rx /data/data/com.termux/files/usr/bin/youtube-dl
echo "+++ Permission Granted +++"
sleep 2;
echo -e "\\n"
echo -e "+++ Setup SDcard +++"
termux-setup-storage
sleep 8;
echo -e "\\n"
echo -e "+++ Setup Directory +++"
echo -e "+++ Download Directory on: storage/dcim/DM-Termux";
sleep 2;
mkdir $HOME/storage/dcim/DM-Termux
echo -e "\\n"
echo -e "+++ Setup Startup +++"
sleep 2;
echo cd storage/dcim/DM-Termux >> ../usr/etc/bash.bashr
echo clear >> ../usr/etc/bash.bashr
echo perl yt-downloader.pl >> ../usr/etc/bash.bashr
echo -e "\\n"
echo "+++ Installation completed successfully +++"
echo "+++ Reboot Termux +++";
sleep 5;
