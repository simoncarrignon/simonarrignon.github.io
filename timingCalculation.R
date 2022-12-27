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
