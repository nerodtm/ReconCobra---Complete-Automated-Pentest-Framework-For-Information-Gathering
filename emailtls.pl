#!/usr/bin/perl -w
use strict;
use LWP::UserAgent;
use HTTP::Request::Common;
use XML::XPath;

$domain=<STDIN>;
my $ua = LWP::UserAgent->new;
my $request = POST( 'https://www.checktls.com/TestReceiver', [
	CUSTOMERCODE =>	'$domain',
	CUSTOMERPASS =>	'IllNeverTell',
	EMAIL =>	'test@CheckTLS.com',
	LEVEL =>	'XML_DETAIL',
] );
my $response = $ua->request($request);
unless( $response->is_success) {
     print $response->status_line;
}
my $XML = $response->content();
my $xp = XML::XPath->new(xml => $XML);
print 'Target = ' . $xp->find('/CheckTLS/eMailAddress') . "\n";
print 'Score = ' . $xp->find('/CheckTLS/ConfidenceFactor') . "\n";
my $nodeset = $xp->findnodes('/CheckTLS/MX');
print 'MX Count = ' . $nodeset->get_nodelist() . "\n";
foreach my $mx ($nodeset->get_nodelist()) {
	print 'MX = ' . $mx->find('@exchange') . "\n";
	print 'MX SSL Version = ' . $mx->find('SSL/SSLVersion') . "\n";
}
print 'MX1.Cert1.Subject.commonName = ' . $xp->find('/CheckTLS/MX[1]/SSL/Certs/Cert[1]/Subject/commonName') . "\n";