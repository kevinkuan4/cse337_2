# Kevin Kuan
# CSE 337
# Homework 2

use strict;
use warnings;


sub find_in_file {
	my $filename = $_[0];
	open (my $fh, "<", $filename) or die "Can't open $filename: $!";
	
	
}

my @dir_list;
print "What string do you want to search for?\n";
my $usr_input = <STDIN>;

opendir (my $dir, "./") or die "Can't open directory :$!";

my @files = readdir $dir;
closedir $dir;

print @files[0];
