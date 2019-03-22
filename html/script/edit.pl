#!/usr/bin/perl -w
use strict;
use Getopt::Long;
#use List::MoreUtils qw(uniq);
my $file;
my $sequencing_ID = "unknown";
my $organism = "unknown";
my $project_ID = "unknown";
my $PI_name = "unknown";
my $replace = 0;
my $sequencing_type = "unknown";

GetOptions(
        'file|f=s' => \$file,
        'sequencing_ID|s=s' => \$sequencing_ID,
        'organism|o=s' => \$organism,
        'project|p=s' => \$project_ID,
        'PI_name|n=s' => \$PI_name,
        'sequencing_type|t=s' => \$sequencing_type,
	'replace|re!' => \$replace,
);

#my $file =$ARGV[0];
#my $sequencing_ID = $ARGV[1];
my $date = substr($sequencing_ID,0,6);
#my $project_ID = $ARGV[2];
#my $PI_name = $ARGV[3];
#my $sequencing_type = $ARGV[4];
#my $organism = $ARGV[5];
my $sample; 


open IN,$file or die "$!";

my @data=<IN>;

close IN;

my $sum = 0;

my @element;



foreach my $line(@data){
	if($line =~ "Sample_Name"){
	#	print $data[$sum+1],"\n";	
		foreach my $inside (@data[$sum+1..$#data]){
			my @a = split(",",$inside);
		#	print $a[1],"\n";
			push(@element,$a[1]);	
		
		}
#	break;
	}
	$sum++;
}

my %seen;
my @unique = grep { !$seen{$_}++ } @element;

if(scalar(@unique) >3){
	$sample = join(",",$unique[1],$unique[2],$unique[3],"...");
}else{
	$sample = join(",",@unique);
}


my $check = 0;
if($replace == 0){
	open OUT,">>/home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org.txt" or die "$!";
	print OUT join("\t",$date,$sequencing_ID,$project_ID,$PI_name,$sequencing_type,$sample,$organism,"not delivered"),"\n";
	close OUT;
}else{
	open INN, "/home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org.txt" or die "$!";
	my @data = <INN>;
	close INN;
	open OUT,">/home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org.txt" or die "$!";
	foreach my $input (@data){
#	print OUT $input;
		if($input =~ $sequencing_ID && $check == 0){
			my @b=split("\t",$input);
			print OUT join("\t",$date,$sequencing_ID,$project_ID,$PI_name,$sequencing_type,$sample,$organism,$b[7]);
			
			$check=1;
		}
		if($input =~ $sequencing_ID && $check != 0){
			next;
		}
		if($input ne $sequencing_ID){
		print OUT $input;
	#	print "same\n";
		}
	}
#system("head -n 1 /home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org_temp.txt && tail -n +3 /home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org_temp.txt | sort > /home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org.txt");
#
close OUT;
#my $sort_cmd= "awk \'NR<2{print \$0\;next}{print \$0| \"sort\"}\' Sequencing_Org_temp.txt \> Sequencing_Org\.txt";
#system($sort_cmd);

#system("rm /home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org_temp.txt");
}


