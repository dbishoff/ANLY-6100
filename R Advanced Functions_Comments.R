# ANLY 6100: Advanced R
# Instructor: Courtney Paulson
# Fall 2020

## In our previous R Coding file, we used the Auto data set from the ISLR library
library(ISLR)
attach(Auto)
Auto

### for loop 
# Will print 1, then 2, then 3, etc through 10
for(i in 1:10){
print(i)
}

# Will print x/5
x <- c(5,10,1000)
for(i in 1:3){
print(x[i]/5)
}

# Will assign vector to new vec and print the last assingment in loop
newvec <- NULL

x <- c(5,10,1000)
for(i in 1:3){
newvec <- x[i]/5
}

# Will assign vector to new vec for each i
newvec <- NULL

x <- c(5,10,1000)
for(i in 1:3){
print(newvec[i] <- x[i]/5)
}


### Loops: while
while( i > 10){

  
}

## "Looping" in coding refers to going through a set of data and applying
## the same actions repeatedly to different data points
## For example, let's say I want to create a new variable called Eight_Cyl
## Eight_Cyl is "YES" if a car has 8 cylinders and "NO" if a car does not
## ifelse() will do this for us:

Eight_Cyl=ifelse(cylinders==8,"YES","NO")
head(Eight_Cyl)
unique(Eight_Cyl)

## I could do this in a loop, though, by checking every row of data
## First, I need to know how many rows of data there are

last=nrow(Auto)
# nrow will not work with a vector
nrow(Eight_cyl)
last

## Create a new variable that is the same length as our data
## The rep() function repeats the first argument a given number of times
## So this will repeat the value "0" 392 times:

Eight_Cyl2=rep(0,last)

## Now, set up a "for loop"; we want it to run through every row from 1 to the last row
## And for each row, record if the car has eight cylinders or not

for(i in 1:last){
  
  if(cylinders[i]==8){Eight_Cyl2[i]="YES"}
  else{Eight_Cyl2[i]="NO"}
  
}

head(Eight_Cyl2,n=20)

# Check to see if the ifelse variable and the for loop variable are the same
unique(Eight_Cyl == Eight_Cyl2)
sum(Eight_Cyl == Eight_Cyl2)

## A "while loop" keep running as long as a certain condition is met
## For example, let's say we want to know where the first 6-cylinder car is
## This while loop will keep running as long as cylinders[i] does not equal 6
## We cycle through each row of data by increasing i by 1 each time
## But make sure you restart i, because otherwise i will start at 393!

i=1
while(cylinders[i]!=6){
  
 # i=i+1
}

i
cylinders[i]

## Exercise on your own: We could also have done the same thing we did 
## with ifelse() and for() with the while loop.
## Write a while loop for the Eight_Cyl3 variable below so Eight_Cyl3[i]="YES"
## if the car has 8 cylinders and "NO" if not



### Functions in R

## We've already seen several functions in R
## What are some examples of functions we've used so far?

## R also lets you write your own functions, if you want
## Let's write a function to print a name

myFunction <- function(name){
  
  print(name)
  
}

myFunction(name = "Courtney")


## Slightly more complex: let's roll a die

## If we want to make sure we all get the same die rolls, we need to set a seed
## This tells R to make any "random" results repeatable

set.seed(12345)

roll_die <- function(){
  
  sample(1:6,1)
  
}

roll_die()

## Let's say we want to roll it a set number of times.
## If I don't specify a number of times, I want it to just run 1 time

roll_die <- function(num_times = 1){

  sample(1:6,num_times,replace = TRUE)
  
}

roll_die()
roll_die(num_times = 5)

## Otherwise, I could have done it with a for loop:

roll_die <- function(num_times = 1){
  
  for(i in 1:num_times){
    sample(1:6,1)
  }
  
}

roll_die()
roll_die(num_times = 5)


## We can also make functions do work for us and return the answer
## Let's say we want to roll until we get a 5
## But we want to count how many times it took

roll_5 <- function(){
  
  roll = sample(1:6,1)
  num_times = 1
  
  while(roll != 5){
    
    num_times = num_times+1
    roll = sample(1:6,1)
    
  }
  
  return(num_times)
  
}

roll_5()

## Exercise on your own: Write a function to return the sum of two rolled dice


# Extra Info: Loading Data

### These commands might be helpful if you have to use base R (rather than RStudio)
### Keep in mind, though, that this will try to read files from whatever your working directory is!
## The Beer dataset is a very common one for introducing data mining techniques
## We'll see it in practice when we start looking at other regression options!

beer=read.csv("c:/users/suu/Downloads/Beer.csv",header=T)
# gives you the dimensions of a dataframe (100 rows, 5 columns)
dim(beer)
# Will return the number of rows
dim(beer)[1]
# Will give you the column names in your data set
names(beer)

## Handy option in R (at least, in Windows...): data editor!

fix(beer) # if you fix like this you will have no record. better if you use assignment to fix

## What if your data set had NA values (missing data)?

beer2=read.csv("c:/users/suu/Downloads/Beer_missing.csv",header=T)
dim(beer2)
names(beer2)

# check if every entry is/is not missing
is.na(beer2) 

## Probably impractical for large data sets.
## Instead, let's check how many missing values do we have?
# will return the number of values that are missing or na
sum(is.na(beer2))
# percent of missing data
mean(is.na(beer2))

# The sapply() function is a way of applying a function to a lot of data at once
# Here, we are applying the "sum" function to the beer2 data
sapply(beer2, function(x) sum(is.na(x)))

## But is all our data actually good data? Let's run summary stats
summary(beer2)
# which record has the minimum
which.min(beer2$Age)
# view entire record for min age
beer2[81,]
beer[which.min(beer2$Age),]

## We have some problematic values! Gender should only be 0 and 1
## And it is illegal for anyone under the age of 21 (in the US) to drink beer
## So let's update our data:
beer2$Age[beer2$Age < 21] <- NA
beer2$Gender[(beer2$Gender != 0 & beer2$Gender != 1)] <- NA
beer2$Married[beer2$Married != 0 & beer2$Married != 1] <- NA

sapply(beer2, function(x) sum(is.na(x)))

# Easiest way to deal with missing data: delete it
# na.omit() will delete any row with a missing value
beer_nomiss=na.omit(beer2)
dim(beer_nomiss)

## Frequently, however, we don't want to just eliminate missing data
## To impute missing data (replace missing with non-missing value),
## Consider the mice library. Basic tutorials can be found here:
## https://datascienceplus.com/imputing-missing-data-with-r-mice-package/
## and https://datascienceplus.com/handling-missing-data-with-mice-package-a-simple-approach/

## We are going to talk more about imputing data next semester, but in case you want a preview

## Note that we usually use categorical variables like "Preference"
## as dummy variables (0 and 1). We could do this with another ifelse() statement:
Pref_dummy=ifelse(beer$Preference=="Regular",1,0)
Pref_dummy

## Or we could change the type:
Pref_dummy = as.numeric(beer$Preference)
Pref_dummy

## What happened here? R always starts from 1 (and uses alphabetical order)
## To fix it:
Pref_dummy = as.numeric(beer$Preference)-1
Pref_dummy

## Exercise on your own: Load the Exams_Missing.csv file and answer the following:
## 1) How many total missing values are there?
## 2) How many missing values are in each variable?
## 3) Each exam score should be between 0 and 100. Change any other scores to missing.
##      How do your answers to 1 and 2 change?
##      Helpful hint: The | symbol means "OR" (like & means "AND")