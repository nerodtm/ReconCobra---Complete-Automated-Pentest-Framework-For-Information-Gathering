#!/bin/bash
cd LinkFinder
read -p "[ + ] Enter victim url: " victim
echo "$victim"
python2 linkfinder.py -i $victim -d
