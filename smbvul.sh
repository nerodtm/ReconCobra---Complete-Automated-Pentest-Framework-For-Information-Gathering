#!/bin/bash
echo "Enter Target"
read Target
nmap --script smb-vuln* -p 139,445 $Target
