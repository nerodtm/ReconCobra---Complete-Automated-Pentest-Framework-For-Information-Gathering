#!/bin/bash
read -p "[+] Enter Target : " Target
read -p "[+] Enter Number : " Screen
xwd -root -screen -silent -display $Target:$Screen > screenshot.xwd
convert screenshot.xwd screenshot.png

