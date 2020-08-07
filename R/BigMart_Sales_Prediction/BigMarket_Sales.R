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
