#!/bin/bash
echo "Enter Target"
read Target
nmap -p25 --script smtp-enum-users $Target