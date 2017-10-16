use strict; use warnings;

my $prefix = "";
my $prime_line = "";
my $new_line = "";

sub longest_common_prefix {
my %prefixes;

foreach (@_){
    my $prefix = join '', /^(.)(\1+)/;
    $prefixes{length $prefix} = $prefix; }

    my $longest = (sort {$b <=> $a} keys %prefixes)[0];
    return "$prefixes{$longest}";
}


sub left_factor {
    
foreach my $line (@_) {  
    # detect the -> part and store it in $result
    our $result = "";
    foreach my $char (split //, $line) {
          if ($char eq "-" or $char eq ">") {
                $result = $result . $char; }}
  

    #split it into LHS and RHS
    my @words = split /$result/, $line;
    my $lhs = $words[0];
    $lhs =~ s/^\s+|\s+$//g; #remove whitespaces

    #split the RHS on | and store in an array
    my @rhs = split /\Q|/, $words[1];
    
    #remove spaces for each element of @rhs
    foreach my $element (@rhs) {
        $element =~ s/^\s+|\s+$//g; 
    }
    
    my $prefix = longest_common_prefix(@rhs);
    if (! $prefix =~ /^\s*$/) { #if a common prefix has been found
       our $lhs_prime = $lhs . "'"; #creates a prime variable
       $prime_line = $lhs_prime . " -> "; #creates a new line for the prime variable
       $new_line = $lhs . " -> " . $prefix . $lhs_prime; #creates a new line for the non-prime variable (original non-terminal)
       foreach my $no_prefix (@rhs) { #add each component that doesn't contain the substring to $new_line
        if (! (index($no_prefix, $prefix) != -1)) {
            $new_line = $new_line . " | " . $no_prefix;
       }}
       
       foreach my $production (@rhs)
        {
            if (index($production, $prefix) != -1) { #split the component on the prefix, only if it contains it
         my($first, $rest) = split(/$prefix/, $production, 2);
         $prime_line = $prime_line . $rest . " | "; }
    
    }}}

       $prime_line =~ s/\|\s$//; #substitute | followed by a whitespace at the end of the line with nothing
}

#my $test = "ffffrrrfff";
#my $meh = "ffff";
#my($first, $rest) = split(/$meh/, $test, 2);
my @rhs = ();
my $test1 = "S -> aaaBajj | aaaBBkj | bk";
push @rhs, $test1;
left_factor(@rhs);


print $new_line, "\n";
print $prime_line, "\n";
