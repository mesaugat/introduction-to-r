myDataFile <- read.csv('/Users/saugat/Downloads/2008.csv')

table(myDataFile$Origin == 'LAX')

# Top 200 airports with low number of flights
top200airports <- names(sort(table(myDataFile$Origin))[1:200])
sum(myDataFile$Origin %in% top200airports)
table(myDataFile$Dest)[top20airports]

table(myDataFile$Dest)['DCA']
table(myDataFile$Dest)[c('DCA', 'IAD')]

top20airports <- names(sort(table(myDataFile$Origin), decreasing = TRUE)[1:20])
sum(myDataFile$Origin %in% top20airports)

tapply(myDataFile$DepDelay <= 0 & myDataFile$Origin == 'IND', myDataFile$Origin, sum, na.rm = TRUE)['IND']
table(myDataFile$Origin)['IND']

tapply(myDataFile$DepDelay <= 0 & myDataFile$Origin == 'IND', myDataFile$Origin, sum, na.rm = TRUE)['IND'] / table(myDataFile$Origin)['IND']

sum(tapply(myDataFile$Origin, list(myDataFile$Origin, myDataFile$Month), length)[c('ATL', 'AUS', 'BDL'), 7:10])

tapply(myDataFile$Origin, list(myDataFile$Origin, myDataFile$Month), length)['IND', ]

class(tapply(myDataFile$Origin, list(myDataFile$Origin, myDataFile$Month), length)[c('IND', 'ATL'), ])

dim(tapply(myDataFile$Origin, list(myDataFile$Origin, myDataFile$Month), length)[c('IND', 'ATL'), ])

longDelays <- subset(myDataFile, myDataFile$DepDelay > 30)

sum(tapply(longDelays$Origin, longDelays$Origin, length)[c('IND', 'ORD')])
tapply(longDelays$Origin, longDelays$Month, length)

v <- ceiling(myDataFile$DepTime/600)

partsofday <- rep(NA, times=dim(myDataFile)[1])

partsofday[v == 1] <- 'early morning'
partsofday[v == 2] <- 'late morning'
partsofday[v == 3] <- 'early evening'
partsofday[v == 4] <- 'late evening'

table(partsofday)

myDataFile$timeofday <- partsofday

dim(myDataFile)

table(myDataFile$Origin == 'IND' & myDataFile$timeofday == 'early morning')
