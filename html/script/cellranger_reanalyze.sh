
FOLDER_PATH=$1

if [ ! -d "$FOLDER_PATH/Final_Results" ]; then
  mkdir $FOLDER_PATH/Final_Results
fi

cd $FOLDER_PATH/

/usr/bin/Rscript /home/genomics/genomics/bin/10X_expr_matrix_QC_barcode.R $FOLDER_PATH/$2_results/outs/filtered_gene_bc_matrices/* $2 single

mv $FOLDER_PATH/$2_QC.pdf $FOLDER_PATH/Final_Results

/home/genomics/apps/cellranger-2.1.0/cellranger reanalyze --id=$2_QC --matrix=$2_results/outs/raw_gene_bc_matrices_h5.h5 --barcodes=$2_barcode_filter.csv --nopreflight

cp $FOLDER_PATH/$2_QC/outs/*.cloupe $FOLDER_PATH/Final_Results/$2_QC.cloupe

#cp $FOLDER_PATH/$2_results/outs/web* /home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/Results_Temp/$2_QC.html

mv $FOLDER_PATH/$2_barcode_filter.csv $FOLDER_PATH/Final_Results

chmod -R 775 $FOLDER_PATH/Final_Results

chown genomics -R $FOLDER_PATH/Final_Results

echo "Subject: 10X data reanalyze for $2 is done" | sendmail -v yizhou.wang@cshs.org 
