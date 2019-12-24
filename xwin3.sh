#!/bin/bash
cd xrdp
read -p "[+] Enter Target : " Target
read -p "[+] Enter Screen : " Screen
./xrdp.py $Target:$Screen --no-disp
