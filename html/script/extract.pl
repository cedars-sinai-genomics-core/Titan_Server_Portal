#!/usr/bin/perl -w
use strict;

my $file = $ARGV[0];
my $seq_type = $ARGV[1];

open IN, $file or die "$!";

my @data = <IN>;

my $n=0;
my $reads_sum=0;
my $reads_pf=0;
my $reads_pd=0;
my $reads_sum_pd=0;
my $q30;
my $yield;
my $align;
my $density;
my $cluster;
foreach my $line (@data){
	$n++;
	chomp $line;
	$line =~ s/,//g;
	$line =~ s/ //g;
	if($line =~ /^Total/){
		my@a = split("\t",$line);
		$q30 = $a[7];
		$a[2]=~ s/Gbp//;
		$yield = $a[2];
		$align = $a[4];
	}

	if ($line =~ /DENSITY/){
	$data[$n] =~ s/ //g;
		my @b = split("\t",$data[$n]);
		$density = $b[3];
		$cluster = $b[4];
		if ($seq_type eq "Single-end"){
			for(my $i=0;$i<(scalar(@data)-$n);$i=$i+2){
				$data[$n+$i]=~s/ //g;
				$data[$n+$i]=~s/,//g;
				my @c=split("\t",$data[$n+$i]);
				$reads_sum = $reads_sum + $c[6];
				$reads_pf = $reads_pf + $c[7];
			}
		}elsif($seq_type eq "scRNA_10X"){
			for(my $i=0;$i<(scalar(@data)-$n);$i=$i+3){
                                $data[$n+$i]=~s/ //g;
                                $data[$n+$i]=~s/,//g;
                                my @c=split("\t",$data[$n+$i]);
                                $reads_sum = $reads_sum + $c[6];
                                $reads_pf = $reads_pf + $c[7];
                        }
		}elsif($seq_type eq "Paired-end"){
			for(my $i=0;$i<(scalar(@data)-$n);$i=$i+3){
                                $data[$n+$i]=~s/ //g;
                                $data[$n+$i]=~s/,//g;
				$data[$n+2+$i]=~s/ //g;
                                $data[$n+2+$i]=~s/,//g;
                                my @c=split("\t",$data[$n+$i]);
				my @d=split("\t",$data[$n+2+$i]);
                                $reads_sum = $reads_sum + $c[6];
                                $reads_sum_pd = $reads_sum_pd + $d[5];		
				$reads_pf = $reads_pf + $c[7];
				$reads_pd = $reads_pd + $d[6];
			}
			$reads_sum=$reads_sum+$reads_sum_pd;
			$reads_pf = $reads_pf+$reads_pd;
		}
	last;
	}


}

#print join(",",$reads_sum,$q30,$yield,$align,$density,$cluster,$reads_sum,$reads_pf),"\n";
print join("\n",$q30,$yield,$align,$density,$cluster,$reads_sum,$reads_pf),"\n";
