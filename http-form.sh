#!/bin/bash
echo "Enter Target"
read Target
nmap --script http-form-brute -p 80 $Target