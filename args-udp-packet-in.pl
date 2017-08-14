# test divert-packet input rule with udp

use strict;
use warnings;

our %args = (
    protocol => "udp",
    client => { func => \&write_datagram, noin => 1, },
    packet => {
	func => sub {
	    my $self = shift;
	    my $packet;
	    read_datagram($self, \$packet);
	    my $hex = unpack("H*", $packet);
	    print STDERR "<<< $hex\n";
	    $packet =~ s/Client/Packet/;
	    $self->{toaddr} = "127.0.0.1";
	    write_datagram($self, $packet);
	    $hex = unpack("H*", $packet);
	    print STDERR ">>> $hex\n";
	},
	in => "Client",
    },
    server => {
	func => \&read_datagram,
	in => "Packet",
	noout => 1,
    },
    divert => "packet-in",
);
