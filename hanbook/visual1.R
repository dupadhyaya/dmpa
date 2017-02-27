# Visualisation

m = matrix(runif(100),10,10)
image(m)

#http://stackoverflow.com/questions/5638462/r-image-of-a-pixel-matrix

library(gplots)

#Build the matrix data to look like a correlation matrix
x <- matrix(rnorm(64), nrow=8)
x <- (x - min(x))/(max(x) - min(x)) #Scale the data to be between 0 and 1
for (i in 1:8) x[i, i] <- 1.0 #Make the diagonal all 1's

#Format the data for the plot
xval <- formatC(x, format="f", digits=2)
pal <- colorRampPalette(c(rgb(0.96,0.96,1), rgb(0.1,0.1,0.9)), space = "rgb")

#Plot the matrix
x_hm <- heatmap.2(x, Rowv=FALSE, Colv=FALSE, dendrogram="none", 
                  main="8 X 8 Matrix Using Heatmap.2", xlab="Columns", ylab="Rows", 
                  col=pal, tracecol="#303030", trace="none", cellnote=xval, notecol="black", 
                  notecex=0.8, keysize = 1.5, margins=c(5, 5))

#  Heatmap

library(pheatmap)

# Create a 10x10 matrix of random numbers
m = matrix(runif(100), 10, 10)

# Save output to jpeg
jpeg("heatmap.jpg")

pheatmap(m, cluster_row = FALSE, cluster_col = FALSE, color=gray.colors(2,start=1,end=0))

dev.off()

#https://www.dezyre.com/data-science-in-r-programming-tutorial/data-visualizations-tools-r

# ------------
library(lattice)
levelplot(matrix)
attach(mtcars)
gear.f<-factor(gear,levels=c(3,4,5),
               labels=c("3gears","4gears","5gears")) 

cyl.f <-factor(cyl,levels=c(4,6,8),
               labels=c("4cyl","6cyl","8cyl")) 
densityplot(~mpg, 
            main="Density Plot", 
            xlab="Miles per Gallon")
densityplot(~mpg|cyl.f, 
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")

densityplot(~mpg|cyl.f,
            main="Density Plot by Numer of Cylinders",
            xlab="Miles per Gallon", 
            layout=c(1,3))
bwplot(cyl.f~mpg|gear.f,
       ylab="Cylinders", xlab="Miles per Gallon", 
       main="Mileage by Cylinders and Gears", 
       layout=(c(1,3)))
xyplot(mpg~wt|cyl.f*gear.f, 
       main="Scatterplots by Cylinders and Gears", 
       ylab="Miles per Gallon", xlab="Car Weight")

cloud(mpg~wt*qsec|cyl.f, 
      main="3D Scatterplot by Cylinders")

dotplot(cyl.f~mpg|gear.f, 
        main="Dotplot Plot by Number of Gears and Cylinders",
        xlab="Miles Per Gallon")

splom(mtcars[c(1,3,4,5,6)],
      main="MTCARS Data")
