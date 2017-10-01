#' FAO fishing areas
#'
#' A spatial dataset name and geometry of fishing areas
#'
#' The original souce (see below) was modified such that no geometry overlaps
#' using the ...code
#'
#' @format A data frame with 235 rows and 14 variables:
#' \describe{
#'   \item{fid}{the id}
#'   \item{f_level}{xxx}
#'   \item{f_code}{xxx}
#'   \item{f_status}{xxx}
#'   \item{ocean}{xxx}
#'   \item{subocean}{xxx}
#'   \item{f_area}{xxx}
#'   \item{f_subarea}{xxx}
#'   \item{f_division}{xxx}
#'   \item{f_subdivis}{xxx}
#'   \item{f_subunit}{xxx}
#'   \item{surface}{xxx}
#'   \item{name}{xxx}
#'   \item{geometry}{xxx}
#' }
#'
#' @source \url{http://www.fao.org/figis/geoserver/area/ows?service=WFS&request=GetFeature&version=1.0.0&typeName=area:FAO_AREAS&outputFormat=SHAPE-ZIP}
"fao"