# *************************************************************************************** #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#                     Agreement between "Haroon Awan" and "You"(user).                    #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#  1. By using this piece of software your bound to these point.                          #
#  2. This an End User License Agreement (EULA) is a legal between a software application #
#     author "Haroon Awan" and (YOU) user of this software.                               #
#  3. This software application grants users rights to use for any purpose or modify and  #
#     redistribute creative works.                                                        #
#  4. This software comes in "is-as" warranty, author "Haroon Awan" take no responsbility #
#     what you do with by/this software as your free to use this software.                #
#  5. Any other purpose(s) that it suites as long as it is not related to any kind of     #
#     crime or using it in un-authorized environment.                                     #
#  6. You can use this software to protect and secure your data information in any        #
#     environment.                                                                        #
#  7. It can also be used in state of being protection against the unauthorized use of    #
#     information.                                                                        #
#  8. It can be used to take measures achieve protection.                                 #
# *************************************************************************************** #

#!/bin/bash

clear

echo "Ultimate Recon and Foot Printing Software     Version 1.0a";   
echo "Termux Installer By: Haroon Awan and HackerUniversee";
echo "Coded By: Haroon Awan";
echo "Mail: mrharoonawan@gmail.com";
echo "";


echo -e "prerequisite install"
apt-get install wget
apt-get install make
apt-get install clang
apt-get install unzip
apt-get install tar
apt-get install -y xrdp
apt-get install -y ccrypt

echo -e "Installing Perl ...";
apt-get install -y perl
echo -e "Installing JSON Module ...";
cpan install JSON
echo -e "Installing Extra Perl Modules ...";
echo "y" | wget https://cpan.metacpan.org/authors/id/B/BP/BPS/HTTP-Server-Simple-0.52.tar.gz
tar -xvf HTTP-Server-Simple-0.52.tar.gz
cd HTTP-Server-Simple-0.52
perl Makefile.PL
make
make install
cd ..
echo "y" | cpan install WWW::Mechanize 
echo "y" | cpan install use HTML::TokeParser
echo "y" | cpan install Term::ANSIColor
echo "y" | cpan install Mojo::DOM
echo "y" | cpan install Data::Dumper
echo "y" | cpan install Win32::Console::ANSI
echo "y" | cpan install HTML::TableExtract
echo "y" | cpan install Data::Validate::Domain
echo "y" | cpan install LWP::Protocol::https
echo "y" | cpan install Mozilla::CA
echo "y" | cpan install Bundle::LWP


echo -e "Installing dependencies ...";
echo "y" | apt-get install xdg-utils
echo "y" | apt-get install python-yaml
echo "y" | apt-get install hping3
echo "y" | apt-get install python
echo "y" | apt-get install golang
echo "y" | apt-get install curl
echo "y" | apt-get install nfs-common
echo "y" | apt-get install smbclient
echo "y" | apt-get install x11-utils xutils-dev imagemagick libxext-dev xspy
echo "y" | apt-get install cargo
echo "y" | apt-get install gem
gem install wayback_machine_downloader
echo "y" | apt-get install perl-LWP-Protocol-https
echo "y" | git clone https://github.com/haroonawanofficial/cobra.git
curl -LO https://raw.githubusercontent.com/Hax4us/httrack_In_termux/master/httrack
cd httrack
chmod u+x *
sh httrack
cd ..
echo "y" | git clone https://github.com/haroonawanofficial/maahro.git
echo "y" | git clone https://github.com/haroonawanofficial/ShaheenX.git
echo "y" | git clone https://github.com/stormshadow07/HackTheWorld.git
cd HackTheWorld
chmod +x install.sh && ./install.sh
cd ..
echo "y" | git clone https://github.com/chenjj/CORScanner.git
cd CORScanner
pip install -r requirements.txt
cd ..
echo "y" | git clone https://github.com/yassineaboukir/Asnlookup.git
echo "y" | git clone https://github.com/exiftool/exiftool.git
echo "y" | git clone https://github.com/sensepost/BiLE-suite.git
echo "y" | git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
python setup.py install
echo "y" | git clone https://github.com/heycam/json-describe
cd json-describe
cargo build
cd ..
echo "y" | https://github.com/haroonawanofficial/vasl.git
echo "y" | apt-get install nmap
echo "y" | git clone https://github.com/stormshadow07/HackTheWorld.git
cd HackTheWorld
chmod +x install.sh && ./install.sh
cd ..
echo "y" | git clone https://github.com/threat9/routersploit
cd routersploit
sudo easy_install pip
sudo pip install -r requirements.txt
cd ..
echo "y" | git clone https://github.com/haroonawanofficial/panthera.git
echo "y" | git clone https://github.com/naqushab/SearchEngineScrapy.git
pip install jsbeautifier
pip install argparse
pip install requests
pip install request
cd SearchEngineScrapy
pip install -r requirements.txt
virtualenv --python="2" env
env/bin/activate
cd ..
echo "y" | git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/setup
chmod u+x setup.sh
./setup.sh
cd ..
chmod u+x *.sh
cat traceroute-function >> ~/.bashrc
source ~/.bashrc


echo -e "[+] Installed Success!";
echo -e "[+] Reboot Termux";
echo -e "[+] Upon successful reboot enter for interface, perl ReconCobratermux.pl";