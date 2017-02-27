# Loess Curve
# Scatter Plot - better perception of pattern of dependence

rm(list=ls()

require(graphics)
data(cars)
plot(cars)
?scatter.smooth
with(cars, scatter.smooth(speed, dist))
## or with dotted thick smoothed line results :
with(cars, scatter.smooth(speed, dist, lpars =
                            list(col = "red", lwd = 3, lty = 3)))
