# Chap-2 : Data Pre- Processing

# Read data sets
cars = read.csv(file="E:/dataSets/DM/cars.txt", stringsAsFactors = F)
cars2 = read.csv(file="E:/dataSets/DM/cars2.txt", stringsAsFactors = F)

# Missing data
str(cars)
cars.4var = cars[,c(1,3,4,8)]
head(cars.4var)

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
cars.4var[4,4] = our_mode

head(cars.4var)

# Generate Random Observations
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
paste('Min ',mi, 'Max' ,ma)
minmax.weight = (cars$weightlbs - mi)/(ma - mi)
minmax.weight

# Decimal Scaling  = value/ max value in 100x form
max(abs(cars$weightlbs)) # 4 digits
d.weight = cars$weightlbs/(10^4) 
d.weight # scaled values between 0 and max values in 1000x form

# Z Score standardisation  Z = (x - mean)/ sd
m = mean(cars$weightlbs)
s = sd(cars$weightlbs)
z.weight = (cars$weightlbs-m)/s
z.weight

# Side by Side Histograms
plot.new()
par(mfrow=c(1,2))
# Create 2 histograms
#hist(cars$weightlbs)
hist(cars$weight, breaks=20, xlim=c(1000,5000),main='Histogram of Wt', xlab='Weight', ylab='Count')
box(which='plot',lty='solid', col='black') # box around the plot box()

#
hist(z.weight, breaks=20, xlim=c(-2,3),main='Histogram of Z score of Wt', xlab='Z score of Weight', ylab='Count')
box(which='plot',lty='solid', col='red') # box around the plot box()
