#!/usr/bin/perl
#2016/09/23 by Li Lei
#Tis is for extracting 284 wild barleys from 308 wild barleys:
#usage: perl 
use strict;
use warnings;
#use Data::Dumper;
my ($WBDC, $hudsontable) = @ARGV; #vcf is the new file Paul made 
my %hash;

open(IN1, $WBDC) or die "Could not open this $WBDC";

my $L1 = <IN1>;
my $L2 = <IN1>;
my $L3 = <IN1>;
print "$L1";
print "$L2";
print "$L3";

foreach my $row (<IN1>){
chomp $row;
my ($sample, @rtemp) = split(/\t/,$row);
               $hash{$sample} = $row;
}

open(IN2, $hudsontable) or die "Could not open this $hudsontable"; 
foreach my $row (<IN2>){
     chomp $row;
     my @rtemp = split(/\t/,$row);
     my $sample_id = $rtemp[0];
     if (exists $hash{$sample_id}){
     	 print "$hash{$sample_id}\n";
     }
}