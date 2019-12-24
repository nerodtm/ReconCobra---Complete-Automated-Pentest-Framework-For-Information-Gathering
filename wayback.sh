#!/bin/bash
mkdir wayback_results
cd wayback_results
echo -n "Enter URL: " ; read URL
wayback_machine_downloader http://$URL > $URL.list
cd ..