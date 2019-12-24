#!/bin/bash
mkdir endpoint_extraction_results
cd endpoint_extraction_results
echo -n "Enter URL to search : " ; read URL
curl "http://web.archive.org/cdx/search/cdx?url=$URL/*&output=text&fl=original&collapse=urlkey" > $URL.list
cd ..
