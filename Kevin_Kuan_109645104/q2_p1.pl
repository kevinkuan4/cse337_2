# Kevin Kuan
# 109645104
# CSE 3337 HW 2

# Prints textfile lines in increasing order 
use strict;
use warnings;

sub sortlines{
	my $filename = $_[0];
	my $fh;
	open $fh, "<$filename" or die "Can't open input file: $!";

	my @array;
	while (<>){
		my $line = $_;
		chomp $line;
		push @array, $line; 
	}

	my @sorted_array = sort { length($a) <=> length($b) } @array;

	# prints to terminal
	foreach my $line (@sorted_array){
		print "$line\n";
	}
	# returns
	@sorted_array;
}

# Calling subroutine
my @x = sortlines($ARGV[0]);
