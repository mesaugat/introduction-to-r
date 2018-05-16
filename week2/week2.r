myDataFile <- read.csv('/Users/saugat/Downloads/2008.csv')

table(myDataFile$Origin)
sort(table(myDataFile$Origin))
sort(table(myDataFile$Origin), decreasing=TRUE)

seq(0, 100, by=10)
cut(myDataFile$DepTime, breaks = seq(0, 2400, 100))

plot(table(cut(myDataFile$DepTime, breaks = seq(0, 2400, by = 100))))

sort(tapply(myDataFile$DepDelay, myDataFile$Origin, mean, na.rm = TRUE))

sort(tapply(myDataFile$Distance, myDataFile$Origin, mean), decreasing = TRUE)

tapply(myDataFile$ArrDelay, myDataFile$DayOfWeek, mean, na.rm = TRUE)
tapply(myDataFile$ArrDelay[myDataFile$Dest == 'IND'], myDataFile$DayOfWeek[myDataFile$Dest == 'IND'], mean, na.rm = TRUE)

sort(tapply(myDataFile$DepDelay, myDataFile$UniqueCarrier, mean, na.rm = TRUE), decreasing = TRUE)

dates <- paste(myDataFile$Month, myDataFile$DayofMonth, myDataFile$Year, sep = "/")
sort(tapply(myDataFile$DepDelay, dates, mean, na.rm = TRUE), decreasing = TRUE)

sort(tapply(myDataFile$DepDelay[myDataFile$Origin == 'ORD'], dates[myDataFile$Origin == 'ORD'], mean, na.rm = TRUE), decreasing = TRUE)

atlToLax <- myDataFile$Origin == 'ATL' & myDataFile$Dest == 'LAX'
tail(sort(tapply(myDataFile$DepDelay[atlToLax], dates[atlToLax], mean, na.rm = TRUE)))
