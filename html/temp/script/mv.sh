#!/bin/bash

#sudo chmod 775 /var/www/html/upload/final/170907_NS500624_0181_AHHNYCBGX3_RY-3522--07--12--2017_Wheeler_10XscRNA.csv
#sudo chmod 775 /var/www/html/upload/final/$1
sudo cp /var/www/html/upload/final/$1 /home/genomics/genomics-archive/NextSeq500_RawData/$2/SampleSheet.csv
#cp /var/www/html/upload/final/170907_NS500624_0181_AHHNYCBGX3_RY-3522--07--12--2017_Wheeler_10XscRNA.csv /home/genomics/genomics-archive/NextSeq500_RawData/170907_NS500624_0181_AHHNYCBGX3/SampleSheet.csv
sudo mv /var/www/html/upload/final/$1 /home/genomics/genomics-archive/NextSeq500_RawData/SampleSheets/
