#***************************************************************************************#
#----------------------- EULA LICENSE AGREEMENT NOTICE ---------------------------------#
#1. This software uses EULA based software agreement that grants users rights to use for#
#any purpose, modify and redistribute creative works about this perl software.          #
#2. This software comes in "is-as" warranty, author "Haroon Awan" take no responsbility #
#what you do with by/this software. Your free to use this software as it is for any     #
#purpose that suites as long as it is not related to crime.                             #
#***************************************************************************************#

#!/bin/bash
echo "[ + ] This is automatic net block finder script"
echo "[ + ] Integrated with net block finder Perl software which requires nmap"
echo "[ + ] Use this net block step by step with net block finder Perl for more results"
echo -n "[ + ] Enter IP address to find associated AS Blocks: "

read IP
whois -h whois.radb.net -i origin -T route $(whois -h whois.radb.net ${IP} | grep origin: | awk '{print $NF}' | head -1) | grep -w "route:" | awk '{print $NF}' | sort -n > input.txt
echo "file written, input.txt"
