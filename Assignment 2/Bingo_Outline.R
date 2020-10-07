### Assignment 2 (Part 1) Bingo Outline
### ANLY 6100, Fall 2020
### Professor: Courtney Paulson

## The following is a partially completed outline for the
##    game of bingo (rules given in Assignment 2).
## Complete the tasks to run a complete game of bingo.

## Please note that you are NOT required to follow this outline!
## It may help you structure your thinking, but it is only
##    intended as a guide if you want one.


## First, set the seed to 24646
set.seed(24646)

## Next, create a valid bingo card by randomly selecting 24 numbers
##    from 1 to 75 according to the column rules (e.g. 5 numbers
##    from 1 to 15, 5 numbers from 16 to 20, etc.).
##    Be sure to sample without replacement!

B <- sample( 1:15,5,replace = F)
I <- sample(16:30,5,replace = F)
N <- sample(31:45,5,replace = F)
G <- sample(45:60,5,replace = F)
O <- sample(60:75,5,replace = F)
card <- data.frame(B,I,N,G,O)
card[3,3] = "FS"
card

## Next, create a function named bingo_game which
##    takes in a bingo card, plays a game of bingo, and
##    returns the value of the game.
## The game should follow the rules given in the Assignment file

bingo_game <- function(bingo_card = NULL,){
  
  game_num <- 
  card_num <- game_num %in% bingo_card
  if(){}
  else if(){}
  else if(){}
  else if(){}
  else if(){}
  else{}
  
  
}

## Write a loop to play 100 games of bingo with your function
##    and record the return of each game



## What is the expected value of playing 100 games of bingo?


## Did you work with anyone on this part of the assignment?
##    If so, write their names here:
