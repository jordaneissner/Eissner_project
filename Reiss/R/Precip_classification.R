# Uses the cloud property data frames to classify clouds into precipitating (CBH < 100m) or non-
# precipitating (CBH > 100m)
#
# ARGS
# cloud:      data frame containing all cloud properties
# CBH_thresh: CBH used to determine if the cloud is precipitating or not
#
# OUTPUT - two data frames, each containing the cloud properties (ER, CTH, CBH, thickness, RH) of
# precipitating and non-precipitating clouds
# precip - ER, CTH, CBH, thickness, RH
# noprecip - ER, CTH, CBH, thickness, RH
#
#' Separate clouds into precipitating and non-precipitating
#' @param cloud A dataframe containing the cloud properties
#' @param CBH_thresh The upper limit of cloud base height of precipitating clouds
#'
#' @return two data frames (precip and noprecip), each containing the cloud properties (ER, CTH, CBH, thickness, RH) of
#' precipitating and non-precipitating clouds
#'
#' @examples
#' data(clouds)
#' precip <- Precip_Classification(clouds$CBH, 1000)$precip
#'
#'

Precip_Classification <- function(cloud, CBH_thresh)
{
  precip <- cloud[cloud$CBH < CBH_thresh,]
  noprecip <- cloud[cloud$CBH > CBH_thresh,]

  return(list(precip=precip, noprecip=noprecip))
}

