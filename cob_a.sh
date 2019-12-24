#!/bin/bash
wget -i metacrawler_bingfiles.txt
cd exiftool
./exiftool *.pdf > pdfmetacrawler_results.txt
./exiftool *.svg > svgmetacrawler_results.txt
./exiftool *.doc > docmetacrawler_results.txt
./exiftool *.xls > xlsmetacrawler_results.txt
./exiftool *.xlsx > xslxmetacrawler_results.txt
./exiftool *.ppt > pptmetacrawler_results.txt
./exiftool *.pptx > pptxmetacrawler_results.txt
./exiftool *.csv > csvmetacrawler_results.txt
./exiftool *.rtf > rtfmetacrawler_results.txt
./exiftool *.zip > zipmetacrawler_results.txt
./exiftool *.rtf > rtfmetacrawler_results.txt
./exiftool *rar > rarmetacrawler_results.txt
./exiftool *.tgz > tgzmetacrawler_results.txt
./exiftool *.gz > gzmetacrawler_results.txt
./exiftool *.xz > xzmetacrawler_results.txt
mkdir metacrawler_results
cp *.pdf /metacrawler_results/
cp *.svg /metacrawler_results/
cp *.doc /metacrawler_results/
cp *.xls /metacrawler_results/
cp *.xlsx /metacrawler_results/
cp *.ppt /metacrawler_results/
cp *.pptx /metacrawler_results/
cp *.csv /metacrawler_results/
cp *.rtf /metacrawler_results/
cp *.tgz /metacrawler_results/
cp *.gz /metacrawler_results/
cp *.xz /metacrawler_results/
cd ..
rm *.pdf
rm *.svg
rm *.doc
rm *.xls
rm *.xlsx
rm *.ppt 
rm *.pptx
rm *.csv 
rm *.rtf 
rm *.tgz
rm *.gz
rm *.xz