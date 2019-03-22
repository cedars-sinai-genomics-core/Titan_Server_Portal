cd $1
project=$2
config="/home/genomics/genomics/apps/multiqc/multiqc_config_example.yaml"

for folder in `ls`
do
sample=`ls $folder/*/`
dir="$folder/star_out/$sample"
base=$(basename $sample ".fastq.gz")
mv ${dir}/starLog.final.out ${dir}/$base.final.out
mv ${dir}/starAligned.sortedByCoord.out.UMI.bam ${dir}/$base.UMI.bam
mv ${dir}/starAligned.sortedByCoord.out.UMI.bam.bai ${dir}/$base.UMI.bam.bai
mv ${dir}/read_counts.txt  ${dir}/${base}_counts.txt
cat ${dir}/${base}_counts.txt | grep -v "__"| sort -k 1 > ${dir}/${base}_temp.txt
{ printf 'Gene\t'"${base}"'\n'; cat ${dir}/${base}_temp.txt; } > ${base}_temp.txt
rm ${dir}/${base}_temp.txt
done

/home/genomics/anaconda2/bin/multiqc  -c $config $1
paste *_temp.txt | awk 'NR==1{for(i=1;i<=NF;i++)b[$i]++&&a[i]}{for(i in a)$i="";gsub(" +"," ")}1' > counts.txt

mkdir final_result
rm *_temp.txt
mv counts.txt final_result/$project"_COUNTS.txt"
mv multiqc_report.html final_result/$project"_QC.html"
/home/genomics/bin/change_per.sh ./
echo "Subject: FFPE RNA-seq is done for $project" | sendmail -v di.wu@cshs.org
