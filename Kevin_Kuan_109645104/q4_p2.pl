# Kevin Kuan
# CSE 337
# Homework 2

use strict;
use warnings;

my %file_hash;


my @dir_list;
print "What string do you want to search for?\n";
my $usr_input = <STDIN>;
chomp $usr_input;
opendir (my $dir, "./") or die "Can't open directory :$!";

my @files = readdir $dir;
closedir $dir;

sub find_in_file {
	my $filename = $_[0];
	open (my $fh, "<", $filename) or die "Can't open $filename: $!";
	while (<$fh>){
		if ($_ =~ /$usr_input/){
			 $file_hash{$filename}="";
			 last;
		}
	}
}
foreach my $file (@files){
	find_in_file($file);
}

foreach my $key (keys %file_hash){
	$file_hash{$key}.= "e" if (-e $key);
	$file_hash{$key}.= "r" if (-r $key);
	$file_hash{$key}.= "w" if (-w $key);
	$file_hash{$key}.= "x" if (-x $key);
	$file_hash{$key}.= "T" if (-T $key);
	print "Found \"$usr_input\" in file $key............$file_hash{$key}\n";

}
