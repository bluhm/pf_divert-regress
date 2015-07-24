# test divert-reply with raw ip

use strict;
use warnings;
use Socket;

our %args = (
	socktype => Socket::SOCK_RAW,
	protocol => 254,
	skip => sub { shift->{af} eq "inet" ? 20 : 0 },
	client => {
	    func => sub {
		my $self = shift;
		write_datagram($self);
		read_datagram($self);
	    },
	},
	server => {
	    func => sub {
		my $self = shift;
		read_datagram($self);
		write_datagram($self);
	    },
	},
	divert => "reply",
);
