
###$1 is the run_id $2 is whether to do reanalyze $3 is path to the output folder $4 is the server name
OUTPUT=$3
OUTPUT=${OUTPUT/wangyiz/genomics}

if [ "$4" = "titan" ]; then

	CELLRANGER="/home/genomics/apps/cellranger-2.1.0/"
	REFPATH="/home/genomics/genomics/reference/CellRanger/"
	MODE="local"
elif [ "$4" = "csclprd1" ]; then

	CELLRANGER="/common/genomics-core/apps/cellranger-2.1.0/"
	REFPATH="/common/genomics-core/reference/CellRanger/"
	MODE="sge"
fi	

if [ "$2" = "Yes" ]; then
	echo "$CELLRANGER/cellranger aggr --csv=$3/$1_aggr.csv --id=$1_aggr  --jobmode=$MODE --nopreflight" > $1_run_aggr_$4.sh 
	echo "echo \"Subject: 10X data aggr for $1 is done\" | sendmail -v yizhou.wang@cshs.org" >> $1_run_aggr_$4.sh
	echo "$CELLRANGER/cellranger reanalyze --matrix=$3/$1_aggr/outs/raw_gene_bc_matrices_h5.h5 --barcodes=$1_barcodes_aggr_reanalyze.csv --jobmode=$MODE --nopreflight" >> $1_run_aggr_$4.sh
	echo "echo \"Subject: 10X data reanalyze for $1 is done\" | sendmail -v yizhou.wang@cshs.org" >> $1_run_aggr_$4.sh
elif [ "$2" = "No" ]; then
	echo "$CELLRANGER/cellranger aggr --csv=$3/$1_aggr.csv --id=$1_aggr  --jobmode=$MODE --nopreflight" > $1_run_aggr_$4.sh 
	echo "echo \"Subject: 10X data aggr for $1 is done\" | sendmail -v yizhou.wang@cshs.org" >> $1_run_aggr_$4.sh
fi

chmod 755 $1_run_aggr_$4.sh
chown genomics $1_run_aggr_$4.sh
mv $1_run_aggr_$4.sh $OUTPUT

