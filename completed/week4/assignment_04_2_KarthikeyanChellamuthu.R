# Assignment: ASSIGNMENT 4.2
# Name: Chellamuthu, Karthikeyan
# Date: 2022-01-09
#1. assignment04.2  Data transformations

# Set working directory, location where my "scores.csv" file is saved along with my .R files
setwd("C:/Users/LENOVO/Desktop/BU/DSC 520 T302-2221 winter 2021-22/GIT-Hub/dsc520-master/data")
library(ggplot2)
library(readxl)
library(fitdistrplus)
library("dplyr")
library("plyr")
library(brms)
install.packages("brms")

# Import "week-7-housing.xlsx" for analysis and create a data frame
Housing <- read_excel("week-7-housing.xlsx")


#a.Use the apply function on a variable in your data set Construct a  matrix from Housing data frame
  
mat_Housing <- data.matrix(Housing)

#a.Apply function with three different apply function such as grouping , sum, sort to that matrix 

# a.1 Apply function with grouping
apply(mat_Housing, 1, grouping)

# a.2 Apply function with sum
apply(mat_Housing, 1, sum)

# a.3 Apply function with sort
apply(mat_Housing, 2, sort)



#b.Use the aggregate function on a variable in your dataset

aggregate(Sale_Date ~ Sale_Price, data=Housing,summary)

aggregate(Sale_Date ~ Sale_Price, data=Housing,mean)




#f.Create at least 2 new variables week-7-housing.xlsx

names(Housing) <- c("Sale_Date", "Sale_Price", "sale_reason", "sale_instrument", "sale_warning", "site_type", "addr_full", "zip5", "ctyname", "postalctyn", "lon", "lat", "building_grade", "square_feet_total_living", "bedrooms", "bath_full_count", "bath_half_count", "batch_3qtr_count", "year_built", "year_renovated", "current_zoning", "sq_ft_lot", "prop_type", "present_use")
str(Housing)
head(Housing)

#Dffiernt variables 

var1 <- lm(Sale_Price ~ sq_ft_lot, data = Housing)
var2 <- lm(Sale_Price ~ bedrooms + bath_full_count, data = Housing)

print(var2)
print(var1)

Sale_Price<- Housing[,2]
Housing$HouseTax <- with(Housing, Sale_Price*0.03)
Housing$HouseTax


#d.Check distributions of the data

summarise(Sale_Price)
ggplot(Housing, aes(Sale_Price)) + geom_histogram(bins= 500)

descdist(Sale_Price, discrete = FALSE)

#other example distributions of the data using a numerical vector

library(fitdistrplus)
descdist(x, discrete = FALSE)

# Identify if there are any outliers


# According to my analysis This data set brings a normal distribution based on  price is has positive Z score skewed.
# As we can see from the above  distribution most of them almost fits to the curve but there are some outliers here and there.
# such as  Sale_Price > '4000000' are assumed to be some of the outlines in this data sets.




#c.Use the plyr function on a variable in your dataset - more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together

# using dplyer we can do the following and here are some examples. 
# Rows:
# filter() chooses rows based on column values.
# slice() chooses rows based on location.
# arrange() changes the order of the rows.

# Columns:
# select() changes whether or not a column is included.
# rename() changes the name of columns.
# mutate() changes the values of columns and creates new columns.
# relocate() changes the order of the columns.

# Groups of rows:
# summarise() collapses a group into a single row.


dim(Housing)
#> [1] 12865    25
Housing


#Arrange rows with  descening order in plyer

Housing %>% arrange(desc(Sale_Price))

#Add a Housing_tax colum by having the sales price into 2.5%

Housing %>% mutate(Housing_tax = Sale_Price*0.025)

#Display the mutated coloumn. 

Housing %>% mutate(Housing_tax = Sale_Price*0.025) %>% select(Housing_tax, everything())

#apply filter rows with  
Housing %>% filter(Sale_Price == '4400000')

#The last verb is summarise(). It collapses a data frame to a single row for the mean value. 

Housing %>% summarise(Sale_Price = mean(Sale_Price, na.rm = TRUE))
