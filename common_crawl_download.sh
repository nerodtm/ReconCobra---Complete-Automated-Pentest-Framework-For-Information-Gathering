#!/bin/bash
mkdir common_crawl_results
cd common_crawl_results
echo -e "Enter URL in reverse order only: " 
read Domain
curl -o http://urlsearch.commoncrawl.org/download?q=$Domain common_crawl_results
cd ..