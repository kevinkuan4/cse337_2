# Kevin Kuan
# 109645104
# CSE 3337 HW 2

use strict;
use warnings;


sub format_text{
	my $filename = $_[0];
	my $max_size = $_[1];
	my $fh;
	open $fh, "<$filename" or die "Can't open input file: $!";

	my $string;
	while (my $line = <$fh>){
		chomp $line;
		$string.= $line." ";
	}


	close $fh;
	my $counter = 0;
	my $output = "";
	my @array = split " ", $string;
	my $temp_line;
	foreach my $element (@array){
		if (length($element)+$counter <= $max_size){
			$temp_line.=$element." ";
			$counter= length($temp_line);
		}
		else{
			
			chop $temp_line;
			$output.=$temp_line;
			$output.="\n";
			$temp_line = $element." ";
			$counter=length($temp_line);
		}
	}
	# Gets last instance
	$output.=$temp_line;

	# print $output, "\n";
	return $output;
}

my $test = format_text($ARGV[0], $ARGV[1]);
print "$test\n";