#!/usr/bin/perl 


use strict;

use Test::More tests => 1;
use SMS::Send;

# Borrowed from SMS::Send::AU::Vodafone
sub dies_like {
	my ($code, $regexp) = (shift, shift);
	eval { &$code() };
	like( $@, $regexp, $_[0] || "Dies as expected with message like $regexp" );
}

my $sender = SMS::Send->new( 'RedOxygen',
		_accountid  => 'CI00000000',
		_email      => 'some@example.com',
		_password   => 'foobarbaz'
	);

# Why can the response be 2103 Blacklisted? RedOxygen can't tell me as they insist that isn't
# a message they emit, yet it appears in the wild on some CPAN test hosts and it's come from
# their servers. For now just treat it as acceptable.
dies_like(
	sub { $sender->send_sms( text => 'Test message', to => '+(61) 444 444 444' ); },
	qr/(2001 The Red Oxygen database does not recognise your email address|2103 Blacklisted)/
);
