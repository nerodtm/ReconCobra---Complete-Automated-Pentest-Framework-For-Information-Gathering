#!/bin/bash
echo "[ + ] Enter Target: "
read Target
mkdir mirror_websites
cd mirror_websites
mkdir $Target
httrack -w $Target
cd ..
cd ..
