#!/bin/bash

TEMP_PATH=/var/www/html/upload/tmp
if [ "$3" = "NovaSeq" ]; then

	FOLDER_PATH="/home/genomics/genomics-archive/NovaSeq_RawData/"
	SAMPLESHEET_PATH="/home/genomics/genomics-archive/NovaSeq_RawData/SampleSheets_NovaSeq/"

elif [ "$3" = "NextSeq" ]; then

	FOLDER_PATH="/home/genomics/genomics-archive/NextSeq500_RawData"
	SAMPLESHEET_PATH="/home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets_NextSeq"

elif [ "$3" = "MiSeq" ]; then

	FOLDER_PATH="/home/genomics/genomics-archive/MiSeq_RawData"
	SAMPLESHEET_PATH="/home/genomics/genomics-archive/MiSeq_RawData/SampleSheets_MiSeq"

else

	echo "Please set the select the correct sequencer for data processing!"

fi

sudo cp $TEMP_PATH/SampleSheet_for_fastq.csv $FOLDER_PATH/$2/SampleSheet.csv
sudo mv $TEMP_PATH/$1 $SAMPLESHEET_PATH
