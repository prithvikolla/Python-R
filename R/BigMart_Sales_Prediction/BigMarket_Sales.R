library(data.table) #used for reading and manupulation of data
library(dplyr) #data manupulation and joining library
library(caret) #modeling
library(corrplot) #correlation plots
library(xgboost) # creating xgboost model
library(cowplot) # combining multiple plots
library(ggplot2) #plotting
train = fread("/Users/prithvinagkolla/Documents/GitHub/Python-R/R/BigMart_Sales_Prediction/train_v9rqX0R.csv")
test = fread("/Users/prithvinagkolla/Documents/GitHub/Python-R/R/BigMart_Sales_Prediction/test_AbJTz2l.csv")
dim(train) #finding dimensions for better understanding
dim(test)
names(train)
names(test)
test[,Item_Outlet_Sales:= NA]
combi = rbind(train,test) #rbind is used to combine data
dim(combi)
ggplot(train) + geom_histogram(aes(train$Item_Outlet_Sales), binwidth = 100, fill = "darkgreen") + xlab("Item_Outlet_Sales")
#Indepandent Variables
p1 = ggplot(combi) + geom_histogram(aes(Item_Weight), binwidth = 0.5, fill = "blue")
p2 = ggplot(combi) + geom_histogram(aes(Item_Visibility), binwidth = 0.005, fill = "blue")
p3 = ggplot(combi) + geom_histogram(aes(Item_MRP), binwidth = 1, fill = "blue")
plot_grid(p1,p2,p3, nrow = 1)
ggplot(combi %>% group_by(Item_Fat_Content) %>% summarise(Count = n())) + 
  geom_bar(aes(Item_Fat_Content,Count), stat = "Identity", fill = "blue")
