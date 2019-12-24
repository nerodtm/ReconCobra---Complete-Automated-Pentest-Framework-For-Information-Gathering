#!/bin/bash
echo "Enter Target"
read Target
snmp-check $Target -c public -v2c