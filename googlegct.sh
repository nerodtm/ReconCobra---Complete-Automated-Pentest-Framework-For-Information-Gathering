#!/bin/bash
echo " [+] Enter Target: "
read Target
mkdir crt
python2 gct.py -d $Target -e show > ./crt/gct.list