# Skewness and Kurtosis
#https://www.r-bloggers.com/measures-of-skewness-and-kurtosis/
# Time for cycling a track
time <- c(19.09, 19.55, 17.89, 17.73, 25.15, 27.27, 25.24, 21.05, 21.65, 20.92, 22.61, 15.71, 22.04, 22.60, 24.25)

library(moments)
skewness(time)
#[1] -0.01565162
#Interpretation: The skewness here is -0.01565162. This value implies that the distribution of the data is slightly skewed to the left or negatively skewed. 
#It is skewed to the left because the computed value is negative, and is slightly, because the value is close to zero. 

kurtosis(time)

#[1] 2.301051
#For the kurtosis, we have 2.301051 
#implying that the distribution of the data is platykurtic, since the computed value is less than 3.
plot(time)
hist(time)
library(ggplot2)
qplot(time, geom = 'histogram', binwidth = 2) + xlab('Time')


# Example 2 ------------
#Simulate 10000 samples from a normal distribution with mean 55, and standard deviation 4.5, 
#then compute and interpret for the skewness and kurtosis, and plot the histogram.

#Simulation
n.sample <- rnorm(n = 10000, mean = 55, sd = 4.5)

#Skewness and Kurtosis
library(moments)
skewness(n.sample)
#[1] -0.008525844
kurtosis(n.sample)
#[1] 2.96577

#Histogram
library(ggplot2)
datasim <- data.frame(n.sample)

ggplot(datasim, aes(x = n.sample), binwidth = 2) + 
  geom_histogram(aes(y = ..density..), fill = 'red', alpha = 0.5) + 
  geom_density(colour = 'blue') + xlab(expression(bold('Simulated Samples'))) + 
  ylab(expression(bold('Density')))
ggplot(datasim,aes(x=n.sample)) + geom_histogram(bins=10)
#http://docs.ggplot2.org/current/geom_histogram.html  ggplot(df, aes(x=a)) + geom_histogram(bins=10)
#http://docs.ggplot2.org/0.9.3.1/geom_histogram.html

