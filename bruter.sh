#!/bin/bash
echo -e ""
echo -e "[+] Example: SSH/22, RDP/3389, FTP/21, Telnet/23, HTTP(S)/443, POP3(S)/110, IMAP/143"
echo -e "    SMB/139, VNC/5900-5, SIP/5060-5065, Redis/6379, PostgreSQL/5432, MySQL/3306"
echo -e "    MSSQL/1433, MongoDB/27017-19, Cassandra/7000-7001-9042-7199-8080, WinRM,/5986"
echo -e "    OWA/80-443-4125-3389"
echo -e ""
read -p "[+] Enter Target User (root/administrator): " User
read -p "[+] Enter Target IP: " Target
read -p "[+] Enter Target Port: " Port
ncrack -v --user $User $Target:$Port
