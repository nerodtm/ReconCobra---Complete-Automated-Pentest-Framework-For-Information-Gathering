#!/bin/bash
echo "Enter Target"
read Target
echo "enumdomusers" | rpcclient -U "" -N $Target