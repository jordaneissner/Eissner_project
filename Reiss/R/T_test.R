# Uses the separated cloud type and precipitation data frames to answer the questions: Do entrainment
# rates vary across different convective regimes? Do entrianment rates vary based on precipitation?
# A student's t-test is used to answer these questions
#
# ARGS
# x:        The x values used in the test
# y:        The y values used in the test
#
#
# OUTPUT
# ttest:    The p-squared values of the t-test
#
#' Find the difference in means of two variables
#' @param x A set of real numbers
#' @param y A set of real numbers
#'
#' @return the p- value of \code{x} and \code{y}
#'
#' @examples
#' T_test(airquality$Ozone, airquality$Wind)
#'


T_test <- function(x,y)
{
  test <- t.test(x,y)
  ttest <- test$p.value
  return(ttest)
}
