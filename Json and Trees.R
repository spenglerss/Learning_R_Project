# Some JSON experiments

library(jsonlite)

test <- fromJSON("TestFileTheGallery.json")

menu <- test[["menu"]]

variants <- test[["menu"]][["variants"]]

flattened_test <- flatten(test, recursive = TRUE)

# This is exercise to create Trees based on this blog post: https://www.datacamp.com/community/tutorials/decision-trees-R


library(ISLR)
library(tree)

data(package="ISLR")

carseats <- Carseats

head(carseats)
names(carseats)
hist(carseats$Sales)

# Going to create a new variable alled "HIGH" based on the value in Sales:

High <- ifelse(carseats$Sales <=8, "No", "Yes")
carseats <- data.frame(carseats, High)

#do a tree without Sales because the feature 


High is based on Sales
tree.carseats = tree(High~.-Sales, data = carseats)
summary(tree.carseats)

plot(tree.carseats)
text(tree.carseats, pretty = 0)
