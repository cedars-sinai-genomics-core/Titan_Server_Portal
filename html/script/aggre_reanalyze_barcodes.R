args=commandArgs(TRUE)
data<-data.frame()
a<-data.frame()
path<-args[(length(args)-1)]
run_id<-args[length(args)]
for (i in 1:(length(args)-2)){
	a<-read.csv(paste(path,args[i],sep="/"),header=T)
	replace<-paste("-",i,sep="")
	a[,1]<-sub("-1",replace,a[,1])
	report<-paste("the number of ",args[i]," was changed into ",i,sep="")
	print(report)
	data<-rbind(data,a)
	a<-data.frame()
}
file_name<-paste(run_id,"aggr_reanalyze_barcodes.csv",sep="_")
write.csv(data,paste(path,file_name,sep="/"),row.names=F,quote=F)



