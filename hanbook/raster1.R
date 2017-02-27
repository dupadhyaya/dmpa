#Rgdal https://geoscripting-wur.github.io/IntroToRaster/
# Example to perform system set-up checks
library(rgdal)
getGDALVersionInfo()

library(raster)
## Generate a RasterLayer object
r <- raster(ncol=40, nrow=20)
class(r) 

# Using the previously generated RasterLayer object
# Let's first put some values in the cells of the layer
r[] <- rnorm(n=ncell(r))
# Create a RasterStack object with 3 layers
s <- stack(x=c(r, r*2, r))
# The exact same procedure works for creating a RasterBrick
b <- brick(x=c(r, r*2, r))
# Let's look at the properties of of one of these two objects
b
