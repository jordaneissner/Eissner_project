# Imports a file of all of the clouds identified and their properties and turns it
# into a variable data frame. It then classifies each cloud
# into either shallow cumulus (CTH: 0-4km) or congestus (CTH: 5-9km) and saves the properties
# in separate files.
#
# ARGS
# data:     data frame of the data
# CTHmax_s: max CTH of shallow clouds
# CTHmin_c: min CTH of congestus clouds
# CTHmax_c: max CTH of congestus clouds
#
# OUTPUT - two data frames, each containing all of the cloud properties of each regime
# shallow - ER, CTH, CBH, thickness, RH
# congestus - ER, CTH, CBH, thickness, RH
#
#' Separate clouds into shallow cumulus and cumulus congestus
#' @param data A dataframe containing all of the clouds and their properties
#' @param CTHmax_s The upper limit of cloud top height of shallow clouds
#' @param CTHmin_c The lower limit of cloud top height of congestus clouds
#' @param CTHmax_c The upper limit of cloud top height of congestus clouds
#'
#' @return two data frames (shallow and congestus), each containing the cloud properties (ER, CTH, CBH, thickness, RH) of
#' shallow and congestus clouds
#'
#' @examples
#' data(clouds)
#' list(shallow, congestus) <- Cloud_Classification(clouds$CTH, 4000, 5000, 9000)
#' shallow
#' congestus
#'


Cloud_Classification <- function(data, CTHmax_s, CTHmin_c, CTHmax_c)
{
  data <- data.frame(data)

  shallow <- data[data$CTH < CTHmax_s,]
  congestus <- data[data$CTH > CTHmin_c & data$CTH < CTHmax_c,]
  return(list(shallow=shallow, congestus=congestus))
}



