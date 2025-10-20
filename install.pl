#!/usr/bin/perl

use strict;
use warnings;

foreach my $file (qw/tailscale tailscaled/){

    next unless -f $file;
    system("mv $file /usr/sbin/$file") if -f $file;

}

system('mv systemd/tailscaled.service /etc/systemd/system/tailscaled.service') if -f 'systemd/tailscaled.service';
system('mv systemd/tailscaled.defaults /etc/default/tailscaled') if -f 'systemd/tailscaled.defaults';

system('systemctl daemon-reload');
system('systemctl enable --now tailscaled');