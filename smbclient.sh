#!/bin/bash
echo "Enter Target"
read Target
smbclient -L ///$Target\\ipc\$ -U administrator -n "justatest" 