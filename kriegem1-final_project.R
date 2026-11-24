#kriegem1-final_project.R
#STA 145 Final Project, Activity 3.1: Upload your data into R


#load data into environment 
library(readr)
tvshows <- read.csv("data.csv")

#convert views and hours to numeric (i used YouTube because code was not working correctly before)
tvshows$views[tvshows$views == ""] <- NA
tvshows$hours[tvshows$hours == ""] <- NA

tvshows$views <- as.numeric(gsub(",", "", tvshows$views))
tvshows$hours <- as.numeric(gsub(",", "", tvshows$hours))

# run 3 checks 
dim(tvshows)
names(tvshows)
summary(tvshows)

#descriptive stats 
sd(tvshows$imdb_rating)
mean(tvshows$imdb_rating)
min(tvshows$imdb_rating)
max(tvshows$imdb_rating)
table(tvshows$age)


#linear regression
linear_model <-lm(imdb_rating~as.factor(age),data = tvshows)
summary(linear_model)

#box plot 
boxplot(imdb_rating~as.factor(age),data=tvshows)
