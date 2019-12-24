#!/bin/bash
echo "Enter Target"
read Target
snmp-check $Target -c private -v2c