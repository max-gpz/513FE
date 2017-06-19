install.packages('quantmod')

library(RMySQL)
library(quantmod)

# load driver
drv <- dbDriver("MySQL")

# establish connection
con <- dbConnect(drv, user = "gang", password = "gang", 
                 host = "localhost", dbname = "fe513data")

#list tables
dbListTables(con)

#create a query that we can run to pick up a ticker from component table and download 1-year daily 
#stock price data using R API and save it into a data frame (STOCK DATA).

STOCK_DATA <- as.data.frame(getSymbols("YHOO", src = "google", from = "2016-01-01",to = "2017-01-01", auto.assign = FALSE))
STOCK_DATA

# Use R to get the date range of your stock data (stock date range).
names(STOCK_DATA)
stock_data_range <- range(row.names(STOCK_DATA))
stock_data_range

#Use R API to run a SELECT query to extract records from accounting table. 
#The records in result should have date within the stock date range
#and are ordered based on date (ascending). Normally, you should get more
#than 1 records. And the result is in data frame format (ACCT DATA).
stock_dates <- row.names(STOCK_DATA)
data <- data.frame(a = c(stock_dates))

dbWriteTable(con, "stock_data", data)

accountquery <- dbSendQuery(con, "SELECT * FROM accounting WHERE date IN (SELECT a FROM stock_data) ORDER BY date ASC")

ACCT_DATA <- dbFetch(accountquery)
ACCT_DATA

#Save result in a CSV file
getwd()
write.csv(ACCT_DATA, "ACCT_DATE.csv")

# Use the data frame (ACCT DATA) in previous question and get the
# record(s) with the same ticker as your stock data. (Because you just down-
# loaded 1-year data, the result may only include 1 record or no record.)

same_ticker <- ACCT_DATA[ACCT_DATA$ticker == 'YHOO',]
same_ticker

#disconnect from DB
dbDisconnect(con)


