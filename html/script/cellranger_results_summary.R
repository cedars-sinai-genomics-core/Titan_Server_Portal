
args=commandArgs(TRUE)
path=args[1]
data<-data.frame()
name<-c()
for (i in 2:length(args)){
	result_path<-paste(args[i],"results/outs/metrics_summary.csv",sep="_")
	final_path<-paste(path,result_path,sep="/")
	data1<-read.csv(final_path,header=T,check.names=F,stringsAsFactors=FALSE)
#	name<-c(name,args[i])
#	args[i]<-sub("_results/outs/metrics_summary.csv","",args[i])
	data1$Sample_Name<-args[i]
	data1<-data1[,c(ncol(data1),1:(ncol(data1)-1))]  
	data<-rbind(data,data1)
}

#rownames(data)<-name

name<-paste(path,"final_summary.txt",sep="/")

write.table(data,paste(path,"final_summary.txt",sep="/"),row.names=FALSE,quote=F,sep="\t")

cmd<-paste("chown","genomics",name,sep=" ")

system(cmd)
