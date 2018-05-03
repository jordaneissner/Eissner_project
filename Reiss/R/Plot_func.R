# Makes a scatter plot of the same variables in multiple datasets, separated by color. A trendline
# is also added to each dataset.
#
# ARGS
# data:        A list of dataframes containing the variables being plotted
# varx:        The column number of the x variable being plotted
# vary:        The column number of the y variable being plotted
# cols:        A vector of length of the data list containing the color of each dataset's points
# label:       A vector of length of the data list containing the label of each dataset
# xlab:        The x axis label
# ylab:        The y axis label
# xlim:        The limits of the x axis
# ylim:        The limits of the y axis
# main:        The title of the plot
#
# OUTPUT
# Plot

#' Make a scatter plot with trendlines of multiple datasets
#' @param data A list of dataframes containing the variables being plotted
#' @param varx The column number of the x variable being plotted
#' @param vary The column number of the y variable being plotted
#' @param cols A vector of length of \code{data} containing the color of each dataset's points
#' @param label A vector of length of \code{data} list containing the label of each dataset
#' @param xlab The x axis label
#' @param ylab The y axis label
#' @param xlim The limits of the x axis
#' @param ylim The limits of the y axis
#' @param main The title of the plot
#'
#' @return Plot
#'
#' @examples
#' data <- list(airquality[1:10,], airquality[11:20,], airquality[21:30,])
#' PlotER(data=data, varx=1, vary=3, cols=1:3, label=c("rows 1-10","rows 11-20","rows 21-30"),
#'        xlab="", ylab="", xlim="", ylim="", main = "")
#'


Plot_func <- function(data, varx, vary, cols, label, xlab, ylab, xlim, ylim, main) {
  plot(data[[1]][,varx], data[[1]][,vary], xlim = xlim, ylim = ylim,
       xlab=xlab, ylab=ylab, main= main)
  mapply(function(x, col) points(x[,vary]~ x[,varx], col=col),
         data, cols)
  mapply(function(x, col) abline(lm(x[,vary]~ x[,varx]), col=col),
         data, cols)
  legend("topright", legend=label, pch=1, col=cols)
}

