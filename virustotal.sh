#!/bin/bash
cd vasl
echo " [+] Enter URL"
read Target
ruby virustotal.rb $Target