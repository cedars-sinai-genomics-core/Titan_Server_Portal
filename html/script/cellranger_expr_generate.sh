
FOLDER_PATH=$1

if [ ! -d "$FOLDER_PATH/Final_Results" ]; then
  mkdir $FOLDER_PATH/Final_Results
fi

cd $FOLDER_PATH/$2_results/

/usr/bin/Rscript /home/genomics/genomics/bin/10X_expr_matrix_raw_nor_noQC.R $FOLDER_PATH/$2_results $2

mv $FOLDER_PATH/$2_results/$2_Expr* $FOLDER_PATH/Final_Results

cp $FOLDER_PATH/$2_results/outs/*.cloupe $FOLDER_PATH/Final_Results/$2.cloupe

cp $FOLDER_PATH/$2_results/outs/web* /home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets_NextSeq/Results_Temp/$2_QC.html

chmod -R 775 $FOLDER_PATH/Final_Results

chown genomics -R $FOLDER_PATH/Final_Results 
