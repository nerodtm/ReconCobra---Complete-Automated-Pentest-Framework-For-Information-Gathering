#!/bin/bash
echo " [+] Enter asnlookup.list"
read Target
nmap -iL $Target > $Target.nmapresult