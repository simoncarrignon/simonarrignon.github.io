# Assuming data is read into a dataframe named df with columns: timestamp, status, event
# e.g., 
df <- read.csv("all.csv",na.strings=c(""," "))
df <- df[complete.cases(df),]
df$timestamp  <-  sprintf("%04d,%04d",df[,1],df[,2])
df$timestamp  <-  paste(df[,1],df[,2],sep=",")
df$event  <- trimws(tolower(df$event))
df$event  <- gsub("\\s+"," ",(df$event))

df$timestamp <- strptime(df$timestamp, format="%Y%m%d,%H%M")
df$date <- as.Date(df$timestamp)

#df <- df[order(df$event, df$timestamp),]
order_diffs <- diff(df$timestamp)
incorrect_order_indices <- which(order_diffs < 0)
if (length(incorrect_order_indices) > 0) {
  for (index in incorrect_order_indices) {
    print(paste0("Data is not in chronological order at index ", index, 
                 " with event '", df$event[index], 
                 "' and timestamp '", format(df$timestamp[index], format="%Y%m%d,%H%M"), "'.",
                 " It should come after event '", df$event[index + 1], 
                 "' with timestamp '", format(df$timestamp[index + 1], format="%Y%m%d,%H%M"), "'."))
  }
  stop("Please correct the data manually.")
}

# Check if there's always an 'end' after a 'start' for each event
for (i in 1:(nrow(df) - 1)) {
  if (df$event[i] == df$event[i + 1] && df$status[i] == "start" && df$status[i + 1] != "end") {
    print(paste0("Error at index ", i, 
                 ": Event '", df$event[i], 
                 "' with 'start' timestamp '", format(df$timestamp[i], format="%Y%m%d,%H%M"), 
                 "' is not directly followed by an 'end' status."))
  }
}


# Compute time difference between 'start' and 'end'
df$time_diff <- c(diff(df$timestamp) ,NA_real_)

# Only keep 'start' rows
df <- df[df$status == "start",]

# Group by date and event, and calculate total time spent on each event
result <- aggregate(time_diff ~ date + event, data = df, FUN = sum, na.rm = TRUE)

# Checking if any timeslot is more than a few hours (e.g., 3 hours)
over_time <- any(df$time_diff > 3*60,na.rm=T)

print(check)
print(over_time)
print(result)


result$time_diff
result$event=towl
days/sum(result$time_diff/ lengths(strsplit(result$event,"/")))
diff(c(min(df$timestamp),max(df$timestamp)))
tapply(result$time_diff,result$event,sum)
