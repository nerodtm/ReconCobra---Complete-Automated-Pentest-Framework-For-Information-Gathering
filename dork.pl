#!/usr/bin/perl
#Google Search  Tool .
#sh0utz: oTo + #slotin + #bhf @ irc.bluehell.org  - we 0wn your f4ce! ;p
#Written by dni
#much thanks to TuXeD & Syn4ps3 for their help ;)

use LWP::UserAgent;

@google = ("www.google.com","www.google.ae","www.google.at","www.google.be","www.google.ca","www.google.ch","www.google.cl","www.google.co.cr","www.google.co.hu","www.google.co.il","www.google.co.jp","www.google.co.kr","www.google.co.nz","www.google.co.th","www.google.co.uk","www.google.co.ve","www.google.com.ar","www.google.com.au","www.google.com.br","www.google.com.gr","www.google.com.hk","www.google.com.mx","www.google.com.ni","www.google.com.pa","www.google.com.pe","www.google.com.pr","www.google.com.py","www.google.com.ru","www.google.com.sg","www.google.com.tj","www.google.com.tr","www.google.com.tw","www.google.com.ua","www.google.com.uy","www.google.de","www.google.dk","www.google.es","www.google.fi","www.google.fr","www.google.gl","www.google.ie","www.google.it","www.google.kz","www.google.lv","www.google.nl","www.google.pl","www.google.uz");

@google2 = ("(U.S)","(Emiratos Arabes)","(Austria)","(Belgica)","(Canada)","(Suiza)","(Chile)","(Costa Rica)","(Hungria)","(Israel)","(Japon)","(Corea)","(Nueva Zelanda)","(Tailandia)","(Reino Unido)","(Venezuela)","(Argentina)","(Australia)","(Brasil)","(Grecia)","(Hong Kong)","(Mexico)","(Nicaragua)","(Panama)","(Peru)","(Puerto Rico)","(Paraguay)","(Rusia)","(Singapur)","(Tajikistan)","(Turquia)","(Taiwan)","(Ucrania)","(Uruguay)","(Alemania)","(Dinamarca)","(Espana)","(Finlandia)","(Francia)","(Groelandia)","(Irlanda)","(Italia)","(Kazajistan)","(Letonia)","(Holanda)","(Polonia)","(Uzbekistan)");


if(!$ARGV[0])
{
        print "Usage: perl d0rk.pl <query> <google-search> \n";
        print "perl $0 \"Powered by your mom\" www.google.nl\n";
        print "Now you must enter your query: ";
        $param0=<STDIN>;
}
if(!$ARGV[1]) {
        print "perl $0 <query> <google-host>\n";
        print "perl $0 \"Powered by your mom\" www.google.nl\n";
        print "Stand by for a list of google engines:..\n";
        $i=0;
        while ($i < scalar(@google))
        {
                printf "$i. %-15s %-15s   ", $google[$i],  $google2[$i];
                $m = ($i+1) % 3;
                if ($m == 0 && $i != 0) { print "\n";}
                $i++;               
        }

print "\nJust press the number of the Search Engine you are going to use and then press ENTER: ";
$aux=<STDIN>;
$param1 = $google[$aux];
}
else
{
     $param1 = $ARGV[1];
}

if ($ARGV[0]) { $param0 = $ARGV[0];}
$query = $param0;
print "Searching $param1 for: $query\n";
sleep 2;
$counter = 0;
$ua = new LWP::UserAgent;
$ua->timeout(30);
$ua->agent(" Mozilla/5.0 (0wn3d; U; PPC Sik OS XXX Mach-O; en-US; rv:1.8.1) Gecko/20061010 Firefox/2.0");
$a=0;

while($results !~ /results/) {
$url = "http://$param1/search?q=\"$query\"&hl=id&lr=&start=$a&sa=N";
$response = $ua->get($url);
$counter=$counter+10;
if(!($response->is_success)) {
        print ($response->status_line. "     Error! \n"); }
else {
        @results = $response->as_string;
        $results= "@results";

while($results =~ m/<a class=l href=\"(.*?)\">.*?<\/a>/g)
{

        $results1 =~ s/<a class=l href=\"(.*?)\"> .*?<\/a>/$1/;
        $host =$1;
        print "$host\n";
        open (OUT, ">>scan_results.txt");
        print OUT "$host\n";
        close(OUT);
}

$a = $a + 10;
     }

}

print "Results saved to scan_results.txt\n";