# Kevin Kuan
# 109645104
# CSE 3337 HW 2

use strict;
use warnings;
use diagnostics;

my $file = "passwd.txt";
open my $my_file, $file or die "Could not open $file: $!";

while (my $line = <$my_file>){
	my @my_list = split(/:/, $line);
		if ($my_list[2] % 2 == 0){
			print ("$my_list[0], $my_list[2] \n");
	}
}
