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

# Start by making sure that your working directory is properly set
# If not you can set it using setwd()
getwd()
download.file(url = 'https://raw.githubusercontent.com/GeoScripting-WUR/IntroToRaster/gh-pages/data/gewata.zip', destfile = 'gewata.zip', method = 'auto')
# In case the download code doesn't work, use method = 'wget'
## Unpack the archive
unzip('gewata.zip')

# When passed without arguments, list.files() returns a character vector, listing the content of the working directory
list.files()
# To get only the files with .tif extension
list.files(pattern = glob2rx('*.tif'))
# Or if you are familiar with regular expressions
list.files(pattern = '^.*\\.tif$')

gewata <- brick('LE71700552001036SGS00_SR_Gewata_INT1U.tif')
gewata 

plot(gewata, 1)
e <- drawExtent(show=TRUE)

## Crop gewata using e
gewataSub <- crop(gewata, e)
## Now visualize the new cropped object
plot(gewataSub, 1)

# Again, make sure that your working directory is properly set
getwd()
## Download the data
download.file(url='https://raw.githubusercontent.com/GeoScripting-WUR/IntroToRaster/gh-pages/data/tura.zip', destfile='tura.zip', method='auto')
unzip(zipfile='tura.zip')
## Retrieve the content of the tura sub-directory
list <- list.files(path='tura/', full.names=TRUE)

plot(raster(list[1]))

turaStack <- stack(list)
turaStack

writeRaster(x=turaStack, filename='turaStack.grd', datatype='INT2S')

writeRaster(x=turaStack, filename='turaStack.grd', datatype='INT2S')

plot(ndvi)
