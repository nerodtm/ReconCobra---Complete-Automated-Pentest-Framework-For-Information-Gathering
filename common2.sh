#!/bin/bash
echo -n "[ + ] Enter File with Path: " ; read File
mkdir json-results
cd json-describe/target/debug
./json-describe $File > /json-results/$File.list
cd ..