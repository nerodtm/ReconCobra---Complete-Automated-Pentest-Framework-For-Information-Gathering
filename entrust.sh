#!/bin/bash
echo " [+] Enter Target: "
read Target
go run ./entrust.go -domain $Target > ./crt/$Target.list