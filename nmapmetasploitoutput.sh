#!/bin/bash
echo "Target"
read Target
nmap -n -D192.168.1.5,10.5.1.2,172.1.2.4,3.4.2.1 $Target > report.data
nmap -T4 -A -p 1-1000 -oX - $Target > report.xml