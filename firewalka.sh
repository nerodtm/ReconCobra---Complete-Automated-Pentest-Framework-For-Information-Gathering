#!/bin/bash
echo "Enter Target"
read Target
hping3 -S -c 1 -s 5151 -p 80 $Target > Firewalk_results/$Target.lista