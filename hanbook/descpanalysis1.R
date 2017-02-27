# Histogram - Distribution - skewness
#http://www.statmethods.net/stats/descriptives.html

# cars - The data give the speed of cars and the distances taken to stop. 
#Note that the data were recorded in the 1920s.
str(cars)

mydata = cars$speed

?hist
hist(mydata)   # distribution

# Box Plot - Outliers

boxplot(mydata)
boxplot(mydata, cars$dist) 

# Summary
summary(mydata)
# min, 1Q, 3Q, Mean, Median, Max

library(Hmisc)
describe(mydata) 
# n, nmiss, unique, mean, 5,10,25,50,75,90,95th percentiles 
# 5 lowest and 5 highest scores

library(pastecs)
stat.desc(mydata) 
# nbr.val, nbr.null, nbr.na, min max, range, sum, 
# median, mean, SE.mean, CI.mean, var, std.dev, coef.var

library(psych)
describe(mydata)
# item name ,item number, nvalid, mean, sd, 
# median, mad, min, max, skew, kurtosis, se

# get means for variables in data frame mydata
# excluding missing values 
#sapply(mydata, mean, na.rm=TRUE)
#Possible functions used in sapply include mean, sd, var, min, max, median, range, and quantile.

# Tukey min,lower-hinge, median,upper-hinge,max
fivenum(mydata)

data("Titanic")
str(Titanic)
head(Titanic)

data('USArrests')
str(USArrests)  # all columns are numbers
head(USArrests)

data("mtcars")
str(mtcars)

library(psych)
describeBy(mtcars$mpg, mtcars$cyl)

library(doBy)
summaryBy(mpg + wt ~ cyl + vs, data = mtcars, 
          FUN = function(x) { c(m = mean(x), s = sd(x)) } )
# produces mpg.m wt.m mpg.s wt.s for each 
# combination of the levels of cyl and vs
