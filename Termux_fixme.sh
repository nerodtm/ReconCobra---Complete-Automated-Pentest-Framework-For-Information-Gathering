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
apt-get install -y xrdp
apt-get install -y xdotool
apt-get install -y ccrypt
echo "y" | git clone https://github.com/haroonawanofficial/vasl.git

echo -e "Installing Extra Perl Modules ...";
echo "y" | cpan install WWW::Mechanize 
echo "y" | cpan install HTML::TokeParser
echo "y" | cpan install HTML::Parser
echo "y" | apt-get install python
echo "y" | apt-get install python2
echo "y" | apt-get install python3

echo "y" | wget https://cpan.metacpan.org/authors/id/B/BP/BPS/HTTP-Server-Simple-0.52.tar.gz
tar -xvf HTTP-Server-Simple-0.52.tar.gz
cd HTTP-Server-Simple-0.52
perl Makefile.PL
make
make install
cd ..
echo "y" | wget https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTML-Parser-3.72.tar.gz
tar -xvf HTML-Parser-3.72.tar.gz
cd HTML-Parser-3.72
perl Makefile.PL
make
make install
cd ..