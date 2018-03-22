# Kevin Kuan
# CSE 337
# Homework 2
use strict;
use warnings;

print "Enter file name: ";
my $filename = <STDIN>; 
chomp $filename;

my $valid_input = 0;
my @temp_storage;
my $line_count = 0;

# file exists
if (-e $filename){
	print "$filename already exists. ";

	# backup directory exists
	if (-e "./backup"){
		print "Checking backup directory... already exists\n";
	}

	# backup directory does not exists
	else{
		mkdir ("backup");
		print "Checking backup directory... backup directory created\n";
	}

	# Reads from file
	#use Cwd qw(cwd);
	#my $dir = cwd;
	#print "$dir\n";


	open (my $fh, "<", $filename) or die "Can't open $filename: $!";
	while (<$fh>){
		chomp;
		push @temp_storage, $_;
		$line_count++;
	}
	close $fh;
	my $bckup = "./backup/$filename";
	# 10 lines or under
	## Overwrite
	if ($line_count <= 10){
		print "$filename has no more than 10 lines\n";
		my $bckup = "./backup/$filename";
		open (my $bu, ">", $bckup) or die "Can't write $bckup: $!";
		foreach my $element (@temp_storage){
			print $bu "$element\n";
	}
		close $bu;
		print "Ok, old file backed up under backup directory\n";
		
		open (my $fh, ">", $filename) or die "Can't open $filename: $!";
		print $fh "Perl is cool!\n";
		close $fh;
		print "Wrote to file $filename\n";
	}

	# more than 10 lines
	else{
		
		open (my $fh, ">", $filename) or die "Can't open $filename: $!";
		while ($valid_input == 0) {
			print "Enter 'c' to backup the first 10 lines. 'o' to overwrite without creating a backup\n";
			
			my $usr_input = <STDIN>;
			chomp $usr_input;
			# Check if c
			if ($usr_input eq "c"){

				$valid_input = 1;
				#print"$usr_input is good\n";
				my $bckup = "./backup/$filename";
				open (my $bu, ">", $bckup) or die "Can't write $bckup: $!";
				for (my $i = 0; $i < 10; $i=$i+1){
					print $bu "$temp_storage[$i]\n";
				}
				print "Ok, old file backed up under backup directory\n";
				close $bu;	
				print $fh "Perl is cool!\n";
				print "Wrote to file $filename\n";

			}
			
			# Check if o
			elsif ($usr_input eq "o"){
				$valid_input = 1;
				#print"$usr_input is good\n";
				print $fh "Perl is cool!\n";
				print "Wrote to file $filename\n";
			}
		
		}
	}
	close $fh;
}

# file does not exists
else {
	open my $fh,">$filename" or die "Can't open $filename: $!";
	print $fh "Perl is cool!\n";
	close $fh;
	print "Wrote to file $filename\n";
}

