#' FAO fishing areas
#'
#' A spatial dataset name and geometry of fishing areas
#'
#' The original souce (see below) was modified such that no geometry overlaps
#' using the ...code
#'
#' @format A data frame with 235 rows and 14 variables:
#' \describe{
#'   \item{name}{Name of the fao "area"}
#'   \item{geometry}{Polygons as simple features}
#' }
#'
#' @source \url{http://www.fao.org/figis/geoserver/area/ows?service=WFS&request=GetFeature&version=1.0.0&typeName=area:FAO_AREAS&outputFormat=SHAPE-ZIP}
"fao"

#' faolink
#'
#' A "lookup" table that links the fao unit of interest with the corresponding
#' geometry names
#'
#' @format A data frame with 235 rows and 14 variables:
#' \describe{
#'   \item{unit}{Name of region of interest}
#'   \item{name}{Name of the geometries that cover the region of interest}
#' }
#'
"faolink"

#' Bormicon areas
#'
#' A spatial dataset, name and geometry of bormicon areas
#'
#' @format A data frame with 16 rows and 2 variables:
#' \describe{
#'   \item{group}{the id}
#'   \item{geometry}{xxx}
#' }


#' eez
#'
#' A spatial dataset, name and geometry of global eez
#'
#' @format A data frame with 281 rows and 24 variables:
#' \describe{
#'   \item{polygonid}{xxx}
#'   \item{mrgid}{xxx}
#' }
#'
#' @source Marine Regions, EEZ v9, low resolution
#' \url{http://www.marineregions.org/downloads.php}
#'
"eez"
