# test divert-reply with icmp

use strict;
use warnings;
use Socket;

our %args = (
	socktype => Socket::SOCK_RAW,
	protocol => sub { shift->{af} eq "inet" ? "icmp" : "icmp6" },
	client => { func => \&write_icmp_echo, out => "ICMP", noin => 1, },
	# no server as our kernel does the icmp reply automatically
	divert => "reply",
);
