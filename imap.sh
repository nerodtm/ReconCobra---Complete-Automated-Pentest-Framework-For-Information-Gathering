#!/bin/bash
echo "Enter Target"
read Target
nmap -p143 –script imap-brute $Target