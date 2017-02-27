# Chap-2 : Data Pre- Processing

# Read data sets
#cars = read.csv(file="E:/dataSets/DM/cars.txt", stringsAsFactors = F)
#cars2 = read.csv(file="E:/dataSets/DM/cars2.txt", stringsAsFactors = F)

cars = read.csv(file="data/cars.txt", stringsAsFactors = F) # Linux
cars2 = read.csv(file="data/cars2.txt", stringsAsFactors = F) # Linux

# View its structure
str(cars)
str(cars2)

# Missing data
str(cars)
cars.4var = cars[,c(1,3,4,8)]
head(cars.4var)

# Make Certain Entries of NA in the data set
cars.4var[2,2] = cars.4var[4,4] = NA
head(cars.4var)

# Replace Missing values with constants
cars.4var[2,2] = 0
cars.4var[4,4] = 'Missing'
head(cars.4var)

# Replace values with mean and mode
mean(na.omit(cars.4var$cubicinches))
cars.4var[2,2] = mean(na.omit(cars.4var$cubicinches))
# for mode
our_table = table(cars.4var$brand)
our_table
names(our_table) [ our_table ==  max(our_table)]
our_mode = names(our_table) [ our_table ==  max(our_table)]
   #names(sort(-table(cars.4var$brand)))[1]  # another method
   # Mode of Character Field
   #library(modeest)
   #mlv(cars.4var$mpg, method = "mfv") This is for Numeric Field only

cars.4var[4,4] = our_mode
head(cars.4var)


# Generate Random Observations - Update it into Brand Missing Values
obs_brand = sample(na.omit(cars.4var$brand),1)
obs_brand

obs_cubicinches = sample(na.omit(cars.4var$cubicinches),1)
obs_cubicinches
cars.4var[2,2] = obs_cubicinches
cars.4var[4,4] = obs_brand
head(cars.4var)


# Create Histogram
plot.new()
par(mfrow=c(1,1))
hist(cars2$weightlbs,breaks=30,xlim=c(0,5000),col='blue', border='black', ylim=c(0,40), xlab='Weight', ylab='Counts',main='Histogram of Car Weights')
box(which='plot',lty='solid',col='black') # box around the plot : box()

# Create a Scatter Plot
plot.new()
plot(cars2$weightlbs, cars2$mpg, xlim=c(0,5000),ylim=c(0,600),xlab='Weight',ylab='MPG', main='Scatter Plot MPG vs Wt', type='p',pch=16,col='red') 

# Descriptive Statistics
mean(cars$weightlbs) # mean of Wt
median(cars$weightlbs) # median of wt
length(cars$weightlbs) #No of obsvns
sd(cars$weightlbs) # sd of obsvns
summary(cars$weightlbs) #Min, Q1, Median, Mean, Q3, Max


# Transformations
# min - max normalisations
summary(cars$weightlbs)
mi = min(cars$weightlbs)
ma = max(cars$weightlbs)
paste('Min ',mi, 'Max' ,ma)
minmax.weight = (cars$weightlbs - mi)/(ma - mi)
cars$weightlbs
minmax.weight
range(cars$weightlbs)
range(minmax.weight)


# Decimal Scaling  = value/ max value in 100x form
max(abs(cars$weightlbs)) # 4 digits
d.weight = cars$weightlbs/(10^4) 
d.weight # scaled values between 0 and max values in 1000x form

# Z Score standardisation  Z = (x - mean)/ sd
m = mean(cars$weightlbs)
m
s = sd(cars$weightlbs)
s
z.weight = (cars$weightlbs-m)/s
z.weight

# Side by Side Histograms
plot.new()
par(mfrow=c(1,2))
# Create 2 histograms
#hist(cars$weightlbs)
hist(cars$weight, breaks=20, xlim=c(1000,5000),main='Histogram of Wt', xlab='Weight', ylab='Count')
box(which='plot',lty='solid', col='black') # box around the plot box()

# 2nd plot
hist(z.weight, breaks=20, xlim=c(-2,3),main='Histogram of Z score of Wt', xlab='Z score of Weight', ylab='Count')
box(which='plot',lty='solid', col='red') # box around the plot box()

# Skewness = 3 (Mean - Median) / sd
(3*(mean(cars$weightlbs) - median(cars$weightlbs)))/ (sd(cars$weightlbs))  # 0.6
(3*(mean(z.weight) - median(z.weight)))/ (sd(z.weight))  # 0.6

# Reduce Skewness for Analysis : Transform by using Square Root and Log
# Transformation for Normality
sqrt.weight = sqrt(cars$weight) # square root
hist(sqrt.weight) # less skewed
sqrt.weight_skew = (3*(mean(sqrt.weight) - median(sqrt.weight)))/ (sd(sqrt.weight))  # 0.403 less/ reduced
sqrt.weight_skew
library(moments)
#?skewness
#skewness(sqrt.weight)

ln.weight = log(cars$weight) # natural log
ln.weight_skew= (3*(mean(ln.weight) - median(ln.weight)))/ (sd(ln.weight))  # 0.196 lesser
ln.weight_skew
hist(ln.weight)
fivenum(ln.weight)
summary(ln.weight)
#skewness(ln.weight)

invsqrt.weight = 1/sqrt(cars$weight) # Inverse Square Root
invsqrt.weight_skew= (3*(mean(invsqrt.weight) - median(invsqrt.weight)))/ (sd(invsqrt.weight))  
invsqrt.weight_skew # 0.0154 lesser

# Histogram with Normal Distribution Overlay
par(mfrow=c(1,1))
x = rnorm(1000000,mean=mean(invsqrt.weight), sd = sd(invsqrt.weight))
plot(density(x))
plot.new()
hist(invsqrt.weight)
range(x)
hist(invsqrt.weight,breaks=30,xlim=c(0.0125,0.0275), col='lightblue',prob=T,
     border='black',xlab='Inverse Sq Root of Wt', ylab='Counts',main='Histogram of Inv Sq Root of Wt')
box(which='plot',lty=5,col='green')
# Overlay with Normal Density
lines(density(x),col='red')

# Normal QQ Plot
qqnorm(invsqrt.weight, datax=T, col='red', ylim=c(0.01, 0.03), main ='Normal QQ Plot of Inv Sq root of Wt')
qqline(invsqrt.weight,col='blue',datax=T)

# De-Transform data
# Transform x using y = 1/sqrt(x)
x = cars$weightlbs[1] ; x
y= 1/sqrt(x) ; y
# Detransform x using x = 1/y^2
detransformedx = 1/y^2
x;y; detransformedx

# Create Indicator Variables
north_flag = east_flag = south_flag = c(rep(NA,10))
north_flag ; east_flag ; south_flag
region = c(rep(c('north','south','east','west'),2),'north','south')
region
# Change region variable to indicators
for (i in 1:length(region)) {
  if(region[i]=='north') north_flag[i] = 1
    else north_flag[i] = 0
  if(region[i]=='east') east_flag[i] = 1
    else east_flag[i] = 0
  if(region[i]=='south') south_flag[i] = 1
    else south_flag[i] = 0
}
north_flag ; east_flag ; south_flag 

# Index Fields
# Data  Frames have an index field 
cars
cars[order(cars$mpg),] # order by first column
# Vectors or matrices : add a coln to act as an index field
x = c(1,1,3:1,1:4,3) ; y = c(9,9:1) ; z = c(2,1:9)
x;y;z
matrix= (t(rbind(x,y,z))) ; matrix
indexed_m = cbind(c(1:length(x)), matrix) ; indexed_m
indexed_m[order(z)]

# Duplicate records
anyDuplicated(cars) # all at once
duplicated(cars) # one by one T/F for each row
new.cars = rbind(cars,cars[1,]) # make sample duplicate
anyDuplicated(new.cars) # all at once 262 record is duplicated
duplicated(new.cars) # 1 by 1
new.cars2 = rbind(new.cars,cars[1,],cars[2,],cars[3,]) # make sample duplicate
anyDuplicated(new.cars2,fromLast =F) # all at once 262 record is duplicated
duplicated(new.cars2) # 1 by 1

