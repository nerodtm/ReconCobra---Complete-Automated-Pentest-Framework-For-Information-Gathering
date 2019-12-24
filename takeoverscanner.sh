#!/bin/bash
echo " [+] Copy all subdomain results in file first then use this feature"
echo " [+] Enter the subdomain list file, you created"
echo " [+] New file will be created as complete subdomains list"
echo " [+] File will provide fullest possible information of takeovers"
echo " [+] Output file will show various services famous to unknown" 
echo " [+] Services that are vulernable to takeovers"
echo " [+] Enter file path: "
read $Target
dig -f $Target 2> /dev/null | awk '/CNAME/ {print}' > takeoverlist_complete_subdomains.txt
