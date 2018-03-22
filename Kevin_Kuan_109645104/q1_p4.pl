# Kevin Kuan
# 109645104
# CSE 3337 HW 2

use strict;
use warnings;
use diagnostics;

my $file = "passwd.txt";

sub add_usr {
	my @uids;
	my @gids;
	open (my $my_file, "+<", $_[0]) or die "Could not open $file: $!";
	while (my $line = <$my_file>){
		my @my_list = split(/:/, $line);
		push @uids, $my_list[2];
		push @gids, $my_list[3];
	}

	my $usrname = "Zhibo Yang";
	my $name = "New User";
	my $home = "/home/";
	my $shell = "/bin/bash";

	#Perl bult in list module
	use List::Util qw/ max min /;

	my $max = max @uids;
	$max++;


	# Random group id from gids array
	my $gid = $gids[rand @gids];

	# Example Zhibo Yang:*:100:91:New User:/home/:/bin/bash
	

	my $string = "$usrname:*:$max:$gid:$name:$home:$shell\n";

	print $my_file $string;
	close $my_file;
	return $string;
}

my $output = add_usr($file);
chomp $output;
print "ADDING \"$output\" to the file\n";
