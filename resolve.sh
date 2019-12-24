#!/bin/bash
echo "Enter Target, example 192.168.1.0-24"
read Target
nmap $Target > input.txt
nmap -sP -iL -v input.txt