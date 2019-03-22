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
}else{
	open INN, "/home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org.txt" or die "$!";
	my @data = <INN>;
	open OUT,">/home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Sequencing_Org.txt" or die "$!";
	foreach my $input (@data){
		if($input =~ $sequencing_ID && $check == 0){
			my @b=split("\t",$input);
			print OUT join("\t",$date,$sequencing_ID,$project_ID,$PI_name,$sequencing_type,$sample,$organism,$b[7]),"\n";	
			$check++;
		}elsif($input =~ $sequencing_ID && $check != 0){
			next;
		}else{
		print OUT $input;
		}
	}
}
