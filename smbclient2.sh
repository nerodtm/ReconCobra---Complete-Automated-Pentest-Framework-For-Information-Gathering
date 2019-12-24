#!/bin/bash
echo "Enter Target"
read Target 
smbclient -L ///$TArget\\ipc\$ -U administrator -n "justatest"