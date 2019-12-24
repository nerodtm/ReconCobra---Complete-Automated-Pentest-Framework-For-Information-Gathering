#!/bin/bash
cd ShaheenX
perl ShaheenX.pl
nmap -sn -oG status.txt -v -iL bingsubdomain.txt > bigsubdomain_hostnametoip.txt
nmap -sn -oG status.txt -v -iL robtexsubdomain.txt > robtexsubdomain_hostnametoip.txt
nmap -sn -oG status.txt -v -iL 51_subdomains.txt > 51_subdomains_hostnametoip.txt
nmap -sn -oG status.txt -v -iL asksubdomain.txt > asksubdomain_hostnametoip.txt
nmap -sn -oG status.txt -v -iL baidusubdomain.txt > baidusubdomain_hostnametoip.txt
nmap -sn -oG status.txt -v -iL netcraftsubdomain.txt > netcraftsubdomain_hostnametoip.txt
nmap -sn -oG status.txt -v -iL yahoosubdomain.txt > yahoosubdomain_hostnametoip.txt
