#!/usr/bin/env perl

use strict;
use warnings;

my $perl_version  = '5.32.1';
my %core_modules;
my $filename;
my $log_dir = '/var/tmp';
my $log_file = 'cpanm_log';

if ( $ARGV[0] ){
  $filename = $ARGV[0];
} else {
  print "No file given.\n";
  exit(1);
}

foreach my $corelist_line ( `corelist -v $perl_version` ){
  chomp($corelist_line);
  next unless($corelist_line);
  my ($module, $version) = split(/\s+/, $corelist_line);
  $core_modules{$module} = $version // 1;
}

open my $file_fh, '<', $filename or die "Can't open $filename: $!";
for my $line ( <$file_fh> ){
  chomp($line);
  print "cpanm $line >> $log_dir/${log_file}_\`date +%Y%m%d%H%M\`.log 2>&1\n" 
    unless $core_modules{$line};
}

