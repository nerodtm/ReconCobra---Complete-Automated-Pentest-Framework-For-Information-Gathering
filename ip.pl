#!/usr/bin/perl 
use Net::RawIP qw(:pcap);
require 'getopts.pl';

# Proof of concept thingum, for AntiRez's scanning through 
# host ip ID's - Allows for totally invisible port scan
# Select dummy_ip where dummy_IP is a host on the internet, that
# isn't actively communicating (or even one thats communicating, but 
# very consistantly

$a = new Net::RawIP ({tcp =>{}});
$b = new Net::RawIP;
$c = new Net::RawIP;

Getopts('d:t:s:f:i:p', \my %opts);

$dummy = $opt_d;
$target = $opt_t;
$startport = $opt_s;
$device = $opt_i;
$device = 'wlan0' if($device eq "");
($opt_f == "") ? ($finalport = $startport) : ($finalport = $opt_f);

$my_int=${ifaddrlist()}{$device};

 unless ($opt_d && $opt_t && $opt_s )
	{
	print "\nUsage $0 -d <dumb_host> -t <target> -s <start port> -f <final port> -i <interface>\n";
	exit;
	}

print "\n Launching SixthSense by MH\n\n";
print " Dummy     : $dummy\n Target    : $target\n";
print " Device    : $device\n Startport : $startport\n";
print " Endport   : $finalport\n";

# Initiate lipbcap 
$filt = 'ip proto \\tcp and dst '.$my_int.' and src '.$dummy;
$size = 1500;
$tout = 30;
$pcap = $a->pcapinit($device,$filt,$size,$tout);
$offset = linkoffset($pcap);

	print "\nScanning Dumb Host \(for Dumbness\)\n";

	for($m=0;$m<4;$m++){sleep 1;&send_packet;loop $pcap,1,\&dmp,\@a;}
	&dumb_scan;

	if($winner==1){
	for ($j=$startport;$j<$finalport+1;$j++)
		{
		undef @seqs;
		$port = $j;
		for($m=0;$m<4;$m++){sleep 1;&send_packet;&send_bad_packet($port);loop $pcap,1,\&dmp,\@a;}
		&post_spoof;
		}
			} 

sub dmp{
	$a->bset(substr($_[2],$offset));
	my ($eyedee) = $a->get({ip => [qw(id)]});
	printf(" %u\n",$eyedee);
	push(@seqs,$eyedee);
}

sub dumb_scan{
	# Make sure u have 4 non 0 id's before going on
        do{sleep 1;}while($seqs[3]==0 || $seqs[2]==0 || $seqs[1]==0 || $seqs[0]==0);

        # Check consistancy of ip id increments 
        if($seqs[3]-$seqs[2] == $seqs[2]-$seqs[1]
        && $seqs[2]-$seqs[1] == $seqs[1]-$seqs[0])
                {
                 $diff = $seqs[2]-$seqs[1];
                 print "\nWe Have a consistant ",$diff," increment host\n";
                 print "*** Injecting Spoofed Packet ***\n\n";
                 undef @seqs;
                 $winner=1;
                }
        else   {print "\n\n Dumb host not dumb enough... exiting..\n\n";}
}

sub post_spoof{
	# Make sure we have 4 non-zero id's	
        do{sleep 1;}
        while($seqs[3]==0 || $seqs[2]==0 || $seqs[1]==0 || $seqs[0]==0);

	# Check if id increments remained constant, despite our spoofed
	# packet 
        if($seqs[3]-$seqs[2] == $seqs[2]-$seqs[1] &&
        $seqs[2]-$seqs[1] == $seqs[1]-$seqs[0] &&
        $seqs[2]-$seqs[1] == $diff)
        {print "\nNope... doesnt look like $port is open on $target \n\n";}
        else {
		print "\n*** Yup looks like $port is open on $target ***\n\n";
		push(@disoop,$port);
		}
}

sub send_packet{
		$b->set({ ip => {saddr => $my_int,
                daddr => $dummy},tcp=> {dest => 0,
                source => 0, ack_seq => "0",}});
		$b->send;
}

sub send_bad_packet{
		$c->set({ ip => {saddr => $dummy,
                daddr => $target},tcp=> {dest => $port,
                source => '80',psh => 1,
		syn => 1}});
		$c->send;
}		

sub END{
	if($winner==1 && @disoop != ""){
	print " *** ";
	foreach(@disoop){print "$_ ";}
	print " appear to b open on $target\n\n";
	}
}