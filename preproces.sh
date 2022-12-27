#for i in {202210..202212}; do 
#    grep $i timingRawData.quasicsv | awk 'BEGIN{FS=",";u="end"}{if($3==u){print "problem at:"$1","$2};u=$3;print $0}' > timesheet_$i;
#done

for i in {202210..202212}; do 
    cat timesheet_$i | awk 'BEGIN{FS=",";u="end"}{if($3==u){print "problem at:"$1","$2};u=$3;print $0}' > timesheet_$i.csv;
done
