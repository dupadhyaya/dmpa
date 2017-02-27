# # Basic Statistics
# 
# #http://math.furman.edu/~dcs/courses/math47/R/library/fBasics/html/015A-BasicStatistics.html
# 
# skewness	returns value of skewness,
# kurtosis	returns value of kurtosis,
# basicStats	computes an overview of basic statistical values,
# rowStats	calculates row statistics,
# colStats	calculates column statistics,
# rowAvgs	calculates row means,
# colAvgs	calculates column means,
# rowVars	calculates row variances,
# colVars	calculates column variances,
# rowStdevs	calculates row standard deviations,
# colStdevs	calculates column standard deviations,
# rowSkewness	calculates row skewness,
# colSkewness	calculates column skewness,
# rowKurtosis	calculates row kurtosis,
# colKurtosis	calculates column kurtosis,
# rowCumsums	calculates row cumulated Sums,
# colCumsums	calculates column cumulated Sums.
# For SPLUS Compatibility:
#   
#   stdev	Returns the standard deviation of a vector or matrix.
# Usage
# 
# stdev(x, na.rm = FALSE)
# 
# skewness(x, ...)
# ## Default S3 method:
# skewness(x, na.rm = FALSE, method = c("moment", "fisher"), ...)
# ## S3 method for class 'data.frame':
# skewness(x, ...)
# ## S3 method for class 'POSIXct':
# skewness(x, ...)
# ## S3 method for class 'POSIXlt':
# skewness(x, ...)
# 
# kurtosis(x, ...)
# ## Default S3 method:
# kurtosis(x, na.rm = FALSE, method = c("excess", "moment", "fisher"), ...)
# ## S3 method for class 'data.frame':
# kurtosis(x, ...)
# ## S3 method for class 'POSIXct':
# kurtosis(x, ...)
# ## S3 method for class 'POSIXlt':
# kurtosis(x, ...)
# 
# basicStats(x, ci = 0.95, column = 1)
# 
# rowStats(x, FUN, na.rm = FALSE, ...) 
# rowAvgs(x, na.rm = FALSE, ...)
# rowVars(x, na.rm = FALSE, ...)
# rowStdevs(x, na.rm = FALSE, ...)
# rowSkewness(x, na.rm = FALSE, ...)
# rowKurtosis(x, na.rm = FALSE, ...)
# rowCumsums(x, na.rm = FALSE, ...)
# 
# colStats(x, FUN, na.rm = FALSE, ...) 
# colAvgs(x, na.rm = FALSE, ...)
# colVars(x, na.rm = FALSE, ...)
# colStdevs(x, na.rm = FALSE, ...)
# colSkewness(x, na.rm = FALSE, ...)
# colKurtosis(x, na.rm = FALSE, ...)
# colCumsums(x, na.rm = FALSE, ...)
# Arguments
# 
# ci	confidence interval, a numeric value, by default 0.95, i.e. 95 percent.
# column	[basicStats] - 
#   which column should be selected from the input matrix, data frame or timeSeries object. By default an integer value set to 1.
# FUN	[colStats][rowStats - 
#                  the statistical function to be applied.
#                na.rm	a logical. Should missing values be removed?
#                method	[kurtosis][skewness] - 
#                  a character string which specifies the method of computation. These are either "moment" or "fisher", kurtosis allows in addition for "excess". If "excess" is selected, then the value of the kurtosis is computed by the "moment" method and a value of 3 will be subtracted. The "moment" method is based on the definitions of skewness and kurtosis for distributions; these forms should be used when resampling (bootstrap or jackknife). The "fisher" method correspond to the usual "unbiased" definition of sample variance, although in the case of skewness and kurtosis exact unbiasedness is not possible.
#                x	a numeric vector, or a matrix for column statistics. 
#                [basicStats] - 
#                  allows also a matrix, data.frame or timeSeries as input. In this case only the first column of data will be considered and a a warning will be printed.
#                ...	arguments to be passed.
#                Value
#                
#                skewness
#                kurtosis 
#                return the value of the statistics, a numeric value. An attribute which reports the used method is added. 
#                
#                basicsStats 
#                returns data frame with the following entries and row names: nobs, NAs, Minimum, Maximum , 1. Quartile, 3. Quartile, Mean, Median, Sum, SE Mean, LCL Mean, UCL Mean, Variance, Stdev, Skewness, Kurtosis. 
#                
#                rowStats
#                rowAvgs
#                rowVars
#                rowStdevs
#                rowSkewness
#                rowKurtosis
#                rowCumsum 
#                compute sample statistics by column. Missing values can be handled. 
#                
#                colStats
#                colAvgs
#                colVars
#                colStdevs,
#                colSkewness
#                colKurtosis
#                colCumsum 
#                compute sample statistics by column. Missing values can be handled.
#                
#                Note
#                
#                R's-base package contains a function colMeans with an additional argument dim=1. Therefore, the function used here to compute column means (averages) is named colAvgs. 
#                The function stdev computes the standard deviation for a vector or matrix and was introduced for SPlus compatibility. Under R use the function sd.
#                
#                Author(s)
#                
#                Diethelm Wuertz for the Rmetrics R-port.
#                
#                Examples
#                
#                ## SOURCE("fBasics.15A-BasicStatistics")
#                
#                ## basicStats -
#                xmpBasics("\nStart: Basic Statistics of log-Returns > ")
#                # Data NYSE Composite Index:
#                data(nyseres)
#                basicStats(nyseres)  
#                
#                ## mean -
#                ## var -
#                ## skewness -
#                ## kurtosis -
#                xmpBasics("\nNext: Moments, Skewness and Kurtosis > ")
#                # Mean, Variance:
#                mean(nyseres)
#                var(nyseres)
#                # Skewness, Kurtosis:
#                class(nyseres)
#                skewness(nyseres[, 1])
#                kurtosis(nyseres[, 1])   