# Kevin Kuan
# 109645104
# CSE 3337 HW 2

use strict;
use warnings;

my @arr;
my $filename = $ARGV[0];
my $line_count = 0;
my $word_count = 0;
my $char_count = 0;
my $fh;
open $fh, "<$filename" or die "Can't open input file: $!";
while (my $line = <$fh>){
	chomp $line;
	$line_count++;
	$char_count += length($line);
	push @arr, $line;
	my @temp_arr = split " ", $line;
	$word_count+= scalar @temp_arr;
}
my @rev_arr;
foreach my $element (@arr){
	my $rev_element = reverse $element;
	push @rev_arr, $rev_element;
}

@rev_arr = reverse @rev_arr;
print "lines: ",$line_count," words: ",$word_count, " characters: ", $char_count,"\n";
print "reversed:\n";
foreach my $element (@rev_arr){
	print $element,"\n";
}