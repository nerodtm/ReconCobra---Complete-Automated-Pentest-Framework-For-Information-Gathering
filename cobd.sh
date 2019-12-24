#!/bin/bash
YELLOW="\033[1;33m"
ENDCOLOR="\033[0m"
clear
echo -e
echo -e $YELLOW"[ + ] Points [ + ]"$ENDCOLOR
echo "1. Extracting all GPS data"
echo ""
cd exiftool
mkdir geotagging_crawler
./exiftool ../geotagging_crawler/* | awk '/Gps|GPS|gps/{ print $0 }' > ../geotagging_crawler/filesgpsinformation.txt

