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

use HTML::TokeParser;
use Mojo;
use Mojo::DOM;
use HTML::TokeParser;
use HTTP::Request;
use LWP::Simple;
use LWP::UserAgent;
use IO::Socket::INET;
use Term::ANSIColor;
use IO::Select;
use HTTP::Response;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use URI::URL;
use feature ':5.10';
use LWP::UserAgent;
no warnings 'uninitialized';
use Term::ANSIColor;
use Data::Validate::Domain qw(is_domain);

system "clear";
print color('bold red');
print "\n\n					   	 	    Project\n";
print "\n 						          : ShaheenX :\n\n\n";
print color('bold yellow');
print "[ + ] Programmer: 	Haroon Awan\n";
print "[ + ] License: 		EULA\n";
print "[ + ] Version: 		1.0\n";
print "[ + ] Contact: 		mrharoonawan\@gmail\.com \n";
print "[ + ] Environment: 	Shell & Perl for Debian/Kali\n";
print "[ + ] Github: 		Https://www.github.com/haroonawanofficial\n";
print "[ + ] Design Scheme: 	Get meta data from google\n";
print "[ + ] Usage: 		Read README.MD before using\n\n\n";
print color('reset');
print color("bold white"),"[ + ]  1 - Download Meta Data from Bing Search Engine\n";
print color("bold white"),"[ + ]  2 - Download Meta Data from Google Search Engine\n";
print color("bold white"),"[ + ] Enter desired search engine option: ";
print color("green");
print color 'reset';
chomp($name=<STDIN>);

if ($name=~ "1")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);
#$ag->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36");
#Extra user-agent in case, google block any kind of request

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name only: ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";


# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=2000; $i+=10) {
 $url = "https://www.bing.com/search?q=site%3A$dork+ext:xml | ext:conf | ext:cnf | ext:reg | ext:inf | ext:pdf | ext:rdp | ext:cfg | ext:txt | ext:ora | ext:ini | ext:doc | ext:docx | ext:odt | ext:pdf | ext:rtf | ext:sxw | ext:psw | ext:ppt | ext:pptx | ext:pps | ext:csv&filt=all&first=$i&FORM=PERE";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/Enter captcha/i) {
print "[!] Error: Bing is blocking our requests, change your IP and clear cache [!]\n\n";
exit;
}
else {}

$p = HTML::TokeParser->new(\$rrs);
  while ($p->get_tag("cite")) {
      my @link = $p->get_trimmed_text("/cite");
      foreach(@link) { print "$_\n"; }
      open(OUT, ">>metacrawler_bingfiles.txt"); print OUT "@link\n"; close(OUT);
  }
 } 
print "[+] Finished enumerating Bing\n";
$cleaner = system("./cob_a.sh");
exit;
}


if ($name=~ "2")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name : ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";


# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=2000; $i+=10) {
#$url = "https://google.com/search?q=site%3A$dork.com+ext:xml | ext:conf | ext:cnf | ext:reg | ext:inf | ext:pdf | ext:rdp | ext:cfg | ext:txt | ext:ora | ext:ini | ext:doc | ext:docx | ext:odt | ext:pdf | ext:rtf | ext:sxw | ext:psw | ext:ppt | ext:pptx | ext:pps | ext:csv&btnG=Search&hl=en-US&biw=&bih=&gbv=1&start=$i&filter=0";
$url = "https://google.com/search?q=site%3A$dork+ext:xml+%7C+ext:conf+%7C+ext:cnf+%7C+ext:reg+%7C+ext:inf+%7C+ext:pdf+%7C+ext:rdp+%7C+ext:cfg+%7C+ext:txt+%7C+ext:ora+%7C+ext:ini+%7C+ext:doc+%7C+ext:docx+%7C+ext:odt+%7C+ext:pdf+%7C+ext:rtf+%7C+ext:sxw+%7C+ext:psw+%7C+ext:ppt+%7C+ext:pptx+%7C+ext:pps+%7C+ext:csv&btnG=Search&hl=en-US&biw=&bih=&gbv=1&start=$i&filter=0";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/Our systems have detected unusual traffic/i) {
print "[!] Error: Google is blocking our requests, change your IP and clear cache [!]\n\n";
exit;
}
else {}

$p = HTML::TokeParser->new(\$rrs);
  while ($p->get_tag("cite")) {
      my @link = $p->get_trimmed_text("/cite");
      foreach(@link) { print "$_\n"; }
      open(OUT, ">>metacrawler_googlefiles.txt"); print OUT "@link\n"; close(OUT);
  }
 } 
print "[+] Finished enumerating Google\n";
$cleaner = system("./cob_b.sh");
exit;
}
