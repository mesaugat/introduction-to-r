df1 <- read.csv('/Users/saugat/Downloads/2006.csv')
df2 <- read.csv('/Users/saugat/Downloads/2007.csv')
df3 <- read.csv('/Users/saugat/Downloads/2008.csv')

rm(df1, df2, df3)

myDataFile <- rbind(df1, df2, df3)

sum(myDataFile$Origin == 'LAX')

# This has lot of zero values
myTable1 <- table(myDataFile$Origin, myDataFile$Dest)
dim(myTable1)

# Does the same as myTable1 but efficiently
myTable2 <- table(paste(myDataFile$Origin, myDataFile$Dest))
dim(myTable2)

sum(myDataFile$Origin == 'BOS' & myDataFile$Dest == 'DEN' & myDataFile$Year == 2007)
sum(myDataFile$Origin == 'IND' & myDataFile$Dest == 'ORD')

plot(myTable1)
dotchart(myTable1)

v <- myTable1['IND', ]

v[v != 0]
dotchart(sort(v[v > 4000]))

airportsDataFile <- read.csv('/Users/saugat/Downloads/airports.csv')
w <- paste(airportsDataFile$airport, airportsDataFile$city, airportsDataFile$state, sep=", ")
names(w) <- airportsDataFile$iata

head(w)
table(airportsDataFile$city == 'Chicago')

caliAirports <- subset(airportsDataFile, state == 'CA')

# Not sure why this is showing "factor"
class(caliAirports$iata)

c <- table(myDataFile$Origin)[as.character(caliAirports$iata)]
length(c[!is.na(c)])

activeAirports <- function(userState) {
  airports <- subset(airportsDataFile, state == userState)
  a <- table(myDataFile$Origin)[as.character(airports$iata)]
  subset(airportsDataFile, iata %in% names(a[!is.na(v)]))
}

activeAirports('CA')
activeAirports('IL')

sapply(state.abb, function(x) dim(activeAirports(x))[1])

planeDataFile <- read.csv('/Users/saugat/Downloads/airports.csv')

sum(myDataFile$TailNum == 'N556AS', na.rm = TRUE)

ddmmyy <- paste(myDataFile$DayofMonth, month.abb[myDataFile$Month], myDataFile$Year)
tail(sort(tapply(myDataFile$Origin, ddmmyy, length)))
