# Lattice
# Application of Lattice package:
#   
#   The following is the list of high level functions in the lattice package which are used in data visualization:
#   
#   Univariate:
#   
#   barchart: Bar plots.
# bwplot: Box-and-whisker plots.
# densityplot: Kernel density estimates.
# dotplot: Cleveland dot plots.
# histogram: Histograms.
# qqmath: Theretical quantile plots.
# stripplot: One-dimensional scatterplots
# Bivariate:
#   qq: Quantile plots for comparing two distributions.
# xyplot: Scatterplots and time-series plots (and potentially a lot more)
# Trivariate:
#   
#   levelplot: Level plots (similar to image plots).
# contourplot: Contour plots.
# cloud: Three-dimensional scatter plots.
# wireframe: Three-dimensional surface plots (similar to persp plots).
# Hypervariate:
#   
#   splom: Scatterplot matrices.
# parallel: Parallel coordinate plots
# Miscellaneous:
#   
#   rfs: Residual and fitted value plots (also see oneway).
# tmd: Tukey Mean-Difference plots.
# Lattice also provides a collection of convenience functions that correspond to the 
#primitives lines, points, etc. These are implemented using Grid graphics.These functions have names like llines or panel.lines and are often useful when writing nontrivial panel functions.

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
