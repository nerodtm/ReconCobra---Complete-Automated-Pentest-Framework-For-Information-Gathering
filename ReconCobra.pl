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


#!/usr/bin/perl

use if $^O eq "MSWin32", Win32::Console::ANSI;
use Getopt::Long;
use HTTP::Request;
use utf8;
use open qw(:std :utf8);
use HTML::TokeParser;
use WWW::Mechanize;
use Data::Dumper;
use HTTP::Response;
use HTTP::Headers;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use feature 'say';
use IO::Select;
use HTML::TableExtract;
use IO::Socket::INET;
use Term::ANSIColor;
use URI::URL;
use Mojo::DOM;
use Mojo::UserAgent;
use Data::Dumper;
use LWP::UserAgent;
use LWP::Simple;
use JSON qw( decode_json encode_json );

my $ua = LWP::UserAgent->new;
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");

GetOptions(
    "h|help" => \$help,
    "A|info=s" => \$info,
    "B|whois=s" => \$whois,
    "C|location=s" => \$geo,
    "D|port=s" => \$op,
    "E|dwhois=s" => \$dnswhois,
    "F|revip=s" => \$revip,
    "Ff|fwdip=s" => \$fwdip,
    "G|dnszt=s" => \$dnszt,
    "H|revip=s" => \$revip,
    "I|dns=s" => \$sdns,
    "J|tech" => \$tech,
    "K|webrec=s" => \$webrec,
    "L|meta=s" => \$meta,
    "M|metag=s" => \$metag,
    "N|subs=s" => \$subs,
    "O|subst=s" => \$subst,
    "P|bsubs=s" => \$bsubs,
    "Q|bdnss=s" => \$bdnss,
    "R|ce=s" => \$ce,
    "S|fasn=s" => \$fasn,
    "T|fnblks" => \$fnblks,
    "U|cpshots=s" => \$cpshots,
    "V|findnear=s" => \$findnear,
    "W|sweepblocks=s" => \$sweepblocks,
    "X|panthera=s" => \$panthera,
    "Y|enames=s" => \$enames,
    "Z|findci=s" => \$findci,
    "a|cpscan=s" => \$cpscan,
    "b|phin=s" => \$phin,
    "c|finss=s" => \$finss,
    "d|dsgmd" => \$dsgmd,
    "e|fsbi=s" => \$fsbi,
    "f|euff=s" => \$euff,
    "g|eufp=s" => \$eufp,
    "h|eufi=s" => \$eufi,
    "i|eufs=s" => \$eufs,
    "j|euff=s" => \$euff,
    "k|efpifs=s" => \$efpifs,
    "l|eifc=s" => \$eifc,
    "m|fchsld=s" => \$fchsld,
    "n|fuss" => \$fuss,
    "o|fdfr=s" => \$fdfr,
    "p|fafu=s" => \$fafu,
    "q|fafe=s" => \$fafe,
    "r|fatfa=s" => \$fatfa,
    "s|dnsh=s" => \$dnsh,
    "t|pasds=s" => \$pasds,
    "u|ucct=s" => \$ucct,
    "v|cvt=s" => \$cvt,
    "w|rlu=s" => \$rlu,
    "x|fdl" => \$fdl,
    "y|wineni=s" => \$wineni,
    "z|winipc=s" => \$winipc,
    "aa|wfn=s" => \$wfn,
    "ab|wtn=s" => \$wtn,
    "ac|ips=s" => \$ips,
    "ad|cloud=s" => \$cloud,
    "ae|dnscache=s" => \$dnscache,
    "af|cmswaf=s" => \$cmswaf,
    "ag|sharedns=s" => \$SharedNS,
    "ah|MDSSE=s" => \$MDSSE,
    "ai|subnetdomain=s" => \$subnetdomain,
    "aj|domaincert=s" => \$domainCertificate,
    "ak|apisubdomain=s" => \$apisubdomain,
    "al|cname=s" => \$cname,
    "am|endpoints=s" => \$endpoints,
    "an|cors=s" => \$cors,
    "ao|wayback=s" => \$wayback,
    "ap|linkfinder=s" => \$linkfinder,
    "aq|geotagging=s" => \$geotagging,
    "as|mireer=s" => \$mireer,
    "at|bruter=s" => \$bruter,
    "au|mascan=s" => \$mascan,
    "av|daisychain=s" => \$daisychain,
    "aw|pdatabase=s" => \$pdatabase,
    "ax|encrypt=s" => \$encrypt,
    "ay|scrambler=s" =>\$scrambler,
    "az|wifi=s" => \$wifi,
    "aaa|pptp=s" => \$pptp,
    "aab|router=s" => \$router,
    "aac|mapperr=s" => \$mapperr,
);

if ($help) { banner();help(); }
if ($info) { banner();Websiteinformation(); }
if ($whois) { banner();Domainwhoislookup(); }
if ($geo) { banner();Findiplocation(); }
if ($op) { banner();port(); }
if ($dnswhois) { banner();Dnswhois(); }
if ($revwhois) { banner();Reversewhoislookup();}
if ($dnszt) { banner();DNSzonetransfers();}
if ($revip) { banner();Reverseiplookup(); }
if ($fwdip) { banner();Forwardiplookup(); }
if ($revdns) { banner();Reversednslookup(); }
if ($fwddns) { banner();Forwardnslookup(); }
if ($sdns) { banner();Shareddnslookup(); }
if ($tech) { banner();Technologylookup(); }
if ($webrec) { banner();Websiterecon(); }
if ($meta) { banner();Metadatacrawler(); }
if ($metag) { banner();Metadatagoogler(); }
if ($subs) { banner();Subdomainscanner(); }
if ($subst) { banner();Subdomainstakeverscanner();}
if ($bsubs) { banner();Brutesubdomains();}
if ($bdnss) { banner();Brutednssubdomains(); }
if ($ce) { banner();Configurationerrors(); }
if ($fasn) { banner();Findasn(); }
if ($fnblks) { banner();Findnetblocks(); }
if ($cpshots) { banner();Capturescreenshots(); }
if ($findnear) { banner();Findnearestserverstovictim(); }
if ($sweepblocks) { banner();Sweepnetblocksandresolve(); }
if ($panthera) { banner();Panthera(); }
if ($enames) { banner();Findemailsandnames();}
if ($findci) { banner();Findcontactinformation();}
if ($cpscan) { banner();Commonnmapportscan(); }
if ($phin) { banner();Pinghopandinternalnetworks(); }
if ($finss) { banner();Findinternalnetworkssandsweep(); }
if ($dsgmd) { banner();Decoayscanandgeneratemetasploitdata(); }
if ($fsbi) { banner();Findsslbugsandinformation(); }
if ($euff) { banner();Extractusersfromftp(); }
if ($eufp) { banner();Extractusersfrompop3(); }
if ($eufi) { banner();Extractusersfromimap(); }
if ($eufs) { banner();Extractusersfromsmtp();}
if ($euff) { banner();Extractusersfromform();}
if ($efpifs) { banner();Extractfullpossibleinformationfromsnmap(); }
if ($eifc) { banner();Extractpossibleinformationfromcertificaties(); }
if ($fchsld) { banner();Findvictimhttpsleakeddata(); }
if ($fuss) { banner();Findusersfromsitemap(); }
if ($fdfr) { banner();Finddirectoriesfromrobots(); }
if ($fafu) { banner();Findallaccountsfromuser(); }
if ($fafe) { banner();Findallaccountsfromemail(); }
if ($fatfa) { banner();Findalltagsfromaccount(); }
if ($dnsh) { banner();Dnshistory();}
if ($pasds) { banner();Passivednssearch();}
if ($ucct) { banner();Usecommoncrawlontarget(); }
if ($cvt) { banner();hostnametoip(); }
if ($rlu) { banner();Reversenslookup(); }
if ($fdl) { banner();Forwardnslookup(); }
if ($wineni) { banner();Wineni(); }
if ($winipc) { banner();Wingensipc(); }
if ($wfn) { banner();Wingfivnetbios(); }
if ($wtn) { banner();Winctonetbios(); }
if ($ips) { banner();Ips();}
if ($cloud) { banner();Bypasscloudflare(); }
if ($dnscache) { banner();Dnscachedrecords(); }
if ($cmswaf) { banner();Cmswaffirewall(); }
if ($sharedns) { banner();SharedNS(); }
if ($MDSSE) { banner();MDSSE(); }
if ($dcse) { banner();DomainCertificate(); } 
if ($apisubdomain) { banner();Apisubdomain(); } 
if ($cname) { banner();Cname(); } 
if ($endpoints) { banner();endpoints(); } 
if ($cors) { banner();cors(); } 
if ($wayback) { banner();wayback(); } 
if ($linkfinder) { banner();linkfinder(); } 
if ($geotagging) { banner();geotagging(); } 
if ($mireer) { banner();mireer(); } 
if ($bruter) { banner();bruter(); } 
if ($mascan) { banner();mascan(); }
if ($daisychain) { banner();daisychain(); }
if ($pdatabase) { banner();pdatabase(); }
if ($encrypt) { banner();encrypt(); }
if ($scrambler) { banner();scrambler(); }
if ($wifi) { banner();wifi(); }
if ($pptp) { banner();pptp(); }
if ($router) { banner();router(); }
if ($mapperr) { banner();mapperr(); }

unless (@ARGV > 1) { banner();menu(); }


#--------------------------------------------------------------#
#                            Help                              #
#--------------------------------------------------------------#
sub help {
    print line_u(),color('bold cyan'),"#                   ";
    print item('1'),"Website Information ";
    print color('bold red'),"=> ";
    print color("bold white"),"reconcobra -a site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('2'),"Domain Whois Lookup ";
    print color('bold red'),"=> ";
    print color("bold white"),"reconcobra -b site.com;
    print color('bold cyan'),"                   #   \n";
;
    print color('bold cyan'),"#                   ";
    print item('3'),"Find Geologication Location ";
    print color('bold red'),"=> ";
    print color("bold white"),"reconcobra -c site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('4'),"Basic Port Scan ";
    print color('bold red'),"=> ";
    print color("bold white"),"reconcobra -d site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('5'),"DNS Whois Lookup ";
    print color('bold red'),"   => ";
    print color("bold white"),"reconcobra -e site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('6'),"Reverse Whois Lookup ";
    print color('bold red')," => ";
    print color("bold white"),"reconcobra -f site.com";
    print color('bold cyan'),"         #   \n";

    print color('bold cyan'),"#                   ";
    print item('7'),"DNS Zone Transfers ";
    print color('bold red'),"  => ";
    print color("bold white"),"reconcobra -g site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('8'),"Reverse IP Lookup ";
    print color('bold red'),"  => ";
    print color("bold white"),"reconcobra -h site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('9'),"Forward IP Lookup ";
    print color('bold red'),"  => ";
    print color("bold white"),"reconcobra -i site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('10'),"Reverse DNS Lookup ";
    print color('bold red'),"  => ";
    print color("bold white"),"reconcobra -j site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('11'),"Forward DNS Lookup ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -k site.com";
    print color('bold cyan'),"                 #   \n",line_d();


    print color('bold cyan'),"#                   ";
    print item('12'),"Shared DNS Lookup ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -l site.com";
    print color('bold cyan'),"                 #   \n",line_d();


    print color('bold cyan'),"#                   ";
    print item('13'),"Complete Subdomain Scanner ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -m site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('14'),"Technology lookup ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -n site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('15'),"Website Recon ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -o site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('16'),"Metadata Crawler ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -p site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('17'),"Metadata Googler ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -r site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('18'),"Subdomain Scanner ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -s site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('19'),"Subdomain Takeover ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -t site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('20'),"Brute Subdomains ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -u site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('21'),"Brute DNS Subdomains ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -v site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('22'),"Configuration Errors ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -x site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('23'),"Find ASN ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -y site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('24'),"Find Netblocks ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -z site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('25'),"Capture Screenshots ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -A site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('26'),"Find Nearest Servers to Victim ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -B site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('27'),"Sweep Netblocks & Resolve ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -C site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('28'),"Load DNS Hacking Suite Panthera ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -D site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('29'),"Find Emails and Names ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -E site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('30'),"Find Contact Information ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -F site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('31'),"Common Nmap Port Scan ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -G site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('32'),"Ping Hop and Firewalk ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -H site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('33'),"Find Internal Networks & Sweep ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -I site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('34'),"Decoy Scan & Generate Metasploit ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -J site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('35'),"Find SSL Bugs & Information ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -K site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('36'),"Extract Users via FTP ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -I site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('37'),"Extract Users via POP3 ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -J site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('38'),"Extract Users via IMAP ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -K site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('39'),"Extract Users via SMTP ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -L site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('40'),"Extract Users via Form ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -M site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('41'),"Extract Full Possible Information ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -N site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('42'),"Extract Possible Information from Certificates ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -O site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('43'),"Find Victim HTTPS Leaked Data ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -P site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('44'),"Find Users via sitemap ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -Q site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('45'),"Find Directories from robots.txt ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -R site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('46'),"Find all accounts by user ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -S site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('47'),"Find all accounts by email ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -T site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('48'),"Find all tags by account ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -U site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('49'),"DNS History ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -V site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('50'),"Passive DNS Search ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -W site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('51'),"Use Common Crawl on Target ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -X site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('52'),"Hostname to IP ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -Y site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('53'),"Reverse NS Lookup ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -Z site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('54'),"Forward NS Lookup ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -aa site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('55'),"Win - Extract Netbios Information ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ab site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('56'),"Win - Contact & Extract Null Shares IPC\$";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ac site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('57'),"Win - Gather Full Information via Netbios ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ad site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('58'),"Win - Connect to Open Netbios ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ae site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('59'),"Invisible Port Scanner ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -af site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('59'),"Bypass Cloud Flare ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ag site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('60'),"DNS Cached Records ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ah site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('61'),"Bypass Content Management System Waf Firewall ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ai site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('62'),"Shared NS ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -aj site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('63'),"Master Domain Subdomain Subnet Scanner ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ak site.com";
    print color('bold cyan'),"                 #   \n",line_d();    

    print color('bold cyan'),"#                   ";
    print item('64'),"Domain Certificate Subdomain Enumeration ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -al site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('65'),"Find Subdomains using API Searcher ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -am site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('66'),"Find Cname Information of netblock ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -an site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('67'),"Endpoints Extraction ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ao site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('68'),"Check misconfigured Cross Origin Resource Sharing ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ap site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('69'),"Wayback Web Downloader ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ar site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('70'),"Link Finder ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ao site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('71'),"Geotagging ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -aq site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('72'),"Mirror Complete Website ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -as site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('73'),"Brute Forcer Module ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -at site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('74'),"Juicy Port Scan using Mascan ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -au site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('75'),"Set Daisy Chain ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -av site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('76'),"Search PHPinfo and Database Log via Search Engines ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -aw site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('77'),"File Encryption ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ax site.com";
    print color('bold cyan'),"                 #   \n",line_d();

    print color('bold cyan'),"#                   ";
    print item('78'),"Load Encryption Scrambling for Antivirus Evasion ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -ay site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('79'),"Load Wi-Fi Takeover Module ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -az site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('80'),"Load PPTP Brute Force Module ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -aaa site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('81'),"Load Routers/Load Balancer Interface ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -aab site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
    print color('bold cyan'),"#                   ";
    print item('82'),"Tracert Visual Machine Mapper  ";
    print color('bold red'),"        => ";
    print color("bold white"),"reconcobra -aac site.com";
    print color('bold cyan'),"                 #   \n",line_d();
    
}

#--------------------------------------------------------------#
#                           Banner                             #
#--------------------------------------------------------------#
sub banner {
    if ($^O =~ /MSWin32/) {system("mode con: cols=130 lines=40");system("cls"); }else { system("resize -s 40 130");system("clear"); }

print color('bold green on_black');
print"▄████████##▄██████▄##▀█████████▄#####▄████████####▄████████\n";
print"███####███#███####███###███####███###███####███###███####███\n";
print"███####█▀##███####███###███####███###███####███###███####███\n";
print"███########███####███##▄███▄▄▄██▀###▄███▄▄▄▄██▀###███####███\n";
print"███########███####███#▀▀███▀▀▀██▄##▀▀███▀▀▀▀▀###▀███████████\n";
print"███####█▄##███####███###███####██▄#▀███████████###███####███\n";
print"███####███#███####███###███####███###███####███###███####███\n";
print"████████▀###▀██████▀##▄█████████▀####███####███###███####█▀\n";
print"#####################################███####███############\n";
print color('reset');
print color('bold red on_black'),"Info          ";print color('reset'),"";print color('bold white'),"      version 1.9a, [Coded By: Haroon Awan]\n";
print color('reset');

print color('bold white on_bright_red'),"Mail          ";print color('reset'),"";print color('bright_blue'),"      mrharoonawan\@gmail.com\n";
print color('reset');

print color('bold red on_blue'),"Homepage      ";print color('reset'),"";print color('bold red'),"      http://www.instagram.com/\Hackeruniversee\n";
print color('reset');

print color('bold yellow on_red'),"Web           ";print color('reset'),"";print color('bold yellow'),"      http://www.mubassirkamdar.com\n";
print color('reset');

print color('bold green on_black'),"Facebook      ";print color('reset'),"";print color('bold green'),"      fb.com/officialharoonawan\n";
print color('reset');

print color('bold white on_blue'),"Instagram     ";print color('reset'),"";print color('bold white'),"      http://www.instagram.com/\hackerfromscratch\n";
print color('reset');

                                                                     


print color('bold cyan'),"\n  #---------------------------------------------------------# \n"; 
print color('bold cyan'),"  # ";print color('bold magenta'),"   Ultimate Reconnaissance for Information Gathering  "; print color('bold cyan'),"  # \n"; 
print color('bold cyan'),"  #---------------------------------------------------------# \n"; 
}
#--------------------------------------------------------------#
#                             Menu                             #
#--------------------------------------------------------------#
sub menu {
    print line_u(),color('bold cyan'),"#    ";print color('reset'),item('1'),"Website Information";print color('bold cyan'),"                                 #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('2'),"Domain Whois Lookup";print color('bold cyan'),"                    	      #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('3'),"Find IP Location";print color('bold cyan'),"                                    #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('4'),"Recommended Port Scan";print color('bold cyan'),"                    	      #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('5'),"DNS Whois Lookup";print color('bold cyan'),"                                    #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('6'),"Reverse Whois Lookup";print color('bold cyan'),"                                #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('7'),"DNS Zone Transfers Lookup";print color('bold cyan'),"                           #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('8'),"Reverse IP Lookup";print color('bold cyan'),"                                   #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('9'),"Forward IP Lookup";print color('bold cyan'),"                                   #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('10'),"Reverse DNS Lookup";print color('bold cyan'),"                                 #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('11'),"Forward DNS Lookup";print color('bold cyan'),"                                 #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('12'),"Shared DNS Lookup";print color('bold cyan'),"                                  #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('13'),"Technology lookup";print color('bold cyan'),"                                  #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('14'),"Website Recon";print color('bold cyan'),"                                      #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('15'),"Metadata Crawler";print color('bold cyan'),"                                   #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('16'),"Metadata Googler";print color('bold cyan'),"                                   #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('17'),"Subdomain Scanner using Search Engines";print color('bold cyan'),"             #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('18'),"Subdomain Takeover Scanner using file";print color('bold cyan'),"              #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('19'),"Brute Subdomains using nmap";print color('bold cyan'),"                        #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('20'),"Brute DNS Subdomains";print color('bold cyan'),"                               #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('21'),"Find Configuration Errors on Target using google";print color('bold cyan'),"   #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('22'),"Find ASN";print color('bold cyan'),"                                           #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('23'),"Find Netblocks";print color('bold cyan'),"                                     #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('24'),"Capture Screenshots";print color('bold cyan'),"                                #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('25'),"Find Nearest Servers to Victim";print color('bold cyan'),"                     #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('26'),"Sweep Netblocks & Resolve";print color('bold cyan'),"                          #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('27'),"Load DNS Hacking Suite Panthera";print color('bold cyan'),"                    #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('28'),"Find Emails and Names";print color('bold cyan'),"                              #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('29'),"Find Contact Information";print color('bold cyan'),"                           #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('30'),"Common Nmap Port Scan";print color('bold cyan'),"                              #   \n";                    
    print color('bold cyan'),"#    ";print color('reset'),item('31'),"Ping Hop and Firewalk";print color('bold cyan'),"                              #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('32'),"Find Internal Networks & Sweep";print color('bold cyan'),"                     #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('33'),"Decoy Scan & Generate Metasploit Data";print color('bold cyan'),"              #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('34'),"Find SSL Bugs & Information";print color('bold cyan'),"                        #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('35'),"Extract Users via FTP";print color('bold cyan'),"                              #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('36'),"Extract Users via POP3";print color('bold cyan'),"                             #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('37'),"Extract Users via IMAP";print color('bold cyan'),"                             #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('38'),"Extract Users via SMTP";print color('bold cyan'),"                             #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('39'),"Extract Users via Form";print color('bold cyan'),"                             #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('40'),"Extract Full Possible Information via SNMP";print color('bold cyan'),"         #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('41'),"Extract Possible Information from Certificates";print color('bold cyan'),"     #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('42'),"Find Victim HTTPS Leaked Data ";print color('bold cyan'),"                     #   \n";                                                                
    print color('bold cyan'),"#    ";print color('reset'),item('43'),"Find Users via sitemap";print color('bold cyan'),"                             #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('44'),"Find Directories from robots.txt";print color('bold cyan'),"                   #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('45'),"Find all accounts by user";print color('bold cyan'),"                          #   \n";    
    print color('bold cyan'),"#    ";print color('reset'),item('46'),"Find all accounts by email";print color('bold cyan'),"                         #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('47'),"Find all tags by account";print color('bold cyan'),"                           #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('48'),"DNS History";print color('bold cyan'),"                                        #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('49'),"Passive DNS Search";print color('bold cyan'),"                                 #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('50'),"Use Common Crawl on Target";print color('bold cyan'),"                         #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('51'),"Hostname to IP Resolver using Search Engines";print color('bold cyan'),"       #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('52'),"Reverse NS Lookup";print color('bold cyan'),"                                  #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('53'),"Forward NS Lookup";print color('bold cyan'),"                                  #   \n";
    print color('bold cyan'),"#    ";print color('reset'),item('54'),"Win - Extract Netbios Information";print color('bold cyan'),"                  #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('55'),"Win - Contact & Extract Null Shares IPC\$";print color('bold cyan'),"           #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('56'),"Win - Gather Full Information via Netbios";print color('bold cyan'),"          #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('57'),"Win - Connect to Open Netbios";print color('bold cyan'),"                      #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('58'),"Invisible Port Scanner";print color('bold cyan'),"                             #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('59'),"Bypass Cloud Flare";print color('bold cyan'),"                                 #   \n";                                
    print color('bold cyan'),"#    ";print color('reset'),item('60'),"DNS Cached Records";print color('bold cyan'),"                                 #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('61'),"Bypass Content Management System Waf Firewall";print color('bold cyan'),"      #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('62'),"Shared NS";print color('bold cyan'),"                                          #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('63'),"Master Domain Subdomain Subnet Scanner";print color('bold cyan'),"             #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('64'),"Domain Certificate Subdomain Enumeration";print color('bold cyan'),"           #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('65'),"Find Subdomains using API Searcher ";print color('bold cyan'),"                #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('66'),"Find Cname Information of netblock ";print color('bold cyan'),"                #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('67'),"Endpoint Extraction ";print color('bold cyan'),"                               #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('68'),"Check misconfigured Cross Origin Resource Sharing ";print color('bold cyan')," #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('69'),"Wayback Web Downloader ";print color('bold cyan'),"                            #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('70'),"JS Find Link & Analyse ( local and remote ) ";print color('bold cyan'),"       #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('71'),"Extract Geo-Cordinates for Tracking ";print color('bold cyan'),"               #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('72'),"Mirror Complete Website ";print color('bold cyan'),"                           #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('73'),"Brute Forcer Module";print color('bold cyan'),"                                #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('74'),"Databases and Connections Port Scan using Mascan";print color('bold cyan'),"   #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('75'),"Set Daisy Chain";print color('bold cyan'),"                                    #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('76'),"Search PHPinfo and Database Log via Search Engines";print color('bold cyan')," #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('77'),"Load Encrypt/Decrypt Module ";print color('bold cyan'),"                       #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('78'),"Load Encryption Scrambling for Antivirus Evasion";print color('bold cyan'),"   #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('79'),"Load Wi-Fi Takeover Module";print color('bold cyan'),"                         #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('80'),"Load PPTP Brute Force Module ";print color('bold cyan'),"                      #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('81'),"Load Routers/Load Balancer Interface ";print color('bold cyan'),"              #   \n";                
    print color('bold cyan'),"#    ";print color('reset'),item('82'),"Tracert Visual Machine Mapper ";print color('bold cyan'),"                     #   \n";         
    print color('bold cyan'),"#    ";print color('reset'),item('0'),"Exit";print color('bold cyan'),"                                                #   \n",line_d();
    print color('bold green'),"\n\nC0bra: _>  ";
    print color('reset');
    chomp($number=<STDIN>);

    if($number eq '1'){
        banner();
        print line_u(),color('bold cyan'),"#       ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                        	    #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($info=<STDIN>);
        print "\n";
        Websiteinformation();
        enter();
    }if($number eq '2'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                    		    #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($whois=<STDIN>);
        print "\n";
        Domainwhoislookup();
        enter();
    }if($number eq '3'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($geo=<STDIN>);
        print "\n";
        Findiplocation();
        enter();
    }if($number eq '4'){
        banner();
        port();
        enter();
    }if($number eq '5'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($sub=<STDIN>);
        print "\n";
        DNS_Whois_Lookup();
        enter();
    }if($number eq '6'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($revwhoiis=<STDIN>);
        print "\n";
        revwhois();
        enter();
    }if($number eq '7'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($dnszt=<STDIN>);
        print "\n";
        DNSzonetransfers();
        enter();
    }if($number eq '8'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($rev=<STDIN>);
        print "\n";
        revip();
        enter();
    }if($number eq '9'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($fwdip=<STDIN>);
        print "\n";
        Forwardiplookup();
        enter();
        }if($number eq '10'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($revdns=<STDIN>);
        print "\n";
        Reversednslookup();
        enter();
    }if($number eq '11'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($fwddns=<STDIN>);
        print "\n";
        Forwardnslookup();
        enter();
    }if($number eq '12'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($shrdns=<STDIN>);
        print "\n";
        Shareddnslookup();
        enter();
    }if($number eq '13'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($techlookup=<STDIN>);
        print "\n";
        Technologylookup();
        enter();
    }if($number eq '14'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($webrecon=<STDIN>);
        print "\n";
        Websiterecon();
        enter();
    }if($number eq '15'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($mdc=<STDIN>);
        print "\n";
        Metadatacrawler();
        enter();
    }if($number eq '16'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($mgd=<STDIN>);
        print "\n";
        Metadatagoogler();
        enter();
    }if($number eq '17'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($sbds=<STDIN>);
        print "\n";
        Subdomainscanner();
        enter();
    }if($number eq '18'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($sbtk=<STDIN>);
        print "\n";
        Subdomaintakeover();
        enter();
    }if($number eq '19'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($brtd=<STDIN>);
        print "\n";
        Brutedomain();
        enter();
    }if($number eq '20'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($brtdns=<STDIN>);
        print "\n";
        Brutednsdomain();
        enter();
    }if($number eq '21'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($cfe=<STDIN>);
        print "\n";
        Configerrors();
        enter();
    }if($number eq '22'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($fasn=<STDIN>);
        print "\n";
        Findasn();
        enter();
    }if($number eq '23'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($fnb=<STDIN>);
        print "\n";
        Findnetblock();
        enter();
    }if($number eq '24'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($cpshots=<STDIN>);
        print "\n";
        Capturescreenshots();
        enter();
    }if($number eq '25'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($findnear=<STDIN>);
        print "\n";
        nearestvictim();
        enter();
    }if($number eq '26'){
        banner();
        print line_u(),color('bold cyan'),"#       ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                   #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($snb=<STDIN>);
        print "\n";
        Sweepandnetblock();
        enter();
    }if($number eq '27'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($panthera=<STDIN>);
        print "\n";
        Panthera();
        enter();
        }if($number eq '28'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($enames=<STDIN>);
        print "\n";
        Findemailsandnames();
        enter();
    }if($number eq '29'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($findci=<STDIN>);
        print "\n";
        Findcontactinformation();
        enter();
    }if($number eq '30'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($cpscan=<STDIN>);
        print "\n";
        Commonnmapportscan();
        enter();
    }if($number eq '31'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($phin=<STDIN>);
        Pinghopandinternalnetworks();
        enter();
    }if($number eq '32'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($finss=<STDIN>);
        print "\n";
        Findinternalnetworkssandsweep();
        enter();
    }if($number eq '33'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($dsgmd=<STDIN>);
        print "\n";
        Decoayscanandgeneratemetasploitdata();
        enter();
    }if($number eq '34'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($fsbi=<STDIN>);
        print "\n";
        Findsslbugsandinformation();
        enter();
    }if($number eq '35'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($euff=<STDIN>);
        print "\n";
        Extractusersfromftp();
        enter();
    }if($number eq '36'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($eufp=<STDIN>);
        print "\n";
        Extractusersfrompop3();
        enter();
        }if($number eq '37'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($eufi=<STDIN>);
        print "\n";
        Extractusersfromimap();
        enter();
    }if($number eq '38'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($eufs=<STDIN>);
        print "\n";
        Extractusersfromsmtp();
        enter();
    }if($number eq '39'){
        banner();
        print line_u(),color('bold cyan'),"#       ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($euff=<STDIN>);
        print "\n";
        Extractusersfromform();
        enter();
    }if($number eq '40'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target IP     ";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($efpifs=<STDIN>);
        print "\n";
        Extractfullpossibleinformationfromsnmp();
        enter();
    }if($number eq '41'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($eifc=<STDIN>);
        print "\n";
        Extractpossibleinformationfromcertificaties();
        enter();
    }if($number eq '42'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($fchsld=<STDIN>);
        print "\n";
        Findvictimhttpsleakeddata();
        enter();
    }if($number eq '43'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($fuss=<STDIN>);
        print "\n";
        Findusersfromsitemap();
        enter();
    }if($number eq '44'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($fdfr=<STDIN>);
        print "\n";
        Finddirectoriesfromrobots();
        enter();
    }if($number eq '45'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($fafu=<STDIN>);
        print "\n";
        Findallaccountsfromuser();
        enter();
    }if($number eq '46'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($fafes=<STDIN>);
        print "\n";
        Findallaccountsfromemail();
        enter();
    }if($number eq '47'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($cloud=<STDIN>);
        print "\n";
        Findalltagsfromaccount();
        enter();
    }if($number eq '48'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($dnsh=<STDIN>);
        print "\n";
        Dnshistory();
        enter();
    }if($number eq '49'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($dnsh=<STDIN>);
        print "\n";
        Passivednssearch();
        enter();
    }if($number eq '50'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($pasds=<STDIN>);
        print "\n";
        Usecommoncrawlontarget();
        enter();
    }if($number eq '51'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($cvt=<STDIN>);
        print "\n";
        hostnametoip();
        enter();
    }if($number eq '52'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($rlu=<STDIN>);
        print "\n";
        Reversenslookup();
        enter();
    }if($number eq '53'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($fdl=<STDIN>);
        print "\n";
        Forwardnslookup();
        enter();
    }if($number eq '54'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($wineni=<STDIN>);
        print "\n";
        Wineni();
        enter();
    }if($number eq '55'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($winipc=<STDIN>);
        print "\n";
        Wingensipc();
        enter();
    }if($number eq '56'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($wfn=<STDIN>);
        print "\n";
        Wingfivnetbios();
        enter();
    }if($number eq '57'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        #chomp($wtn=<STDIN>);
        print "\n";
        Winctonetbios();
        enter();
    }if($number eq '58'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                  #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($ips=<STDIN>);
        print "\n";
        Ips();
        enter();
    }if($number eq '59'){
        banner();
        print line_u(),color('bold cyan'),"#         ";print color('reset'),item(),"Enter Target Website";print color('bold cyan'),"                                #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($cloud=<STDIN>);
        print "\n";
        Bypasscloudflare();
        enter();
    }if($number eq '60'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website (caution: This may take a while)";print color('bold cyan')," #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($dnscache=<STDIN>);
        print "\n";
        Dnscachedrecords();
        enter();
    }if($number eq '61'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter IP Address";print color('bold cyan'),"                                      #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($cmswaf=<STDIN>);
        print "\n";
        Cmswaffirewall();
        enter();    
    }if($number eq '62'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        chomp($sharedns=<STDIN>);
        print "\n";
        SharedNS();
        enter();
    }if($number eq '63'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');
        print "\n";
        MDSSE();
        enter();
    }if($number eq '64'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        DomainCertificate();
        enter();
    }if($number eq '65'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        Apisubdomain();
        enter();
    }if($number eq '66'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        Cname();
        enter();
    }if($number eq '67'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        endpoints();
        enter();
    }if($number eq '68'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        cors();
        enter();
    }if($number eq '69'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        wayback();
        enter();
    }if($number eq '70'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        linkfinder();
        enter();
    }if($number eq '71'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        geotagging();
        enter();
    }if($number eq '72'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        mireer();
        enter();
    }if($number eq '73'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        bruter();
        enter();
    }if($number eq '74'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        mascan();
        enter();
    }if($number eq '75'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        daisychain();
        enter();
    }if($number eq '76'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        pdatabase();
        enter();
    }if($number eq '77'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        encrypt();
        enter();
    }if($number eq '78'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        scrambler();
        enter();
    }if($number eq '79'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        wifi();
        enter();
    }if($number eq '80'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        mireer();
        enter();
    }if($number eq '81'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        router();
        enter();
    }if($number eq '82'){
        banner();
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Address";print color('bold cyan'),"                                         #   \n",line_d();
        print color('bold green'),"\n\nc0bra: _>  ";
        print color('bold white');       
        print "\n";
        mapperr();
        enter();
    }if($number eq '0'){
        exit;
    }
    else{
        banner();
        menu();
    }
}

#--------------------------------------------------------------#
#1                    Website information                      #
#--------------------------------------------------------------#
sub Websiteinformation {
if (system("whois $info") == 0) {
	print "Success!\n";
	}
	else {
	print "[~] Did you forget to upgrade ReconCobra? \n[~] Command failed\n";
	}
}

#--------------------------------------------------------------#
#2                    Domain Whois Lookup                      #
#--------------------------------------------------------------#
sub Domainwhoislookup {
    $url = "https://api.hackertarget.com/whois/?q=$whois";
    $request = $ua->get($url);
    $response = $request->content;

 while($response =~m/(.*?)\n/g)
    {
        print item(),"$1 \n";
        sleep(1);
    }
if ($response =~ /error/) {
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}



#--------------------------------------------------------------#
#3                   Find IP Geo Location                      #
#--------------------------------------------------------------#
sub Findiplocation {
    $ip= (gethostbyname($geo))[4];
    my ($a,$b,$c,$d) = unpack('C4',$ip);
    $ip ="$a.$b.$c.$d";

    $url = "https://ipapi.co/$ip/json/";
    $request = $ua->get($url);
    $response = $request->content;

    if($response =~/country_name": "(.*?)"/){
        print item(),"IP Address: $ip\n";
        print item(),"Country: $1\n";
        if($response =~/city": "(.*?)"/){
            print item(),"City: $1\n";
        }if($response =~/region": "(.*?)"/){
            print item(),"Region: $1\n";
        }if($response =~/region_code": "(.*?)"/){
            print item(),"Region Code: $1\n";
        }if($response =~/continent_code": "(.*?)"/){
            print item(),"Continent Code: $1\n";
        }if($response =~/postal": "(.*?)"/){
            print item(),"Postal Code: $1\n";
        }if($response =~/latitude": (.*?),/){
            print item(),"Latitude / Longitude: $1, ";
        }if($response =~/longitude": (.*?),/){
            print color("bold white"),"$1\n";
        }if($response =~/timezone": "(.*?)"/){
            print item(),"Timezone: $1\n";
        }if($response =~/utc_offset": "(.*?)"/){
            print item(),"Utc Offset: $1\n";
        }if($response =~/country_calling_code": "(.*?)"/){
            print item(),"Calling Code: $1\n";
        }if($response =~/currency": "(.*?)"/){
            print item(),"Currency: $1\n";
        }if($response =~/languages": "(.*?)"/){
            print item(),"Languages: $1\n";
        }if($response =~/asn": "(.*?)"/){
            print item(),"ASN: $1\n";
        }if($response =~/org": "(.*?)"/){
            print item(),"ORG: $1\n";
        }
    }else {
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}

#--------------------------------------------------------------#
#4      Recommended Port Scanner                               #
#--------------------------------------------------------------#
sub port {
        print line_u(),color('bold cyan'),"#        ";print color('reset'),item(),"Enter Target Website/IP";print color('bold cyan'),"                               #   \n",line_d();
        print color('bold green'),"\n\nC0bra: _>  ";
        print color('bold white');
        chop ($op = <stdin>);
    $| = 1;

    print "\n";
    print item(),"PORT  STATE   SERVICE\n";
    my %ports = (
        21   => 'FTP'
        ,22   => 'SSH'
        ,23   => 'Telnet'
        ,25   => 'SMTP'
        ,43   => 'Whois'
        ,53   => 'DNS'
        ,68   => 'DHCP'
        ,80   => 'HTTP'
        ,110  => 'POP3'
        ,111  => 'Portmapper'
        ,115  => 'SFTP'
        ,119  => 'NNTP'
        ,123  => 'NTP'
        ,137  => 'NetBIOS'
        ,139  => 'NetBIOS'
        ,143  => 'IMAP'
        ,161  => 'SNMP'
        ,220  => 'IMAP3'
        ,389  => 'LDAP'
        ,443  => 'SSL'
        ,445  => 'SAMBA'
        ,513  => 'Rlogin'
        ,514  => 'Rlogin'
        ,691  => 'Microsoft Exchange'
        ,1433 => 'MSSQL'
        ,1521 => 'Oracle SQL'
        ,1701 => 'L2TP'
        ,1723 => 'PPTP'
        ,2049 => 'NFS'
        ,3306 => 'mySQL'
        ,3388 => 'RDP'
        ,3389 => 'RDP'
        ,3390 => 'OWA'
        ,4125 => 'OWA'
        ,5060 => 'VNC'
        ,5061 => 'VNC'
        ,5062 => 'VNC'
        ,5063 => 'VNC'
        ,5064 => 'VNC'
        ,5065 => 'VNC'
        ,5432 => 'PostgreSQL'
        ,5802 => 'VNC'
        ,5804 => 'VNC'
        ,5900 => 'VNC'
        ,5901 => 'VNC'
        ,5903 => 'VNC'
        ,5905 => 'VNC'
        ,5986 => 'VNC'
        ,6000 => 'Xwindows'
        ,6002 => 'Xwindows'
        ,6003 => 'Xwindows'
        ,6060 => 'Xwindows'
        ,6061 => 'Xwindows'
        ,6062 => 'Xwindows'
        ,6063 => 'Xwindows'
        ,6379 => 'Redis'
        ,7000 => 'Cassandra Apache'
        ,7001 => 'Cassandra Apache'
        ,7199 => 'Cassandra Apache'
        ,8000 => 'HTTP'
        ,8080 => 'HTTP'
        ,8090 => 'HTTP'
        ,8443 => 'HTTPS'
        ,8888 => 'HTTP'
        ,9001 => 'HTTP'
        ,9042 => 'Cassandra Apache'
        ,27017 => 'MongoDB'
        ,27018 => 'MongoDB'
        ,27019 => 'MongoDB'
    );
    foreach my $p ( sort {$a<=>$b} keys( %ports ) )
    {
        $socket = IO::Socket::INET->new(PeerAddr => $op , PeerPort => "$p" , Proto => 'tcp' , Timeout => 1);
        if( $socket ){
            print item(); printf("%4s  Open    %s\n", $p, $ports{$p});

        }else{
            print item(); printf("%4s  Closed  %s\n", $p, $ports{$p});
        }
    }
}

#--------------------------------------------------------------#
#5                     DNS Whois Lookup                        #
#--------------------------------------------------------------#
sub DNS_Whois_Lookup {
    $url = "https://www.pagesinventory.com/search/?s=$sub";
    $request = $ua->get($url);
    $response = $request->content;

    $ip= (gethostbyname($sub))[4];
    my ($a,$b,$c,$d) = unpack('C4',$ip);
    $ip_address ="$a.$b.$c.$d";
    if($response =~ /Search result for/){
        print item(),"Website: $sub\n";
        print item('+'),"IP: $ip_address\n\n";

        while($response =~ m/<td><a href=\"\/domain\/(.*?).html\">(.*?)<a href="\/ip\/(.*?).html">/g ) {

            print item(),"Subdomain: $1\n";
            print item('+'),"IP: $3\n\n";
            sleep(1);
        }
    }elsif($ip_address =~ /[0-9]/){
        if($response =~ /Nothing was found/){
            print item(),"Website: $sub\n";
            print item(),"IP: $ip_address\n\n";
            print item(),"No Subdomains Found For This Domain\n";
        }}
        else {
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}

#--------------------------------------------------------------#
#6                    Reverse Whois Lookup                     #
#--------------------------------------------------------------#
sub revwhois{
     $url = "https://viewdns.info/reversewhois/?q=$revwhoiis";
     $request = $ua->request(HTTP::Request->new(GET => $url));
     $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}
}


#--------------------------------------------------------------#
#7                     DNS Zone Transfers Lookup               #
#--------------------------------------------------------------#
sub DNSzonetransfers {
    $url = "https://api.hackertarget.com/zonetransfer/?q=$dnszt";
   #$url = "https://api.hackertarget.com/whois/?q=$whois";
    $request = $ua->get($url);
    $response = $request->content;

 while($response =~m/(.*?)\n/g)
    {
        print item(),"$1 \n";
        sleep(1);
    }
if ($response =~ /error/) {
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}

#--------------------------------------------------------------#
#8                     Reverse IP Lookup                       #
#--------------------------------------------------------------#
sub revip{
    $url = "https://api.hackertarget.com/reverseiplookup/?q=$rev";
    $request = $ua->get($url);
    $response = $request->content;

 while($response =~m/(.*?)\n/g)
    {
        print item(),"$1 \n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}


#--------------------------------------------------------------#
#9                        Forward IP Lookup                    #
#--------------------------------------------------------------#
sub Forwardiplookup {
    $url = "https://viewdns.info/reverseip/?host=$fwdip&t=1";
    $request = $ua->request(HTTP::Request->new(GET => $url));
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}
} 
 
 
#--------------------------------------------------------------#
#10                       Reverse DNS Lookup                   #
#--------------------------------------------------------------#
sub Reversednslookup {
    $url = "https://viewdns.info/reversedns/?ip=$revdns";
    $request = $ua->request(HTTP::Request->new(GET => $url));
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}
} 


#--------------------------------------------------------------#
#11                       Forward DNS Lookup                   #
#--------------------------------------------------------------#
sub Forwardnslookup {
    $url = "https://www.dnssy.com/lookup.php?q=$fwddns&t=A";
    $request = $ua->request(HTTP::Request->new(GET => $url));
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}
} 


#--------------------------------------------------------------#
#12                       Shared DNS Lookup                    #
#--------------------------------------------------------------#
sub Shareddnslookup {
    $url = "https://api.hackertarget.com/findshareddns/?q=$shrdns";
    $request = $ua->get($url);
    $response = $request->content;

 while($response =~m/(.*?)\n/g)
    {
        print item(),"$1 \n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}



#--------------------------------------------------------------#
#13                       Technology Lookup                    #
#--------------------------------------------------------------#
sub Technologylookup {
    $url = "https://builtwith.com/$techlookup";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("h2")) {
      my @link = $p->get_trimmed_text("/h2");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}
}

#--------------------------------------------------------------#
#14                       Website Recon                        #
#--------------------------------------------------------------#
sub Websiterecon {
#   $url = "https://api.wappalyzer.com/lookup-basic/beta/?url=http://$webrecon";
    $url = "https://dnstools.ws/traversal/$webrecon/ANY/";
    $request = $ua->get($url);
    $response = $request->content;
    
$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}
} 

#--------------------------------------------------------------#
#15                       Metadata Crawler                     #
#--------------------------------------------------------------#
sub Metadatacrawler {
if (system("/usr/share/ReconCobra/coba.sh") == 0) {
	print "Success!\n";
	}
	else {
	print "[~] Make available coba.sh in same folder\n[~] Command failed\n";
	}
}

#--------------------------------------------------------------#
#16                        Metadata Googler                    #
#--------------------------------------------------------------#
sub Metadatagoogler {
if (system("/usr/share/ReconCobra/cobb.sh") == 0) {
	print "Success! \n";
	print "Downlaoded meta files are stored in downloaded_meta_files directory \n";
	print "Results are stored in metacrawler_results directory \n";
	}
	else {
	print "[~] Make available cobb.sh in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#17                        Subdomain Scanner                   #
#--------------------------------------------------------------#
sub Subdomainscanner {
	print item(),"1 - Start Search Engine Subdomain Scanner\n";
	print item(),"2 - Try Pages Inventory\n";
	print item(),"Enter Search Engine: ";
	chomp($enter=<STDIN>);
if ($enter =~1) {
	if (system("/usr/share/ReconCobra/ShaheenX.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make ShaheenX.sh available in same folder\n[~] Command failed\n";
}
}
if ($enter =~2) {
	if (system("/usr/share/ReconCobra/sub1.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make sub1.sh available in same folder\n[~] Command failed\n";
	}
}
}


#--------------------------------------------------------------#
#18                       Subdomain Takeover Scanner           #
#--------------------------------------------------------------#
sub Subdomaintakeover {
if (system("/usr/share/ReconCobra/takeoverscanner.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make takoverscanner.sh available in same folder\n[~] Command failed\n";
	}
}



#--------------------------------------------------------------#
#19                         Brute Subdomains                   #
#--------------------------------------------------------------#
sub Brutedomain {
if (system("/usr/share/ReconCobra/maahro.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make maahro.sh available in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#20                       Brute DNS Subdomains                 #
#--------------------------------------------------------------#
sub Brutednsdomain {
	print item(),"Browse panthera folder for wordllist files and provide given file list\n";
sleep(5);
if (system("perl panthera/dnsbrute.pl") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make Panthera available in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#21                       Configuration Errors                 #
#--------------------------------------------------------------#
sub Configerrors {
if (system("/usr/share/ReconCobra/browser.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make browser.sh in same folder\n[~] Command failed\n";
	}
				     }

#--------------------------------------------------------------#
#22                       Find ASN                             #
#--------------------------------------------------------------#
sub Findasn {
if (system("/usr/share/ReconCobra/findasn.sh") == 0) {
	print "success, file written input.txt!\n";
	}
	else {
	print "[~] Make findasn.sh in same folder\n[~] Command failed\n";
	}
}

#--------------------------------------------------------------#
#23                       Find Netblocks                       #
#--------------------------------------------------------------#
sub Findnetblock {
if (system("/usr/share/ReconCobra/netblock.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make netblock.sh in same folder\n[~] Command failed\n";
	print "[~] Did you forgot to create input.txt file for nmap\n";
	}

}

#--------------------------------------------------------------#
#24                       Capture Screenshots                  #
#--------------------------------------------------------------#
sub Capturescreenshots {
if (system("/usr/share/ReconCobra/screenshot.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make screenshost.sh in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#25                       Find Nearest Servers to Target       #
#--------------------------------------------------------------#
sub nearestvictim {
if (system("/usr/share/ReconCobra/bile.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make bile.sh in same folder\n[~] Command failed\n";
	}
}



#--------------------------------------------------------------#
#26                       Sweep Netblocks and Resolve          #
#--------------------------------------------------------------#
sub Sweepandnetblock() {
if (system("/usr/share/ReconCobra/resolve.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make resolve.sh in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#27                       Load DNS Hacking Suite Panthera      #
#--------------------------------------------------------------#
sub Panthera {
print item(), "Enter the Panthera Perl Script with path to Load: ";
$file=<STDIN>;
if (system("perl $file") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make Panthera file available in same folder\n[~] Command failed\n";
	}
}



#--------------------------------------------------------------#
#28                        Find Emails and Names               #
#--------------------------------------------------------------#
sub Findemailsandnames {
if (system("/usr/share/ReconCobra/email.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make email.sh in same folder\n[~] Command failed\n";
	}
}



#--------------------------------------------------------------#
#29                       Find Contact Information             #
#--------------------------------------------------------------#
sub Findcontactinformation {
if (system("/usr/share/ReconCobra/theharvester.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Did you forget to install the harvester\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#30                       Common Nmap Port Scan                #
#--------------------------------------------------------------#
sub Commonnmapportscan {
if (system("/usr/share/ReconCobra/nmapcommonscan.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Did you forget the make input.txt from nmap \n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#31                       Ping Hop and Firewalk                #
#--------------------------------------------------------------#
sub Pinghopandinternalnetworks {
print "\n",item(),"Peform three types of Firewalk scan";
print "\n",item(),"Results will be saved in Firewalk_results\n";
if (system("/usr/share/ReconCobra/firewalka.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Command failed\n";
	}
if (system("/usr/share/ReconCobra/firewalkb.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Command failed\n";
	}
if (system("/usr/share/ReconCobra/firewalkc.sh") == 0) {
	print item(),"Command failed\n";
	}
	else {
	print item(),"Command failed\n";
	}


}


#--------------------------------------------------------------#
#32                       Find Internal Networks and Sweep     #
#--------------------------------------------------------------#
sub Findinternalnetworkssandsweep {
$url = "https://www.shodan.io/search?query=$finss";
$request = $ua->request(HTTP::Request->new(GET => $url));
$response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("a")) {
      my @link = $p->get_trimmed_text("/a");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/i){
        print item(),"Something went wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
  }
 } 



#--------------------------------------------------------------#
#33 Decoy Scan & Generate Metasploit Data                      #
#--------------------------------------------------------------#
sub Decoayscanandgeneratemetasploitdata {
if (system("/usr/share/ReconCobra/resolve.sh") == 0) {
	print "\n",item(),"success!\n";
	}
	else {
	print "\n",item(),"Make resolve.sh in same folder\n";
	print "\n",item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#34         Find SSL Bugs & Information                        #
#--------------------------------------------------------------#
sub Findsslbugsandinformation {
print item(), "Starting SSL Info check\n\n";
    $url = "https://censys.io/domain/$fsbi";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("dl")) {
      my @link = $p->get_trimmed_text("/dl");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi){
        print item(),"Something Went Wrong\n\n";
    }
}
print "\n\n\n";
print item(), "Starting SSL protocol check\n\n";
if (system("/usr/share/ReconCobra/ssl.sh $fsbi") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n",item(),"Make ssl.sh in same folder\n";
	print "\n",item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#35             Extract Users via FTP                          #
#--------------------------------------------------------------#
sub Extractusersfromftp {
if (system("/usr/share/ReconCobra/ftp.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make ftp.sh available in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
# 36         Extract Users via POP3                            #
#--------------------------------------------------------------#
sub Extractusersfrompop3 {
if (system("/usr/share/ReconCobra/pop3.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n",item(),"Make pop3.sh in same folder\n";
	print "\n",item(),"Command failed\n";	}
}


#--------------------------------------------------------------#
# 37         Extract Users via IMAP                            #
#--------------------------------------------------------------#
sub Extractusersfromimap {
   if (system("/usr/share/ReconCobra/imap.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n",item(),"Make imap.sh in same folder\n";
	print "\n",item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
# 38         Extract Users via SMTP                            #
#--------------------------------------------------------------#
sub Extractusersfromsmtp {
     if (system("/usr/share/ReconCobra/smtp.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n",item(),"Make smtp.sh in same folder\n";
	print "\n",item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#39          Extract Users via Form                            #
#--------------------------------------------------------------#
sub Extractusersfromform {
     if (system("/usr/share/ReconCobra/http-form.sh") == 0) {
	print item(), "success!\n";
					}
	else 	{
	print "[~] Make http-form.sh available in same folder\n[~] Command failed\n";
		}
		{
print item(), "Enter the injection variable\n";
$variab=<STDIN>;

print item(), "Enter your email's first name";
$email=<STDIN>;

print item(), "Enter your email's domain";
$lastemail=<STDIN>;

     $url = "https://$variab . javascript:void(document.forms[0].to.value=$email\@lastemail)";
     $request = $ua->request(HTTP::Request->new(GET => $url));
     $response = $request->content;
     print item(),"$_\n";
		        }



#--------------------------------------------------------------#
#40   Extract Full Possible Information via SNMP                #
#--------------------------------------------------------------#
sub Extractfullpossibleinformationfromsnmp {
	print "\n", item(),"1 - Use SNMP version 1 using public string";
	print "\n", item(),"2 - Use SNMP version 1 using private string";
	print "\n", item(),"3 - Use SNMP version 2 using public string";
	print "\n", item(),"4 - Use SNMP version 2 using private string";
	print "\n", item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
     if (system("/usr/share/ReconCobra/snmp1.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n", item(),"Make snmp1.sh available in same folder";
	print "\n", item(),"Command failed";
	}
			}
	if ($enter =~2) {
     if (system("/usr/share/ReconCobra/snmp2.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n", item(),"Make snmp2.sh available in same folder";
	print "\n", item(),"Command failed";
	}
			}
	if ($enter =~3) {
     if (system("/usr/share/ReconCobra/snmp3.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n", item(),"Make snmp3.sh available in same folder";
	print "\n", item(),"Command failed";
	}
			}
	if ($enter =~4) {
     if (system("/usr/share/ReconCobra/snmp4.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n", item(),"Make snmp4.sh available in same folder";
	print "\n", item(),"Command failed";
	}
			}
}

#--------------------------------------------------------------#
#41  Extract Possible Information from Certificates            #
#--------------------------------------------------------------#
sub Extractpossibleinformationfromcertificaties {
     if (system("/usr/share/ReconCobra/crtstart.sh ") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make crt.sh available in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#42 Find Victim HTTPS Leaked Data                              #
#--------------------------------------------------------------#
sub Findvictimhttpsleakeddata  {
     if (system("/usr/share/ReconCobra/inteli.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make inteli.sh available in same folder\n[~] Command failed\n";
	}

}



#--------------------------------------------------------------#
#43Find Users via sitemap                                      #
#--------------------------------------------------------------#
sub  Findusersfromsitemap {
     if (system("/usr/share/ReconCobra/sitemap.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make sitemap.sh available in same folder\n[~] Command failed\n";
	}
}



#--------------------------------------------------------------#
#44Find Directories from robots.txt                            #
#--------------------------------------------------------------#
sub  Finddirectoriesfromrobots {
     if (system("/usr/share/ReconCobra/robots.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make sitemap.sh available in same folder\n[~] Command failed\n";
	}
}



#--------------------------------------------------------------#
#45Find all accounts by user                                   #
#--------------------------------------------------------------#
sub Findallaccountsfromuser {
    $url = "http://com.lullar.com/?q=$fafu";
    $request = $ua->request(HTTP::Request->new(GET => $url));
    $response = $request->content;

my $mech=WWW::Mechanize->new();
$mech->get($url);
my @foundLinks = $mech->find_all_links();
print "\n", item(), $_->url() for @foundLinks;


# while($response =~/<a[^>]*href="([^"]*)"[^>]*>.*<\/a>/)
#        print item(),"$1 \n";
        print color('reset');
        sleep(1);
    if ($response =~ m/^error/gi){
        print item(),"Something Went Wrong\n\n";
    }
}
}




#--------------------------------------------------------------#
#46 Facebook Intelligence Gathering email                      #
#--------------------------------------------------------------#
sub Findallaccountsfromemail  {
     if (system("/usr/share/ReconCobra/sss.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make sss.sh available in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#47 Find all tags by account                                   #
#--------------------------------------------------------------#
sub Findalltagsfromaccount {
     if (system("/usr/share/ReconCobra/fb.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make fb.sh available in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#48  DNS History                                                #
#--------------------------------------------------------------#
sub Dnshistory {
print "\n\n", item(), "Showing relevant history of A for IPV4\n\n";
    $url = "https://securitytrails.com/domain/$dnsh/history/a";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi) {
        print item(),"Something Went Wrong\n\n";
    }
}

print "\n\n", item(), "Showing relevant history of AAAA for IP6\n\n";
    $url = "https://securitytrails.com/domain/$dnsh/history/aaaa";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi) {
        print item(),"Something Went Wrong\n\n";
    }

print "\n\n", item(), "Showing relevant history of Mail Servers\n\n";
    $url = "https://securitytrails.com/domain/$dnsh/history/mx";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi) {
        print item(),"Something Went Wrong\n\n";
    }

print "\n\n", item(), "Showing relevant history of Name Servers\n\n";
    $url = "https://securitytrails.com/domain/$dnsh/history/ns";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi) {
        print item(),"Something Went Wrong\n\n";
    }


print "\n\n", item(), "Showing history of DNS Zone\n\n";
    $url = "https://securitytrails.com/domain/$dnsh/history/soa";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi) {
        print item(),"Something Went Wrong\n\n";
    }


print "\n\n", item(), "Showing history of DNS txt for human readable data\n\n";
    $url = "https://securitytrails.com/domain/$dnsh/history/txt";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi) {
        print item(),"Something Went Wrong\n\n";
    }


}
}
}
}
}

}


#--------------------------------------------------------------#
#49 Passive DNS Search                                         #
#--------------------------------------------------------------#
sub Passivednssearch {
     if (system("/usr/share/ReconCobra/passive.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "[~] Make passive.sh available in same folder\n[~] Command failed\n";
	}
}


#--------------------------------------------------------------#
#50 Use Common Crawl on Target                                 #
#--------------------------------------------------------------#
sub Usecommoncrawlontarget {
	print "\n", item(),"Download website using common crawl: ";
	print "\n", item(),"Use JSON reader to understand JSON file structure: ";
	print "\n", item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
     if (system("/usr/share/ReconCobra/common1.sh") == 0) {
	print item(), "success!\n";
	print item(), "Results are saved in json-results folder\n";
	}
	else {
	print item(), "Make common1.sh available in same folder\n";
	print item(), "Command failed\n";
	}
	}
	if ($enter =~2) {
     if (system("/usr/share/ReconCobra/common2.sh") == 0) {
	print item(), "success!\n";
	print item(), "Results are saved in json-results folder\n";
	}
	else {
	print item(), "Make common2.sh available in same folder\n";
	print item(), "Command failed\n";
	}
	}
}

#--------------------------------------------------------------#
#51 Google hostname to ip                                      #
#--------------------------------------------------------------#
sub hostnametoip {
	print item(), "Resolve results will save in ShaheenX folder\n";
	print item(), "Look for required provider with hostnametoip.txt format\n";
	print item(), "Loading\n";
	sleep(7);
     if (system("/usr/share/ReconCobra/hostnametoip.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print item(), "Make hostnametoip.sh available in same folder\n";
	print item(), "Command failed\n";
	}
}

#--------------------------------------------------------------#
#52 Reverse NS Lookup                                          #
#--------------------------------------------------------------#
sub Reversenslookup {

    $url = "https://viewdns.info/reversens/?ns=$rlu";
    $request = $ua->get($url);
    $response = $request->content;

    $p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi){
        print item(),"Something Went Wrong\n\n";
}
}
}



#--------------------------------------------------------------#
#53 Forward NS Lookup                                          #
#--------------------------------------------------------------#
sub Forwardnslookup {

    $url = "https://api.hackertarget.com/reversedns/?q=$fdl";
    $request = $ua->get($url);
    $response = $request->content;

    $p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi){
        print item(),"Something Went Wrong\n\n";
}
}
}


#--------------------------------------------------------------#
#54 Win - Extract Netbios Information                          #
#--------------------------------------------------------------#
sub Wineni {
print qq /
    Microsoft Unique Network Names
    ==============================
    00: Workstation Service workstation name
    03: Windows Messenger service
    06: Remote Access Service
    20: File Service also called Host Record
    21: Remote Access Service client
    1B: Domain Master Browser – Primary Domain Controller for a domain
    1C: Domain Controllers for a domain
    1D: Master Browser
    1E: Browser Service Elections
    /;

     if (system("nbtscan $wineni") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Command failed\n";
	}

     if (system("nmblookup -A $wineni") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Command failed\n";
	}

}


#--------------------------------------------------------------#
#55 Win - Contact & Extract Null Shares IPC$                   #
#--------------------------------------------------------------#
sub Wingensipc {
print qq /
    Microsoft Unique Network Names
    ==============================
    00: Workstation Service workstation name
    03: Windows Messenger service
    06: Remote Access Service
    20: File Service also called Host Record
    21: Remote Access Service client
    1B: Domain Master Browser – Primary Domain Controller for a domain
    1C: Domain Controllers for a domain
    1D: Master Browser
    1E: Browser Service Elections
    /;

     if (system("/usr/share/ReconCobra/smbclient1.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Command failed\n";
	}

     if (system("/usr/share/ReconCobra/enumdom.sh") == 0) {
	print item(),"success!\n";
	print item(),"Write down hexadecimals then query, e.g., queryuser 0x3e8!\n";
	}
	else {
	print item(),"Command failed\n";
	}

}


#--------------------------------------------------------------#
#56 Win - Gather Full Information via Netbios                  #
#--------------------------------------------------------------#
sub Wingfivnetbios {
     if (system("/usr/share/ReconCobra/smbvul.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print "[~] Command failed\n";
	}

    if (system("enum4linux -a $wfn") == 0) {
	print item(), "success!\n";
	}
	else {
	print item(),"Command failed\n";
	}

}


#--------------------------------------------------------------#
#57  Win - Connect to Open Netbios                              #
#--------------------------------------------------------------#
sub Winctonetbios {
     if (system("/usr/share/ReconCobra/smbclient.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Command failed\n";
	}
     if (system("/usr/share/ReconCobra/smbclient2.sh ") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Command failed\n";
	}

}





#--------------------------------------------------------------#
#58 Invisible Port Scanner                                     #
#--------------------------------------------------------------#
sub Ips {
     if (system("perl sixth.pl -d google.com -t $ips -s 1 -f 65535 -i wlan0") == 0) {
	print item(), "success!\n";
	}
	else {
	print item(),"Command failed\n";
	}

}

#--------------------------------------------------------------#
#59 Bypass Cloud Flare                                         #
#--------------------------------------------------------------#
sub Bypasscloudflare {
    my $ua = LWP::UserAgent->new;
    $ua = LWP::UserAgent->new(keep_alive => 1);
    $ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");

    $ip= (gethostbyname($cloud))[4];
    my ($a,$b,$c,$d) = unpack('C4',$ip);
    $ip_address ="$a.$b.$c.$d";
    if($ip_address =~ /[0-9]/){
        print item(),"CloudFlare IP: $ip_address\n\n";
    }

    $url = "https://dns-api.org/NS/$cloud";
    $request = $ua->get($url);
    $response = $request->content;

my %seen;
    while($response =~m/"value": "(.*?)."/g)
    {
        $ns=$1;
        next if $seen{$ns}++;
        print item(),"NS: $ns \n";
    }
    print color("bold white"),"\n";
    $url = "http://www.crimeflare.org:82/cgi-bin/cfsearch.cgi";
    $request = POST $url, [cfS => $cloud];
    $response = $ua->request($request);
    $riahi = $response->content;

    if($riahi =~m/">(.*?)<\/a>&nbsp/g){
        print item(),"Real IP: $1\n";
        $ip=$1;
    }elsif($riahi =~m/not CloudFlare-user nameservers/g){
        print item(),"These Are Not CloudFlare-user Nameservers !!\n";
        print item(),"This Website Not Using CloudFlare Protection\n";
    }elsif($riahi =~m/No direct-connect IP address was found for this domain/g){
        print item(),"No Direct Connect IP Address Was Found For This Domain\n";
    }else{
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }

    $url = "http://ipinfo.io/$ip/json";
    $request = $ua->get($url);
    $response = $request->content;

    if($response =~m/hostname": "(.*?)"/g){
        print item(),"Hostname: $1\n";
    }if($response =~m/city": "(.*?)"/g){
        print item(),"City: $1\n";
    }if($response =~m/region": "(.*?)"/g){
        print item(),"Region: $1\n";
    }if($response =~m/country": "(.*?)"/g){
        print item(),"Country: $1\n";
    }if($response =~m/loc": "(.*?)"/g){
        print item(),"Location: $1\n";
    }if($response =~m/org": "(.*?)"/g){
        print item(),"Organization: $1\n";
    }
}


#--------------------------------------------------------------#
#60 DNS Cached Records                                         #
#--------------------------------------------------------------#
sub Dnscachedrecords {
    $url = "http://mega-check.com/index.php?fCached=$dnscache&sCached=A	";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
      
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Target Address\n";
    }
}
}


#--------------------------------------------------------------#
#61 Bypass Content Management Systems WAF Firewall             #
#--------------------------------------------------------------#
sub Cmswaffirewall {
    $url = "http://www.abuseipdb.com/tools/ip-address-converter?ip=$cmswaf";
#    $url = "http://dnstools.fastnext.com/index.php?fDecIP=$cmswaf";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
      
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter IP Address\n";
    }
}

my ($a, $b, $c, $d)=($cmswaf=~/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/);
print item(),"IP ", $cmswaf." is hexadecimal ".convert($a).convert($b).convert($c).convert($d), "\n";
sub convert
{
        my ($dec)=@_;
        my $hex = sprintf("%x", $dec);
        $hex=length($hex) == 1 ? "0".$hex : $hex;
        return (uc($hex));
        
}

print item(),"IP for binary conversion is: "; 
system("/usr/share/ReconCobra/ip2bin.sh");


}



#--------------------------------------------------------------#
#	62 Shared NS				               #
#--------------------------------------------------------------#
sub SharedNS {
    $url = "https://www.robtex.com/dns-lookup/$sharedns";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("td")) {
      my @link = $p->get_trimmed_text("/td");
      foreach(@link)
      # { print "$_\n"; }
      
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ m/^error/gi){
        print item(),"Something Went Wrong\n\n";
    }
}
}


#--------------------------------------------------------------#
#63 Master Domain Subdomains Subnet Enumeration                #
#--------------------------------------------------------------#
sub MDSSE {
    print item(),"1 - Enumerate Subdomains Subnet IP of Domain\n";
	print item(),"2 - Scan commong ports of subdomains subnet using nmap via file\n";
	print item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
     if (system("/usr/share/ReconCobra/mdsse.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print item(),"Make mdsse.sh available in same folder\n";
	print item(),"Command failed\n";
	}
	}
if ($enter =~2)  {
     if (system("/usr/share/ReconCobra/nmapasnlookup.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print item(),"Make nmapasnlookup.sh available in same folder\n";
	print item(),"Command failed\n";

	}
	}
}


#--------------------------------------------------------------#
#64 Domain Certificate Subdomain Enumeration                   #
#--------------------------------------------------------------#
sub DomainCertificate() {
	print item(),"1 - CRT Certificate Search\n";
	print item(),"2 - Google Transparency Certificate Search\n";
	print item(),"3 - Certspotter Certificate Search\n";
	print item(),"4 - Entrust Certificate Search\n";
	print item(),"Enter Certificate Search Engine: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
     if (system("/usr/share/ReconCobra/crtstart.sh") == 0) {
	print item(),"success! Find results at crt folder\n";
	}
	else {
	print item(),"Make crtstart.sh available in same folder\n";
	print item(),"Command failed\n";

	}
}
if ($enter =~2)  {
     if (system("/usr/share/ReconCobra/googlegct.sh") == 0) {
	print item(),"success! Find results at crt folder\n";
	}
	else {
	print item(),"Make googlegct.sh available in same folder\n";
	print item(),"Command failed\n";

	}
}

if ($enter =~3)  {
     if (system("/usr/share/ReconCobra/certspot.sh") == 0) {
	print item(),"success! Find results at crt folder\n";
	}
	else {
	print item(),"Make certspot.sh available in same folder\n";
	print item(),"Command failed\n";

	}
}

if ($enter =~4)  {
     if (system("/usr/share/ReconCobra/entrust.sh") == 0) {
	print item(),"success! Find results at crt folder\n";
	}
	else {
	print item(),"Make entrust.sh available in same folder\n[~] Command failed\n";
	}
}

}


#--------------------------------------------------------------#
#65   Find Subdomains using API Searcher                       #
#--------------------------------------------------------------#
sub Apisubdomain() {
	print item(),"1 - Security Trails API Search\n";
	print item(),"2 - Censys API Search\n";
	print item(),"3 - Virustotal API Search\n";
	print item(),"Enter API Search Engine: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
     if (system("/usr/share/ReconCobra/vasl.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make vasl.sh available in same folder\n[~] Command failed\n";
	}
}
if ($enter =~2)  {
     if (system("/usr/share/ReconCobra/censys.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make censys.sh available in same folder\n[~] Command failed\n";
	}
}
if ($enter =~3)  {
     if (system("/usr/share/ReconCobra/virustotal.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make censys.sh available in same folder\n[~] Command failed\n";
	}
}
}


#--------------------------------------------------------------#
#66   Find Cname Information of netblock                       #
#--------------------------------------------------------------#
sub Cname() {
	print item(),"Enter desired subnet/ip/net-block or cidr for cname information\n";
	print item(),"Loading\n";
	sleep(5);
     if (system("/usr/share/ReconCobra/cname.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make cname.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#67   Extraction Endpoints		                       #
#--------------------------------------------------------------#
sub endpoints() {
     if (system("/usr/share/ReconCobra/endpoint_extraction.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in endpoint_extraction_results folder\n";
	}
	else {
	print item(),"Make endpoint_extraction.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#68   Testing CORS			                       #
#--------------------------------------------------------------#
sub cors() {
     if (system("/usr/share/ReconCobra/cors.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make cors.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#69   Wayback URL Download			               #
#--------------------------------------------------------------#
sub wayback() {
	print item(),"Catuion: Downloading URL may take a while\n";
     if (system("/usr/share/ReconCobra/wayback.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in wayback_results folder\n";
	}
	else {
	print item(),"Make wayback.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#70   Link Finder				               #
#--------------------------------------------------------------#
sub linkfinder() {
	print item(),"Catuion: Downloading JS files may take a while\n";
	print item(),"1 - Use JS Crawler and Downloader\n";
	print item(),"2 - Use LinkFinder\n";
	print item(),"3 - Extract Endpoints and API using downloaded js files\n";
	print item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
     if (system("/usr/share/ReconCobra/linkfinder1.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in js_linkfinder at results folder\n";
	}
	else {
	print item(),"Make linkfinder1.sh available in same folder\n";
	print item(),"Command failed\n";
	}
	}
	if ($enter =~2) {
     if (system("/usr/share/ReconCobra/linkfinder2.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in LinkFinder folder\n";
	}
	else {
	print item(),"Make linkfinder2.sh available in same folder\n";
	print item(),"Command failed\n";
	}
	}
	if ($enter =~3) {
     if (system("/usr/share/ReconCobra/linkfinder3.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in LinkFinder folder\n";
	}
	else {
	print item(),"Make linkfinder3.sh available in same folder\n";
	print item(),"Command failed\n";
	}
	}

}


#--------------------------------------------------------------#
#71  Goe-Cordinates Tracking                                   #
#--------------------------------------------------------------#
sub geotagging() {
	print item(),"Caution: This works only if files have enabled GPS by default\n";
	print item(),"Caution: Files that are any type of pictures, audio and video will work\n";
	print item(),"Caution: Option 2 and 3 requires all files into geotagging_crawler folder\n";
	print item(),"1 - Crawl and download all GPS and Location related files\n";
	print item(),"2 - Extract GPS cordintes from local files\n";
	print item(),"3 - Extract Location cordinates from local files\n";
	print item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
     if (system("/usr/share/ReconCobra/cobc.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in geotagging_crawler folder\n";
	}
	else {
	print item(),"Make cobc.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
	if ($enter =~2) {
     if (system("/usr/share/ReconCobra/cobd.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in geotagging_crawler folder\n";
	}
	else {
	print item(),"Make cobd.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
	if ($enter =~3) {
     if (system("/usr/share/ReconCobra/cobe.sh") == 0) {
	print item(),"success!\n";
	print item(),"Results are saved in geotagging_crawler folder\n";
	}
	else {
	print item(),"Make cobe.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
}


#--------------------------------------------------------------#
#72   Mirror Complete Website		                           #
#--------------------------------------------------------------#
sub mireer() {
	print item(),"Caution: Find mirror_websites inside mirror_website folder\n";
     if (system("/usr/share/ReconCobra/mireer.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make mireer.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#73   Brute Frocer Module		         		               #
#--------------------------------------------------------------#
sub bruter() {
	print item(),"1 - Start Bruter\n";
	print item(),"2 - Capture Xwindows Information\n";
	print item(),"3 - Start Xwindows Screen Capture\n";
	print item(),"4 - Start Xwindows Keystroke Capture\n";
	print item(),"5 - Takeover Xwindows\n";
	print item(),"6 - Special Screen Capturing Payload for X11\n";
	print item(),"Enter Search Engine: ";
	chomp($enter=<STDIN>);
if ($enter =~1) {
     if (system("/usr/share/ReconCobra/bruter.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make bruter.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
if ($enter =~2) {
	if (system("/usr/share/ReconCobra/xwin.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make xwin.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
	if ($enter =~3) {
		if (system("/usr/share/ReconCobra/xwin1.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make xwin1.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
		if ($enter =~4) {
			if (system("/usr/share/ReconCobra/xwin2.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make xwin2.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
		if ($enter =~5) {
			if (system("/usr/share/ReconCobra/xwin3.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make xwin3.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}
		if ($enter =~6) {
			if (system("/usr/share/ReconCobra/xwin4.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make xwin4.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}

}


#--------------------------------------------------------------#
#74  Juicy Port Scan using Mascan            	               #
#--------------------------------------------------------------#
sub mascan() {
	print "\n";
	print item(),"Result will be saved in mascanresults.txt\n\n";
     if (system("/usr/share/ReconCobra/mascan.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make mascan.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}

#--------------------------------------------------------------#
#75  Set Daisy Chain                        	               #
#--------------------------------------------------------------#
sub daisychain() {
	print "\n";
	print item(),"Caution \n";
	print item(),"Edit /etc/proxychains.conf and put these proxies after [Proxy List]\n";
	print item(),"Write as socks4 IP Port or http IP Port as per line\n";
	print item(),"Use proxychains before any software in terminal, example proxychains nmap, etc\n";
	print item(),"Proxy list will generate new proxy every 15 minutes\n\n";
	print item(),"Generating Proxy List\n";
    $url = "http://proxylist.fatezero.org/proxy.list";
    $request = $ua->get($url);
    $response = $request->content;

 while($response =~m/(.*?)\n/g)
    {
        print item(),"$1 \n";
        sleep(1);
    }
if ($response =~ /error/) {
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter Website Without HTTP/HTTPs\n";
    }
}


#--------------------------------------------------------------#
#76  Search PHPinfo and Database Log via Search Engines        #
#--------------------------------------------------------------#
sub pdatabase() {
	print "\n";
    if (system("/usr/share/ReconCobra/useddatabasefiles.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make useddatabasefiles.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#77  File Encryption								           #
#--------------------------------------------------------------#
sub encrypt() {
	print "\n";
    if (system("/usr/share/ReconCobra/ccrypt.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make ccrypt.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}

#--------------------------------------------------------------#
#78  Load Encryption Scrambling for Antivirus Evasion          #
#--------------------------------------------------------------#
sub scrambler() {
	print "\n";
	print item(),"Hint: Type bypassing in Encrypt Shellcode\n";
    if (system("/usr/share/ReconCobra/scrambler.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make scrambler.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}

#--------------------------------------------------------------#
#79 Load Wi-Fi Takeover Module                                 #
#--------------------------------------------------------------#
sub wifi() {
	print "\n";
    if (system("/usr/share/ReconCobra/wifi-hacker.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make wifi-hacker.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#81 Load Routers/Load Balancer Interface                       #
#--------------------------------------------------------------#
sub router() {
	print "\n";
	print item(),"Hint: https://null-byte.wonderhowto.com/how-to/seize-control-router-with-routersploit-0177774\n";
    if (system("/usr/share/ReconCobra/router.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make router.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}


#--------------------------------------------------------------#
#82 Tracert Visual Machine Mapper                              #
#--------------------------------------------------------------#
sub mapperr() {
	print "\n";
    if (system("/usr/share/ReconCobra/mapper.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make mapper.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}

#--------------------------------------------------------------#
#                            Enter                             #
#--------------------------------------------------------------#
sub enter {
    print "\n";
    print item(),"Press ";
    print color('bold red'),"[";
    print color("bold white"),"ENTER";
    print color('bold red'),"] ";
    print color("bold white"),"To Continue\n";

    local( $| ) = ( 1 );

    my $resp = <STDIN>;
    banner();
    menu();
}

#--------------------------------------------------------------#
#                             Format                           #
#--------------------------------------------------------------#
sub item
{
    my $n = shift // '!';
    return color('bold red')," ["
    , color('bold green'),"$n"
    , color('bold red'),"] "
    , color("bold white")
    ;
}

sub line_u
{
    return 
    color('bold cyan'),"#-------------------------------------------------------------# \n",
    "#                                                             # \n";
    
}

sub line_d
{
    return
    color('bold cyan'),"#                                                             # \n",
    color('bold cyan'),"#-------------------------------------------------------------# ",
    "                                                                    ";
}
#--------------------------------------------------------------#
#                          ~~The End~~                         #
#--------------------------------------------------------------#

