titanic <- read.csv("C:/Users/Daniel/Google Drive/Stuff/Daniel/School/ANLY 6100_2020.09/Assignment 2/Titanic_sample.csv")
titanic

### 1) - 5 points
## Before the regression: Conventional wisdom says we should consider
## removing a variable from a data set if it has 40% or more missing
## values. Do we need to consider removing any of the variables in
## this data set? Explain.

sapply(titanic,function(x) mean(is.na(x)))


### 2) - 25 points
## Start by running a multiple regression using Fare as your Y variable
## and all other variables as X variables. Be sure to include the output 
## of your model (using summary()) with your assignment.

### a)
## Do you consider this a good model? Why or why not?

### b)
## If you were to remove a variable from this model, what variable
## would you suggest removing? Why?

## c)
## According to your model, what is the effect on the fare a
## passenger paid when they survived vs. not survived?
## (Make sure to give this effect in terms of the problem!)

## d)
## Does your answer to part (c) make sense to you? Explain.

## e) 
## One of the researchers on the Titanic team knows the passengers
## were actually classified as first class (the highest class),
## second class, and third class (the lowest class) rather than using
## letters like X, Y, and Z. Based on your regression output, which 
## letter likely corresponds to first class? Explain.
