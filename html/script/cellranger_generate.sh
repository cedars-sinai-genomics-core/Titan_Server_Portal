
###$1 is the sample name $2 is fastq folder name $3 is species $4 is path to the output folder $5 is the server name
OUTPUT=$4
OUTPUT=${OUTPUT/wangyiz/genomics}

if [ "$5" = "titan" ]; then

	CELLRANGER="/home/genomics/apps/cellranger-2.2.0/"
	REFPATH="/home/genomics/genomics/reference/CellRanger/"
	MODE="local"
elif [ "$5" = "csclprd1" ]; then

	CELLRANGER="/common/genomics-core/apps/cellranger-2.2.0/"
	REFPATH="/common/genomics-core/reference/CellRanger/"
	MODE="sge"
fi	


if [ "$3" = "Human" ]; then
	SPE="GRCh38/"
elif [ "$3" = "Mouse" ]; then
	SPE="mm10/"
elif [ "$3" = "Breunig" ]; then
	SPE="mm10_WPRE/mm10_WPRE/"
fi

echo "$CELLRANGER/cellranger count --fastqs=$4/$2 --sample=$1 --id=$1_results --transcriptome=$REFPATH/$SPE --jobmode=$MODE --nopreflight" >> run_$5.sh 
echo "echo \"Subject: 10X data processing for $1 is done\" | sendmail -v yizhou.wang@cshs.org" >> run_$5.sh
chmod 755 run_$5.sh
chown genomics run_$5.sh
#mv run_$5.sh $OUTPUT

