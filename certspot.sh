#!/bin/bash
echo " [+] Enter Target: "
read Target
go run ./certspot.go $Target > ./crt/$Target.list