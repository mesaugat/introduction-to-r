dataFile <- read.csv('/Users/saugat/Downloads/2008.csv')

head(dataFile)

head(dataFile$Origin)

sum(dataFile$Origin == 'ORD')
sum(dataFile$Dest == 'ORD')
sum(dataFile$Origin == 'IND' & dataFile$Dest == 'ORD')

sum(dataFile$Origin == 'TUP' & dataFile$Year == 2008)

head(dataFile$Origin == 'TUP')

tup2008 <- subset(dataFile, dataFile$Origin == 'TUP' & dataFile$Year == 2008)
sum(tup2008$DepDelay)

sum(dataFile$Dest == 'LAX' & dataFile$Year == 2008)
atlToLax <- subset(dataFile, dataFile$Origin == 'ATL' & dataFile$Dest == 'LAX')

sum(atlToLax$DepTime < 1200, na.rm = TRUE)

brk = seq(0,2400,by=100)
hist(atlToLax$DepTime, brk, plot=TRUE)
