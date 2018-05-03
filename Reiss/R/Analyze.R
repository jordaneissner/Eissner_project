# Uses the separated cloud type and precipitation data frames to analyze dependencies,
# correlations, and significances. This is done by making plots of ER vs RH for all regimes
# and ER vs thickness for all regimes and calculating R^2.
#
# ARGS
# x:        The x values used in the plot and correlation
# y:        The y values used in the plot and correlation
#
# OUTPUT
# Rsqr:     The R^2 values of entrainment correlations with each predicted dependency for each regime.
#
#' Find the correlation between two variables
#' @param x A set of real numbers
#' @param y A set of real numbers
#'
#' @return the r-squared value of \code{x} and \code{y}
#'
#' @examples
#' Analyze(airquality$Ozone, airquality$Wind)
#'

Analyze <- function(x,y)
{
  test_model <- lm(y~x)
  Rsqr <- summary(test_model)$r.squared
  return(Rsqr)
}

