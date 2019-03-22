#!/bin/bash

#sudo chmod 775 /var/www/html/upload/final/170907_NS500624_0181_AHHNYCBGX3_RY-3522--07--12--2017_Wheeler_10XscRNA.csv
#sudo chmod 775 /var/www/html/upload/final/$1

if [ "$3" = "single" ]; then

	sudo cp /var/www/html/upload/final/$1 /home/genomics/genomics-archive/MiSeq_RawData/$2/SampleSheet.csv
	sudo mv /var/www/html/upload/final/$1 /home/genomics/genomics-archive/MiSeq_RawData/SampleSheets_MiSeq/

elif [ "$3" = "multiple" ]; then

	sudo cp /var/www/html/upload/final/$1 /home/genomics/genomics-archive/MiSeq_RawData/$2/SampleSheet.csv

elif [ "$3" = "upload_only" ]; then

	sudo mv /var/www/html/upload/final/$1 /home/genomics/genomics-archive/MiSeq_RawData/SampleSheets_MiSeq/
fi	
