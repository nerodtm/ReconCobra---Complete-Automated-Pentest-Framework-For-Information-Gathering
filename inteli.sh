#!/bin/bash
TARGET="$1"
BROWSER="xdg-open"
VER="1.9"
OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
DELAY=1
RESET='\e[0m'

echo "Enter Target"
read Target

$BROWSER "https://intelx.io/?s=$Target" 2> /dev/null
