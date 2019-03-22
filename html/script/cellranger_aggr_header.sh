
FOLDER_PATH=$1
RUN_ID=$2

cd $FOLDER_PATH/

echo "library_id,molecule_h5" > $NAME_aggr.csv

chmod -R 775 $NAME_aggr.csv
chown genomics $NAME_aggr.csv



