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

