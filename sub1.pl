#!/usr/bin/perl 
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

# CODE START ######
my $ua = LWP::UserAgent->new;
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
print color("bold Green"),"  \n\n        Enter domain: ";
chomp($site8=<STDIN>);

if ($site8) { subdomain(); }
sub subdomain {
    $url = "https://www.pagesinventory.com/search/?s=$site8";
    $request = $ua->get($url);
    $response = $request->content;

    $ip= (gethostbyname($site8))[4];
    my ($a,$b,$c,$d) = unpack('C4',$ip);
    $ip_address ="$a.$b.$c.$d";
    if($response =~ /Search result for/){
        print "Website: $site8\n";
        print "IP: $ip_address\n\n";

        while($response =~ m/<td><a href=\"\/domain\/(.*?).html\">(.*?)<a href="\/ip\/(.*?).html">/g ) {
            print "Subdomain: $1\n";
            print "IP: $3\n";
            open(OUT, ">>subdomains_links.txt"); print OUT "$1\n, $3\n"; close(OUT);
            sleep(1);
        }
    }elsif($ip_address =~ /[0-9]/){
        if($response =~ /Nothing was found/){
            print ,"Website: $site8\n";
            print ,"IP: $ip_address\n";
            print ,"No Subdomains Found For This Domain\n";
        }}else {
        print "\nThere Is A Problem\n";
    }
}