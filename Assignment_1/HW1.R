# Defining a vector A with 2 elements, my first name and last name.

A <- c("Gang Ping", "Zhu")

# Defning a vector B with 1 string which is "is working on FE513 homework".

B <- "is working on FE513 homework"
length(B)

# Split B by space and make it to vector C. Show the length of vector C (should be 5).

X <- strsplit(B, " ")
C <- unlist(strsplit(B, " "))
length(C)


# Add a period to as the 6th element of vector C.

C <- c(C, ".")
C

# Transfer vector C into a matrix D with 2 columns and 3 rows.

D <- matrix(C, ncol = 2, nrow = 3, byrow = TRUE)

# rbind A and D into a matrix E. If you read it row by row, it should be a regular sentence.

E <- rbind(A, D)
E

# Define a 5 by 5 square matrix F from 25 random number (use rnorm()).
F <- matrix(rnorm(25), ncol = 5, nrow = 5)


# Get mean and sd of the values in matrix F.
mean(F)
sd(F)


# Transposing matrix G from F.

G <- t(F)

# dot product on matrices G and F.

G * F

# multiplication on matrices G and F.

G %% F

# Convert F into a data frame H.

H <- data.frame(F)

# Displaying rows which satisfy the conditions: 1) the first column is larger than 0; AND 2) the second column is less than 0.

View(H[H$X1 > 0 & H$X2 < 0])
View(H[which(H$X1 > 0 & H$X2 < 0)])

#Setting the working directory to access the stock that was downloaded

getwd()
setwd("C:/Users/gang.ping.m.zhu/Documents/Stevens/FE513/HW")

# Read the csv file into R, and show the number of rows, number of columns and column names.
library('readxl')

data <- read.csv('atvi.csv', header = TRUE)
summary(data)

# show the number of columns separately 
length(data)
#row(data)


# creating a column to return the log return of the stock (log(current price/original price).
data$n <- data$Close[255]
data$logreturn <- log(data$Close/data$n)
# data$return <- log(data$n/data$Close)

#check number of NA values
sum(is.na(data$logreturn))

#check number of infinite values
sum(is.infinite(data$logreturn)) 

# defining a function for the SMA for the past 10 days

SMA <- function(n) {
  sum <- 0
  for (i in ((n-9):n)) {
    sum <- sum + data$logreturn[i]
  }
  return(sum/10)
}

# testing the function
SMA(255)
