#!/bin/bash
echo "Enter Target"
read Target
nmap --script ftp-brute -p 21 $Target