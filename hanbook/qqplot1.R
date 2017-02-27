# Quantile Plot 
# http://data.library.virginia.edu/understanding-q-q-plots/
#Q-Q plot, or quantile-quantile plot, is a graphical tool to help us assess 
#if a set of data plausibly came from some theoretical distribution such as a Normal or exponential
#f we run a statistical analysis that assumes our dependent variable is Normally distributed, 
#we can use a Normal Q-Q plot to check that assumption.  It’s just a visual check

qnorm(seq(0.05,0.95,0.05))
quantile(rnorm(200),probs = seq(0.01,0.99,0.01))
#In R, there are two functions to create Q-Q plots: qqnorm and qqplot.
#qqnorm creates a Normal Q-Q plot. You give it a vector of data and
#R plots the data in sorted order versus quantiles from a standard Normal distribution
str(trees)
qqnorm(trees$Height)  # using trees data set
# qqnorm function, you have to provide two arguments: 
#the first set of data and the second set of data. 
str(randu)
y <- qunif(ppoints(length(randu$x)))
head(y); head(randu$x)
qqplot(randu$x,y) #Q-Q plot of the sorted random numbers versus quantiles from a theoretical uniform (0,1) distribution.

# Not normal distributed data
qqplot(qnorm(ppoints(30)), qchisq(ppoints(30),df=3))
qqplot(qnorm(ppoints(30)), qcauchy(ppoints(30)))
#mean your data have more extreme values than would be expected if they truly came from a Normal distribution.



# Example 2
x = c(1.3, 2.2, 2.7, 3.1, 3.3, 3.7)
quantile(x)
quantile(x, seq(0, 1, by=.1))
# qq plot
n = max(length(x), length(y))
p = (1:n - 1)/(n - 1)
qx = quantile(x, p)
qy = quantile(y, p)
plot(qx, qy)

rain = read.csv('data/rain.csv')
str(rain)
