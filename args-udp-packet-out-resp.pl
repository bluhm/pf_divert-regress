# test divert-packet output rule with udp response packet

use strict;
use warnings;

our %args = (
    protocol => "udp",
    client => {
	func => \&write_read_datagram,
	in => "Packet",
    },
    packet => {
	func => \&read_write_packet,
	in => "Server",
    },
    server => {
	func => \&read_write_datagram,
    },
    divert => "packet-out-resp",
);
