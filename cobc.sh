#!/bin/bash
YELLOW="\033[1;33m"
ENDCOLOR="\033[0m"
clear
echo -e
echo -e $YELLOW"[ + ] Downloading [ + ]"$ENDCOLOR
echo "1. Crawling for files for Location and GPS co-ordinates related files"
echo ""

echo "[ + ] Enter TERMUX option for Termux else press RETURN :"
read $first

if [ "$first" == 'TERMUX' ]

then 

read -p "[ + ] Enter victim url in absolute format: " victim
echo "$victim"
cd geotagging_crawler
python cobra_geotagging_crawler.py --wait=2 --download $victim

else

read -p "[ + ] Enter victim url: " victim
echo "$victim"
cd geotagging_crawler
python3 cobra_geotagging_crawler.py --wait=2 --download $victim

fi
