#######################################################################
#### Introduction to R
### Intro to basics

# Assignment operator
name <- "Daniel"
name

# What is the class of my variable?
class(42) # numerics
class(TRUE) # logical
class("text") #character

# See what contents you have setup in your workspace
ls()


#######################################################################
#### Introduction to R
### Vectors
# vectors are one dimensional arrays of the same data type

# combine function c()
num_vect <- c(4,5,6,7) # creates a numerical vector num_vect
char_vect <- c("A","B","C") # creates a character vector named char_vect
class(num_vect) #class() can also be used on vectors
class(char_vect)

# names function
names(num_vect) <- c("num1","num2","num3","num4")
num_vect

# calculations with vectors
num_vect2 <- c(1,2,3,4)
num_vect + num_vect2 
# you can add vectors of different lengths. However, the vector will go
# back to the first value in the longer vector to calculate
num_vect3 <- c(1,2,3)
num_vect + num_vect3 

# sum function
sum(num_vect)
#can calculate only certain vector elements
sum(num_vect[c(1,3)]) # adds element 1 and 3
sum(num_vect[c(1:3)]) # adds elements 1 through 3
sum(num_vect[c("num1","num2")]) # can also add using names

# comparative operators
num_vect > 5 
num_vect == 5
# can count using a comparative operator
sum(num_vect > 5) # returns 2, because two elements are > 5
# can return names for columns based on comparison
select_vect <- num_vect > 5
named_vect <- num_vect[select_vect]
named_vect


#######################################################################
#### Introduction to R
### Matricies
# a matrix is a collection of elements of the same data type
mtr <- matrix(1:9,byrow = T, nrow = 3)

# can name the rows and columns
rownames(mtr) <- c("row1","row2","row3")
colnames(mtr) <- c("col1","col2","col3")
mtr

# can sum rows and columns
rowT <- rowSums(mtr)
colT <- colSums(mtr)

# can add new rows or columns using rbind() and cbind()
rbind(mtr,colT)
cbind(mtr,rowT)

# select specific matrix elements [row,col]
mtr[,1] # column 1
mtr[1,] # row 1
mtr["row1",] # row named row1
mtr[1:3,1:3] # rows 1 through 3 and columns 1 through 3

# can use standard operators with matricies 
mtr * 5

#######################################################################
#### Introduction to R
### Factors
# a factor is a categorical rather than continuous variable
# sex has two categories
sex <- c("M","F","F","M","M")
sex_fac <- factor(sex)
sex_fac

# nominal categorical variable has no natural order
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
print(factor(animals_vector, order = T))

# ordinal categorical variable has a natural order, but must be defined
temp_vect <- c("High", "Low", "High","Low", "Medium")
print(factor(temp_vect, order = T, levels = c("Low","Medium","High")))

# ordered factors can be compared
temp_vect[1] < temp_vect[2]

# can change factor level, make sure order matches or specify
sex_fac # Alphabetical F,M
levels(sex_fac) <- c("Female","Male") 
sex

# summary will give an overview of a variable and it's contents
summary(sex_fac)

#######################################################################
#### Introduction to R
### Data Frames
# matricies that can contain different data types

# show the first or last 6 or n rows of data
head(mtcars)
head(mtcars, 10)
tail(mtcars)
tail(mtcars,10)

# view the structure of your data set, shows columns, variable type and 
# some variable values
str(mtcars)

# create a data frame
# create vectors for frame first
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)

# select specific rows or columns in data frame just like matrix and vectors
planets_df[1,]
planets_df[,"rings"]

# subset data to only look at observations that meet certain criteria
subset(planets_df, subset = diameter < 1)

# reorder data set
order(planets_df$diameter)

#######################################################################
#### Introduction to R
### Lists
# lists can include matrix, vectors and data frames
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)

# generally it's good practice to name your elements in a list
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)

#######################################################################
### Data Wrangling

install.packages(c("MASS", "ISLR"))

# library with a GDP data set
install.packages('gapminder')
library(gapminder)

# package that allows you to analyze data more easily
install.packages('dplyr')
library(dplyr)

# dplyr verb that allows you to view a subset of your data
gapminder %>%
filter(gapminder$year == 1952)

# dplyr verb that allows you to sort your data set differently
gapminder %>%
arrange()
# allows you to change sort order to descending
gapminder %>%
arrange(desc())

# Use mutate to change a variable
gapminder %>%
mutate(pop = pop / 1000000)

# Use mutate to create a new variable
gapminder %>%
mutate(gdp = gdpPercap * pop)

# Combine verbs
gapminder %>%
filter(gapminder$year == 1952) %>%
mutate(pop = pop / 1000000) %>%
arrange(desc(pop))


#######################################################################
### Data visualization

## ggplot2 package
install.packages('ggplot2')
library(ggplot2)

# Create a subset with only 1952 data
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create plot
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  
  geom_point() # this create a point plot
 # geom_line() # this creates a line plot
 # geom_col() # this creates a vertical bar or column plot
 # geom_histogram() # this creates a histogram - only has an x axis
 # geom_boxplot()

# Adjust plot scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() +
  scale_x_log10()

# Adding color and size to plots
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10()

# Faceting - divide plots into subplots
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ year)

# Rescale the graph or chart
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() +
  expand_limits(y = 0)

# Create a line plot
ggplot(gapminder_2007, aes(x = lifeExp)) +
  geom_histogram(binwidth = 5) + 
  scale_x_log10()


#######################################################################
### Grouping and summarizing
# Summarizing or grouping data using aggregate functions (mean, sum, min, max, etc.)
gapminder %>%
  summarize(meanLifeExp = mean(lifeExp))

# Summary can also have multiple steps
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp))

# Can aggregate more than one field at a time
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp)
           ,maxGdpPercap = max(gdpPercap))

# Group by
gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp)
           ,maxGdpPercap = max(gdpPercap))


#######################################################################
#### Intermediate R
### Conditionals and Control Flow

## Relational Operators
# Equality ==
# Inequality !=
# Less than <, Greater than <
# Hello is greater than Goodbye because H comes after G in the alphabet
"Hello" > "Goodbye"
# relational operators can be used with vectors
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)
views
views >= 13

## Logical Operators
# and &
# or |
# not !
# && and || - only returns result of first element in each vector 
x <- 5
y <- 7
!(!(x < 4) & !!!(y > 12))

## Conditional Statements
# the else statement must be on the same line as the closing bracket
# for if

# if(condition) {
#   expr
# } else {
#   expr2
# }

# Can do multiple if statements, but r will return the first true
# record. e.g. if 6 %% 2, else if 6 %% 3

# if(condition) {
#   expr
# } else if(condition2) {
#   expr2
# } else {
#   expr3
# }
x <- 5
if


#######################################################################
#### Intermediate R
### Loops

## While loop
ctr <-1 # set ctr
while(ctr <= 7){ # this loop will run as long as this is true
  print(paste("ctr is set to",ctr)) # if while() is true, this is what we want to happen
  ctr <- ctr +1 # for this loop, if we don't increment ctr, the loop will continue to run because ctr = 1
}

# if we want to break the loop for some other reason
ctr <-1
while(ctr <= 7){
  if(ctr %% 5 == 0) {
    break
  }
  print(paste("ctr is set to",ctr))
  ctr <- ctr +1
}

# we can have multiple criteria
speed <- 64

while (speed > 30) {
  print(paste("Your speed is",speed))
  if (speed > 48 ) {
    print(paste("Slow down big time!"))
    speed <- speed - 11
  } else {
    print(paste("Slow down!"))
    speed <- speed - 6
  }
}


## For loop
# for(var in seq){
#   expr
# }

cities <- c("New York","Paris","London","Tokyo","Rio de Janeiro","Cape Town")
for(city in cities){
  print(city)
}

# break if city is a six character string
for(city in cities) {
  if(nchar(city) == 6) {
    break
    }
    print(city)
}

# move to the next element if city is a 6 character string
for(city in cities) {
  if(nchar(city) == 6) {
    next
    }
    print(city)
}
# this method gives access to the index info
for(i in 1:length(cities)) {
  print(cities[i])
}

# we can use index info in our expression
for(i in 1:length(cities)) {
  print(paste(cities[i],"is on position",i,"in the cities vector"))
}

#######################################################################
#### Intermediate R
### Functions
# returns the arguments for a function
args(sd)