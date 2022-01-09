# Assignment: ASSIGNMENT 4.2
# Name: Chellamuthu, Karthikeyan
# Date: 2022-01-09
#1. assignment04.1-Test Scores

# Set working directory, location where my "scores.csv" file is saved along with my .R files
setwd("C:/Users/LENOVO/Desktop/BU/DSC 520 T302-2221 winter 2021-22/GIT-Hub/dsc520-master/data")

# Import "scores.csv" for analysis
scores <- read.csv("scores.csv")

# 1. What are the observational units in this study?
#    There are 38 obs. of 3 variables. Count, Score and Section are the observational units in this study.
str(scores)

# 2. Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
#    Count and Score are quantitative and its a integer data type, The Section data type is categorical

# 3. Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
regular <- subset(scores, Section == "Regular")
sports <- subset(scores, Section == "Sports")


# 4. Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional Plot Arguments to label the graph and give each axis an appropriate label.
plot(regular$Score, regular$Count, main = "Regular Subset plot", xlab = " Score", ylab = " Count")
plot(sports$Score, sports$Count, main = "Sports Subset plot", xlab = " Score", ylab = " Count")

# 4.A Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: Can you say that one section tended to score more points than the other? Justify and explain your answer.
# When i looked at the both summary, the Regular subset is tended to score more points than the Sports subset. Since, we see a higher count of more scores in the Regular section.
# The summary function on these 2 subsets show that, "Regular subset has a better score Median when compared to Sports subset".
# Median Regular subset == 325.0
# Median Sports subset == 315.0
summary(regular)
summary(sports)

# 4.B Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.
# No. The data from the summary function, we can see the the Min , max as (200.0 & 395.0) ,Average of the regular subset has better scores. This concludes that no one had a better scores.

# 4.C What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
# Student Attendance is an important variable for this narrative. It surely can have an impact on the scores.