#!/bin/bash
echo " [+] Targets example: google or msn or microsoft"
echo " [+] Enter Search Target: "
read Target
python2 censys.py -f $Target