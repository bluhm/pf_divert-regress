# test divert-packet input rule with udp

use strict;
use warnings;

our %args = (
    protocol => "udp",
    client => { func => \&write_datagram, noin => 1, },
    packet => { func => \&read_datagram },
    server => { func => \&read_datagram, noout => 1, },
    divert => "packet-in",
);
