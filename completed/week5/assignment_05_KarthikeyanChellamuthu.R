# Assignment: ASSIGNMENT 5
# Name: Chellamuthu, Karthikeyan
# Date: 2022-01-14

#1. Assignment05  Data transformations contd.,



# Set working directory, location where my "week-7-housing.xlsx" file is saved along with my .R files

setwd("C:/Users/LENOVO/Desktop/BU/DSC 520 T302-2221 winter 2021-22/GIT-Hub/dsc520-master/data")

# library

library("dplyr")
library("plyr")
library(purrr)

library(ggplot2)
library(readxl)
library(fitdistrplus)
library(brms)
library(tidyverse)

install.packages("brms")



# Import "week-7-housing.xlsx" for analysis and create a data frame

Housing <- read_excel("week-7-housing.xlsx")

dim(Housing)

class(Housing)

str(Housing)

head(Housing)

tail(Housing)


names(Housing) <- c("Sale_Date", "Sale_Price", "sale_reason", "sale_instrument", "sale_warning", "site_type", "addr_full", "zip5", "ctyname", "postalctyn", "lon", "lat", "building_grade", "square_feet_total_living", "bedrooms", "bath_full_count", "bath_half_count", "batch_3qtr_count", "year_built", "year_renovated", "current_zoning", "sq_ft_lot", "prop_type", "present_use")


 
# Using the dplyr package, use the 6 different operations to analyze/transform the data - 

# 1. GroupBy, 


df_grp_zip5 = Housing %>% group_by(zip5)  %>%
  summarize(Sale_Price = mean(Sale_Price, na.rm = TRUE))



# 2. Summarize,


Housing %>% summarize(Sale_Price = mean(Sale_Price, na.rm = TRUE))
summarize(Housing, Sale_Price = median(Sale_Price, na.rm = TRUE))
summarize(Housing, Sale_Price = max(Sale_Price, na.rm = TRUE))
summarize(Housing, Sale_Price = min(Sale_Price))

# 3. Mutate, 


Housing %>% mutate(Housing_tax = Sale_Price*0.025)

#Display the mutated coloumn. 

Housing %>% mutate(Housing_tax = Sale_Price*0.025) %>% select(Housing_tax, everything())



# 4.Filter
 

Housing %>% filter( zip5 == '98053')
Housing %>% filter( Sale_Price > '40000000')


# 5.Select with multiple type


select(Housing,"Sale_Date", "Sale_Price", "sale_reason", "sale_instrument", "ctyname")

Housing %>% select_("Sale_Date", "Sale_Price", "sale_reason", "sale_instrument", "ctyname")

Housing %>% select("Sale_Date", "Sale_Price", "sale_reason", "sale_instrument", "ctyname")

Housing %>% select(c("Sale_Date", "Sale_Price", "sale_reason", "sale_instrument", "ctyname"))

Housing %>% select(starts_with('s'))





#  6.Arrange - Remember this isn't just modifying data, you are learning about your data also - so play around and start to understand your dataset in more detail


# 6.1 Arrange descending 

Housing %>% arrange(desc(Sale_Price))  %>%  filter( Sale_Price > '40000000')

# 6.2 Arrange ascending 

Housing %>% arrange(Sale_Price)  %>%  filter( Sale_Price < '40000')



# Using the purrr package - perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.

#  purrr package

Housing %>% map_dbl(mean)

Housing %>% summarise_each(funs(mean))

#Build the matrix

Housing_Matrix <- matrix(1:9, nrow = 3)

# keep() and discard() are opposites. compact() is a handy wrapper that removes all empty elements

library(purrr)

# keep()

rep(20, 10) %>%
  map(sample, 8) %>%
  keep(function(x) mean(x) > 7)

# keep() using a formula

rep(20, 10) %>%
  map(sample, 8) %>%
  keep(~ mean(.x) > 8)



# discard() Using a string instead of a function will select all list elements

# where that subelement is TRUE

x <- rerun(5, a = rbernoulli(1), b = sample(20))
x
x %>% keep("a")
x %>% discard("a")


# compact() discards elements that are NULL or that have length zero

list(a = "a", b = NULL, c = integer(0), d = NA, e = list()) %>%
  compact()
 





# Use the cbind and rbind function on your dataset

Housing1 <- 1:5
Housing2 <- 6:10
Housing3 <- 11:15


# Create a matrix where x, y and z are columns
# cbind 
cbind(Housing1, Housing2, Housing3)
# rbind
rbind(Housing1, Housing2, Housing3)



#Split a string, then concatenate the results back together


head(Housing)

head(Housing$year_built)

library(stringr)

# String split
yearBuild <- str_split(string=Housing$year_built,pattern = "-")

# using R-Bind concatinate back to the results togegher.

yearMatrix <- data.frame(Reduce(rbind, yearBuild))
yearMatrix

head(yearMatrix)




