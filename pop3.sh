#!/bin/bash
echo "Enter Target"
read Target
nmap -p110 –script pop3-brute $Target