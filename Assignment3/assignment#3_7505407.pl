#!usr/bin/perl -w

use 5.18.0;

#stores the input and output file information
my ($src, $dest) = @ARGV;

#an array to store all the lines in the .txt file
my @lines = ();
#create an array to store the new grammar (after left-recursion)
my @new_grammar = ();

my $filename = $src;

if (open(my $fh, $filename)) {
    chomp(@lines=<$fh>); #store all lines separately and remove the \n with chomp
    close $fh;
} else {
  warn "Could not open file '$filename' $!";
}


sub leftrecursion {

foreach my $line (@lines) {
    
# detect the -> part and store it in $result
our $result = "";
foreach my $char (split //, $line) {
  if ($char eq "-" or $char eq ">") {
  $result = $result . $char; }
  }

#split it into LHS and RHS
my @words = split /$result/, $line;
my $lhs = $words[0];
$lhs =~ s/^\s+|\s+$//g; #remove whitespaces

#split the RHS on | and store in an array
my @rhs = split /\Q|/, $words[1];

foreach my $production (@rhs)
{
    if ($production =~ /^\s*\Q$lhs/) {  #if the grammar has left recursion
      our $lhs_prime = $lhs . "'"; #creates a prime variable
      my $prime_line = $lhs_prime . " -> "; #creates a new line for the prime variable
      my $new_line = $lhs . " -> "; #creates a new line for the non-prime variable (original non-terminal)
      
        #if there is a left recursion, for each of the @rhs elements, remove it
        foreach my $single_production (@rhs) {
            if ($single_production =~ /^\s*\Q$lhs/) {
                $single_production =~ s/\Q$lhs//; #remove non-terminal
                $prime_line = $prime_line . $single_production . $lhs_prime . " | ";
                     }
            else {
                $new_line = $new_line . $single_production . $lhs_prime . " | ";
            }
        }
        
        $prime_line = $prime_line . "epsilon"; #adds sigma
        $new_line =~ s/\|\s$//; #substitute | followed by a whitespace at the end of the line with nothing
        
         push @new_grammar, $new_line;
         push @new_grammar, $prime_line;
      
    }
    else{ #if the production doesn't have a left recursion
     next;}
    
    }
        #unless $line has left recursion, push it to the new_grammar array
        unless ($line =~ /^\s*$lhs\s*[->]*\s*$lhs/) {
            push @new_grammar, $line;
        }
    } #end of main foreach loop

    
    } #end of leftrecursion subroutine





my $prefix = "";
my $prime_line = "";
my $new_line = "";
my @new_grammar2 = ();

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
    
    }
        $prime_line =~ s/\|\s$//; #substitute | followed by a whitespace at the end of the line with nothing
        push @new_grammar2, $new_line;
        push @new_grammar2, $prime_line;
        
        } else { #if there is no need for left factoring, push original line

             push @new_grammar2, $line;
        
    }
    
    
    
    }

       
}



leftrecursion(@lines);
left_factor(@new_grammar);

    
#If no left recursion elimination and left factoring was needed
if (@lines ~~ @new_grammar2) {
    print "Input grammar is OK!";
}
#Elsif output file was not provided, print to console
elsif ($dest eq "") {
    foreach (@new_grammar2)
{
    print "$_\n"; 
} } else {
#Else, open the output file; die if there's an error
open my $fh, '>', $dest or die "Cannot open output file: $!";
# Loop over the array
foreach (@new_grammar2)
{
    print $fh "$_\n"; # Print each entry in our array to the file
}
close $fh; # Not necessary, but nice to do
}