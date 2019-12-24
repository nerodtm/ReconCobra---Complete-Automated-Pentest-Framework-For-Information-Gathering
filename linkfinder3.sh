#!/bin/bash
cd LinkFinder
echo ""
echo "[ + ] Before using this tool"
echo "[ + ] copy all js files into LinkFinder folder"
echo "[ + ] loading results"
echo ""
python linkfinder.py -i '*.js' -r ^/api/ -o results.html
