# Assignment: ASSIGNMENT 3.2 American Community Survery
# Name: Chellamuthu, Karthikeyan
# Date: 2021-12-13
#2. assignment03
# Set working directory, location where my "acs-14-1yr-s0201.csv" file is saved along with my .R files

setwd("C:/Users/LENOVO/Desktop/BU/DSC 520 T302-2221 winter 2021-22/GIT-Hub/dsc520-master/data")
# Import "acs-14-1yr-s0201.csv" for analysis
USCommunitySurvey <- read.csv("acs-14-1yr-s0201.csv")

# Install and load ggplot2

library("ggplot2")

# 1. What are the elements in your data (including the categories and data types)?

str(USCommunitySurvey)

# There are 8 variables in this .csv file - Id, Id2, Geography, PopGroupID, POPGROUP.display.label, RacesReported, HSDegree, BachDegree

#   Categorical         : Id, Id2, Geography, PopGroupID, POPGROUP.display.label
#   Quantitative        : RacesReported, HSDegree, BachDegree
#   Integer Data Types  : Id2, PopGroupID, RacesReported
#   Numeric Data Types  : HSDegree, BachDegree
#   Character Data Types: Id, Geography, POPGROUP.display.label

# 2. Please provide the output from the following functions: str(); nrow(); ncol()

str(USCommunitySurvey)

# 'data.frame':	136 obs. of  8 variables:
# $ Id                    : chr  "0500000US01073" "0500000US04013" "0500000US04019" "0500000US06001" ...
# $ Id2                   : int  1073 4013 4019 6001 6013 6019 6029 6037 6059 6065 ...
# $ Geography             : chr  "Jefferson County, Alabama" "Maricopa County, Arizona" "Pima County, Arizona" "Alameda County, California" ...
# $ PopGroupID            : int  1 1 1 1 1 1 1 1 1 1 ...
# $ POPGROUP.display.label: chr  "Total population" "Total population" "Total population" "Total population" ...
# $ RacesReported         : int  660793 4087191 1004516 1610921 1111339 965974 874589 10116705 3145515 2329271 ...
# $ HSDegree              : num  89.1 86.8 88 86.9 88.8 73.6 74.5 77.5 84.6 80.6 ...
# $ BachDegree            : num  30.5 30.2 30.8 42.8 39.7 19.7 15.4 30.3 38 20.7 ...

nrow(USCommunitySurvey)

# [1] 136

ncol(USCommunitySurvey)

# [1] 8

# 3. Create a Histogram of the HSDegree variable using the ggplot2 package.
#    a. Set a bin size for the Histogram.
#    b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(USCommunitySurvey, aes(x = HSDegree)) +
  
geom_histogram(aes(y = ..density..), binwidth = 0.3, col = "black", fill = "white") +
  
xlab("% HS Degree") + ylab("Number of Geographic location") + ggtitle("Histogram - HS Degree")

# 4. Answer the following questions based on the Histogram produced:
#    a. Based on what you see in this histogram, is the data distribution unimodal?
#       Yes.
#    b. Is it approximately symmetrical?
#       No. 
#    c. Is it approximately bell-shaped?
#       No.
#    d. Is it approximately normal?
#       No.
#    e. If not normal, is the distribution skewed? If so, in which direction?
#       Yes, skewed to the left
#    f. Include a normal curve to the Histogram that you plotted.

ggplot(USCommunitySurvey, aes(x = HSDegree)) +
  
geom_histogram(aes(y = ..density..), binwidth = 0.3, col = "black", fill = "white") +
  
xlab("% HS Degree") + ylab("Number of Geographic location") + ggtitle("Histogram - HS Degree") +
  
stat_function(fun = dnorm, colour = "blue", args = list(mean = mean(USCommunitySurvey$HSDegree), sd = sd(USCommunitySurvey$HSDegree)))

#    g. Explain whether a normal distribution can accurately be used as a model for this data.
#       This model cannot be used as a normal distribution. In this plot we see a normal curve on the histogram which gives a good idea on the data, but it's not a accurate information.

# 5. Create a Probability Plot of the HSDegree variable.

qqnorm(USCommunitySurvey$HSDegree)

qqline(USCommunitySurvey$HSDegree, col = 2, lwd = 2, lty = 2)

# 6. Answer the following questions based on the Probability Plot:
#    a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
#       No, the probability plots are not along the red straight line. so, I would not consider this as normal distribution.
#    b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
#       The probability plots are the dotted red line. which means that it is left skewed or negative skewed distribution.

# 7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
# install.packages("pastecs")  --> Executed only one time to install

library("pastecs")
stat.desc(USCommunitySurvey$HSDegree, basic=TRUE, desc=TRUE, norm=TRUE)
#   Below is a screen capture of the results.
#   nbr.val      nbr.null        nbr.na           min           max         range           sum        median          mean 
#   1.360000e+02  0.000000e+00  0.000000e+00  6.220000e+01  9.550000e+01  3.330000e+01  1.191800e+04  8.870000e+01  8.763235e+01 
#   SE.mean  CI.mean.0.95           var       std.dev      coef.var      skewness      skew.2SE      kurtosis      kurt.2SE 
#   4.388598e-01  8.679296e-01  2.619332e+01  5.117941e+00  5.840241e-02 -1.674767e+00 -4.030254e+00  4.352856e+00  5.273885e+00 
#   normtest.W    normtest.p 
#   8.773635e-01  3.193634e-09 


# 8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
#    For the normal distribution, the value of skew and kurtosis should be zero. The negative value of the skew (-4.030254e+00) indicates a pile-up on the right of the distribution.
#    The positive value of kurtosis (4.352856e+00) indicates a pointy and heavy-tailed distribution. The further value is from zero, to more likely it is that the data is not normally distributed.
#    Z-Score is a score from distribution with mean = 0 and standard deviation = 1.
#    Z-Skewness = (S-0) / SEskewness
#    Z-Kurtosis = (K-0) / SEkurtosis
#    where S is Skew, K is Kurtosis and SE is Standard Errors.
#    From stat.desc(), skew.2SE and kurt.2SE are the skew and kurtosis value divided by 2 standard errors.
#    z is significant if it is greater than 2 (1.96) therefore if skew.2SE or kurt.2SE is greater than 1 then we have a significant skew/kurtosis.
#    In our case both skew.2SE and kurt.2SE are greater than 1 which indicates a significant skew and kurtosis.
#    Change in size does not have an impact on explanation. For fairly small samples we need to interpret values of skew.2SE and kurt.2SE cautiously so that we can get information related to the impact of skewness and kurtosis.
#    If we have a large sample, then it is important to look at the shape of the distribution visually and to look at statistics rather than calculating the same.