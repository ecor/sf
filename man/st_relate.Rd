% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom.R
\name{st_relate}
\alias{st_relate}
\title{Compute DE9-IM relation between pairs of geometries, or match it to a given pattern}
\usage{
st_relate(x, y, pattern = NA_character_, sparse = !is.na(pattern))
}
\arguments{
\item{x}{object of class \code{sf}, \code{sfc} or \code{sfg}}

\item{y}{object of class \code{sf}, \code{sfc} or \code{sfg}}

\item{pattern}{character; define the pattern to match to, see details.}

\item{sparse}{logical; should a sparse matrix be returned (TRUE) or a dense matrix?}
}
\value{
in case \code{pattern} is not given, st_relate returns a dense \code{character} matrix; element [i,j] has nine characters, refering to the DE9-IM relationship between x[i] and y[j], encoded as IxIy,IxBy,IxEy,BxIy,BxBy,BxEy,ExIy,ExBy,ExEy where I refers to interior, B to boundary, and E to exterior, and e.g. BxIy the dimensionality of the intersection of the the boundary of x[i] and the interior of y[j], which is one of {0,1,2,F}, digits denoting dimensionality, F denoting not intersecting. When \code{pattern} is given, returns a dense logical matrix or sparse index list with matches to the given pattern; see \link{st_intersection} for a description of the returned matrix or list. See also \url{https://en.wikipedia.org/wiki/DE-9IM} for further explanation.
}
\description{
Compute DE9-IM relation between pairs of geometries, or match it to a given pattern
}
\examples{
p1 = st_point(c(0,0))
p2 = st_point(c(2,2))
pol1 = st_polygon(list(rbind(c(0,0),c(1,0),c(1,1),c(0,1),c(0,0)))) - 0.5
pol2 = pol1 + 1
pol3 = pol1 + 2
st_relate(st_sfc(p1, p2), st_sfc(pol1, pol2, pol3))
sfc = st_sfc(st_point(c(0,0)), st_point(c(3,3)))
grd = st_make_grid(sfc, n = c(3,3))
st_intersects(grd)
st_relate(grd, pattern = "****1****") # sides, not corners, internals
st_relate(grd, pattern = "****0****") # only corners touch
st_rook = function(a, b = a) st_relate(a, b, pattern = "F***1****")
st_rook(grd)
# queen neighbours, see https://github.com/r-spatial/sf/issues/234#issuecomment-300511129
st_queen <- function(a, b = a) st_relate(a, b, pattern = "F***T****")
}
