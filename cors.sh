#!/bin/bash
echo -n "[ + ] Enter Target: "
read Target
cd CORScanner
python2 cors_scan.py -u $Target --verbose