#!/bin/bash
YELLOW="\033[1;33m"
ENDCOLOR="\033[0m"
clear
echo -e
echo -e $YELLOW"[ + ] Points [ + ]"$ENDCOLOR
echo "1. Extracting all Location"
echo ""
cd exiftool
mkdir geotagging_crawler
./exiftool -w filelocationsinformation.txt -location:all ../geotagging_crawler/*
