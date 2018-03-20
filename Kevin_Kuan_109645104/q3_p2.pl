# Kevin Kuan
# CSE 337
# Homework 2

my %curr_ex = (
	"usd" => 1.0,
	"eur" => 0.81,
	"cad" => 1.29,
	"inr" => 65.2,
	"jpy" => 105.75,
	"vnd" => 22750,
	"krw" => 1079.43,
	"btc" => 0.000088,
);

my $init_curr;
my $tar_curr;
print "Exchangeable currency: usd, eur, cad, inr, jpy, vnd, krw, btc\n";
print "Enter the current currency: ";


# initialize to 0 for false
my $valid_init_curr = 0;

# loops while valid_init_curr is false
while ($valid_init_curr == 0){
	$init_curr = <STDIN>;
	chomp $init_curr;
	if (exists($curr_ex{$init_curr})){
		$valid_init_curr = 1;
		break;	
	}
	else{
		print "We do not trade $init_curr!\n";
		print "Re-enter the current currency: ";	
	}
}

my $valid_tar_curr = 0;

print "Enter the target currency: ";
while ($valid_tar_curr == 0){
	$tar_curr = <STDIN>;
	chomp $tar_curr;
	if (exists($curr_ex{$tar_curr})){
		$valid_tar_curr = 1;
		break;
	}
	else{
		print "We do not trade $tar_curr!\n";
		print "Re-enter the target currency: ";
	}
}

print "Enter the amount of money: ";
my $amnt = <STDIN>;
chomp $amnt;

# Convert into USD for all cases
my $conv_amnt = $amnt / $curr_ex{$init_curr};

# Convert into target currency
my $conv_amnt = $conv_amnt * $curr_ex{$tar_curr};

print "$amnt $init_curr is $conv_amnt $tar_curr.\n";
