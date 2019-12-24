#!/bin/bash
read -p "[+] Enter Target : " Target
read -p "[+] Enter Screen : " Screen
xwininfo -display $Target:$Screen -all -root | grep \"
