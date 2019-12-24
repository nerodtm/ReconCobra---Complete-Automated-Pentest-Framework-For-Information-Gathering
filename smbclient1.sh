#!/bin/bash
echo "Enter Target"
read Target
smbclient -L ///$Target