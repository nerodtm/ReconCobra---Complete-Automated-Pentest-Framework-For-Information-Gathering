#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

use WWW::Mechanize;
my $w = WWW::Mechanize->new();
$w->get('http://www.google.com/');
$w->submit_form(
    fields => {
        q => 'test automation using perl'
    },
);
$w->follow_link( n => 5 );
say $w->title;