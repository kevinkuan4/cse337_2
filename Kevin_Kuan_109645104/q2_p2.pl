# Kevin Kuan
# 109645104
# CSE 3337 HW 2

use strict;
use warnings;






my $filename = $ARGV[0];
my $max_size = $ARGV[1];
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
		$output.="\n";
		$output.=$temp_line;
		$temp_line = $element." ";
		$counter=length($temp_line);
	}
}
# Gets last instance
$output.="\n".$temp_line;
print $output, "\n";
