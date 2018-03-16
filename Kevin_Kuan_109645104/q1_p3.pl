# Kevin Kuan
# 109645104
# CSE 3337 HW 2

use strict;
use warnings;
use diagnostics;

my $file = "passwd.txt";

my %hash;
open my $my_file, $file or die "Could not open $file: $!";
while (my $line = <$my_file>){
	my @my_list = split(/:/, $line);
	if (exists($hash{$my_list[3]})){
		$hash{$my_list[3]}++;
	}
	else{
		$hash{$my_list[3]}=0;
	}
}

foreach my $key (keys %hash){
	print "group $key has $hash{$key} users\n"
}