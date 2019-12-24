#!/bin/bash
echo " [+] Remember the saved file path"
echo " [+] Targets example: google or msn or microsoft"
echo " [+] Enter Search Target: "
read Target
cd Asnlookup
python2 asnlookup.py -o $Target