#!/bin/bash
cd Infoga
echo "Enter Target"
read Target
python infoga.py --domain $Target --source all --breach -v 2 --report resulst.txt
