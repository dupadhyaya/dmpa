# Chap-1 : Introduction to DM & Predictive Analytics
# data = read.csv("E:\dataSets\DM\..", stringsAsFactors = False)

# Open Data set and display data
#cars = read.csv(file="E:/dataSets/DM/cars.txt", stringsAsFactors = F) # Win

cars = read.csv(file="data/cars.txt", stringsAsFactors = F) # Linux
str(cars)

head(cars)
names(cars)
cars$weight

# Matrices
mat = matrix(0.0, nrow=3, ncol=2)
mat
colnames(mat) = c('Var1','Var2')
colnames(mat)

# Subset data and declare new variables
cars.rsub = cars[1:50,] # subset by rows
cars.rsub

cars.csub = cars[,1:3] # subset by colns
cars.csub

cars.rcsub = cars[c(1,3,5),c(2,4)] # Subset by selected rows & colns
cars.rcsub

cars.vsub = cars[which(cars$mpg > 30),] # logical condition of mpg > 30
cars.vsub

# Display more than 1 figure at a time
par(mfrow=c(1,1)) # default setting of 1 plot
par(mfrow=c(2,3)) # 2 x 3 = 6 figures : 3 per row
