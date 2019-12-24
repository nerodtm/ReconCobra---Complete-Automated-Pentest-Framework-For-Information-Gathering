#!/bin/bash
#
# Author: Tyler Wrightson
# Updated: Haroon Awan
# Date: June/8/2019

TARGET="$1"
DIR="$PWD/crt"

if [ -z $TARGET ]; then
	echo -e "Usage: cc.sh URL"
	exit
fi

echo -e "[ + ] Creating directory $DIR"
mkdir $DIR
echo -e "[ + ] Downloading from http://urlsearch.commoncrawl.org"
TARGET=${TARGET// /+}
echo -e "[ + ] url: http://urlsearch.commoncrawl.org/?q=$TARGET"
curl -s http://urlsearch.commoncrawl.org/?q=$TARGET > $DIR/curl.txt
echo -e "[ + ] Saving Certificate IDs to $DIR/crt.ids"
cat $DIR/curl.txt | grep ?q= | cut -d \" -f5 | cut -d '<' -f1 | cut -d '>' -f2 >> $DIR/crt.ids

TOTAL=`wc -l $DIR/crt.ids`
echo -e "[ + ] Total Number of Common Crawls: $TOTAL"
cat $DIR/crt.ids| while read line
do
   echo "[ + ] Downloading Common Crawl IDs: $line"
   curl -s http://urlsearch.commoncrawl.org/?q=$line > $DIR/$line.txt 
done

# Note that the (.*?) makes the search 'ungreedy' - which matches
# only the first occurence of the <BR> right after our search string
cat $DIR/* | grep -oP '(DNS)(.*?)(<BR>)' | cut -d ":" -f2 | cut -d "<" -f1 | sort -u >> $DIR/domains.txt

echo -e "[ + ] Domains saved to: $DIR/domains.txt"
echo -e "[ + ] Fixing and tweaking domains.txt
cd crt
sed -ie 's/*.//g' domains.txt
cp domains.txt domains.list
rm *.txt
rm *.txte
rm *.ids
cd ..
echo -e "[ + ] Done"