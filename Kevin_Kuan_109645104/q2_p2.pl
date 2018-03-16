# Kevin Kuan
# 109645104
# CSE 3337 HW 2

# Prints textfile lines in increasing order 
use strict;
use warnings;

my $filename = $ARGV[0];
my $fh;
open $fh, "<$filename" or die "Can't open input file: $!";
