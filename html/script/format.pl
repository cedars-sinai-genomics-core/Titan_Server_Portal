#!/usr/bin/perl -w
use strict;

my $file = shift;

open IN, $file or die "$!";

my @data = <IN>;

foreach my $line(@data){
	chomp $line;
	my @a = split(",",$line);
	my $folder_name = $a[0]."_".$a[1];
	system("mv -f $a[0] $folder_name");
}
