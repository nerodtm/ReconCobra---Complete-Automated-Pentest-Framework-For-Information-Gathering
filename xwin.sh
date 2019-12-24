#!/bin/bash
read -p "[+] Enter Target : " Target
read -p "[+] Enter Number : " Screen
xwininfo -root -tree -display $Target:$Screen
