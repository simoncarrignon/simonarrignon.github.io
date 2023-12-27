
#write a list with 1 the date of start, 2 the total length time and 3 the list of element.
alltimings=read.csv("octnov.csv")
byday=sapply(unique(alltimings$date),function(d){
                 timings=alltimings[alltimings$date==d,]
                 tot=c()
                 for(i in seq(1,length(timings[,1])-1,2)){
                     h1=floor(timings[i+1,"time"]/100)
                     h2=floor(timings[i,"time"]/100)
                     if(timings[i+1,"type"]!="end" || timings[i,"type"]!= "start")
                         print(paste("problem",i,i+1))

                     hours=(h1-h2)*60
                     m1=timings[i+1,"time"]-h1*100
                     m2=timings[i,"time"]-h2*100
                     minutes=(m1-m2)
                     total=hours+minutes
                     tot=c(tot,total)
                 }

                 sum(tot/60)
})

tot=c()
timings=read.csv("octnov.csv")
for(i in seq(1,nrow(timings)-1,2)){
    h1=floor(timings[i+1,"time"]/100)
    h2=floor(timings[i,"time"]/100)
    if(timings[i+1,"type"]!="end" || timings[i,"type"]!= "start")
        print(paste("problem",i,i+1))

    hours=(h1-h2)*60
    m1=timings[i+1,"time"]-h1*100
    m2=timings[i,"time"]-h2*100
    minutes=(m1-m2)
    total=hours+minutes
    tot=c(tot,total)
}

print(sum(tot)/60)
plot(byday)
alltimings=read.csv("timesheet_202211.csv",header=F)
colnames(alltimings)=c("date","time","type")

encountertimings=timings[grepl("CDAL",toupper(timings[,4]))+grepl("ENCO",toupper(timings[,4]))+grepl("admin",toupper(timings[,4]))>0,]

byday=sapply(unique(encountertimings$date),function(d){
                 timings=alltimings[alltimings$date==d,]
                 tot=c()
                 for(i in seq(1,length(timings[,1])-1,2)){
                     h1=floor(timings[i+1,"time"]/100)
                     h2=floor(timings[i,"time"]/100)
                     if(timings[i+1,"type"]!="end" || timings[i,"type"]!= "start")
                         print(paste("problem",i,i+1))

                     hours=(h1-h2)*60
                     m1=timings[i+1,"time"]-h1*100
                     m2=timings[i,"time"]-h2*100
                     minutes=(m1-m2)
                     total=hours+minutes
                     tot=c(tot,total)
                 }

                 sum(tot/60)
})

timings=read.csv("timesheet_202211.csv",header=F)
timings=read.csv("timesheet_202212.csv",header=F)
colnames(timings)=c("date","time","type","notes")

tot=c()
timinglist=list()
for(i in seq(1,nrow(timings)-1,2)){
    h1=floor(timings[i+1,"time"]/100)
    h2=floor(timings[i,"time"]/100)
    if(timings[i+1,"type"]!="end" || timings[i,"type"]!= "start")
        print(paste("problem",i,i+1))

    hours=(h1-h2)*60
    m1=timings[i+1,"time"]-h1*100
    m2=timings[i,"time"]-h2*100
    minutes=(m1-m2)
    total=hours+minutes
    timinglist[[paste0(timings[i,"date"],timings[i+1,"time"])]]=list ( length=total, check=c(timings[i,"type"],timings[i+1,"type"]), cat=paste0(unique(toupper(c(timings[i,"notes"],timings[i+1,"notes"]))),collapse=" "))
    tot=c(tot,total)
}

durations=sapply(timinglist,"[[","length")
allcats=sapply(timinglist,"[[","cat")
allcats=strsplit(allcats,"[/|+ ]") 
allcats=lapply(allcats,unique)




c(
normal=sum(durations[
 grepl("ENCO",lapply(timinglist,"[[","cat")) |
 grepl("CDAL",lapply(timinglist,"[[","cat")) |
 grepl("REVIEW",lapply(timinglist,"[[","cat")) |
 grepl("BA ",lapply(timinglist,"[[","cat")) |
 grepl("GENERAL",lapply(timinglist,"[[","cat")) |
 grepl("GRANT",lapply(timinglist,"[[","cat")) |
 grepl("ADMIN",lapply(timinglist,"[[","cat")) ])/60,


    bentley=sum(durations[grepl("BENT",lapply(timinglist,"[[","cat")) ])/60,
    network=sum(durations[grepl("NETW",lapply(timinglist,"[[","cat")) ])/60,
    depofarch=sum(durations[grepl("DEPOFARCH",lapply(timinglist,"[[","cat")) ])/60
)
