#!/bin/bash
mkdir common_crawl_results
cd common_crawl_results
echo -e "[ + ] URL Examples, com.google, pk.daraz " 
echo -n "[ + ] Enter URL in reverse order only: " ; read Domain
curl http://urlsearch.commoncrawl.org/download?q=$Domain -o $Domain.list
cd ..