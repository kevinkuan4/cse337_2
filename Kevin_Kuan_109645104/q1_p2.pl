# Kevin Kuan
# 109645104
# CSE 3337 HW 2

use strict;
use warnings;
use diagnostics;

my $file = "passwd.txt";
open my $my_file, $file or die "Could not open $file: $!";

my %my_hash;
while (my $line = <$my_file>){
	my @my_list = split(/:/, $line);
	$my_hash{$my_list[0]}=$my_list[2];	
}

my @user_ids;
my @number_ids;
foreach my $key (sort { $my_hash{$b} <=> $my_hash{$a} } keys %my_hash){
	push @user_ids, $key;
	push @number_ids, $my_hash{$key};
}

print"sorted uids: @number_ids\n";
print("\n");
print"usernames: @user_ids\n";