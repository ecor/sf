% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{plot}
\alias{plot}
\alias{plot.sf}
\alias{plot}
\alias{plot.sfc_POINT}
\alias{plot}
\alias{plot.sfc_MULTIPOINT}
\alias{plot}
\alias{plot.sfc_LINESTRING}
\alias{plot}
\alias{plot.sfc_CIRCULARSTRING}
\alias{plot}
\alias{plot.sfc_MULTILINESTRING}
\alias{plot}
\alias{plot.sfc_POLYGON}
\alias{plot}
\alias{plot.sfc_MULTIPOLYGON}
\alias{plot}
\alias{plot.sfc_GEOMETRYCOLLECTION}
\alias{plot}
\alias{plot.sfc_GEOMETRY}
\alias{plot}
\alias{plot.sfg}
\alias{plot}
\alias{plot_sf}
\alias{plot}
\alias{sf.colors}
\title{Plot sf object}
\usage{
\method{plot}{sf}(x, y, ..., ncol = 10, col = NULL, max.plot = 9)

\method{plot}{sfc_POINT}(x, y, ..., pch = 1, cex = 1, col = 1, bg = 0,
  lwd = 1, lty = 1, type = "p", add = FALSE)

\method{plot}{sfc_MULTIPOINT}(x, y, ..., pch = 1, cex = 1, col = 1,
  bg = 0, lwd = 1, lty = 1, type = "p", add = FALSE)

\method{plot}{sfc_LINESTRING}(x, y, ..., lty = 1, lwd = 1, col = 1,
  pch = 1, type = "l", add = FALSE)

\method{plot}{sfc_CIRCULARSTRING}(x, y, ...)

\method{plot}{sfc_MULTILINESTRING}(x, y, ..., lty = 1, lwd = 1, col = 1,
  pch = 1, type = "l", add = FALSE)

\method{plot}{sfc_POLYGON}(x, y, ..., lty = 1, lwd = 1, col = NA,
  cex = 1, pch = NA, border = 1, add = FALSE, rule = "winding")

\method{plot}{sfc_MULTIPOLYGON}(x, y, ..., lty = 1, lwd = 1, col = NA,
  border = 1, add = FALSE, rule = "winding")

\method{plot}{sfc_GEOMETRYCOLLECTION}(x, y, ..., pch = 1, cex = 1, bg = 0,
  lty = 1, lwd = 1, col = 1, border = 1, add = FALSE)

\method{plot}{sfc_GEOMETRY}(x, y, ..., pch = 1, cex = 1, bg = 0,
  lty = 1, lwd = 1, col = 1, border = 1, add = FALSE)

\method{plot}{sfg}(x, ...)

plot_sf(x, xlim = NULL, ylim = NULL, asp = NA, axes = FALSE,
  bgc = par("bg"), ..., xaxs, yaxs, lab, setParUsrBB = FALSE,
  bgMap = NULL, expandBB = c(0, 0, 0, 0), graticule = NA_crs_,
  col_graticule = "grey")

sf.colors(n = 10, xc, cutoff.tails = c(0.35, 0.2), alpha = 1,
  categorical = FALSE)
}
\arguments{
\item{x}{object of class sf}

\item{y}{ignored}

\item{...}{further specifications, see \link{plot_sf} and \link{plot}}

\item{ncol}{integer; default number of colors to be used}

\item{col}{color}

\item{max.plot}{integer; lower boundary to maximium number of attributes to plot (defaults to 9)}

\item{pch}{plotting symbol}

\item{cex}{symbol size}

\item{bg}{symbol background color}

\item{lwd}{line width}

\item{lty}{line type}

\item{type}{plot type: 'p' for points, 'l' for lines, 'b' for both}

\item{add}{logical; add to current plot?}

\item{border}{color of polygon border}

\item{rule}{see \link[graphics]{polypath}}

\item{xlim}{see \link{plot.window}}

\item{ylim}{see \link{plot.window}}

\item{asp}{see below, and see \link{par}}

\item{axes}{logical; should axes be plotted? (default FALSE)}

\item{bgc}{background color}

\item{xaxs}{see \link{par}}

\item{yaxs}{see \link{par}}

\item{lab}{see \link{par}}

\item{setParUsrBB}{default FALSE; set the \code{par} \dQuote{usr} bounding box; see below}

\item{bgMap}{object of class \code{ggmap}, or returned by function \code{RgoogleMaps::GetMap}}

\item{expandBB}{numeric; fractional values to expand the bounding box with, 
in each direction (bottom, left, top, right)}

\item{graticule}{logical, or object of class \code{crs} (e.g., \code{st_crs(4326)} for a WGS84 graticule), or object created by \link{st_graticule}; \code{TRUE} will give the WGS84 graticule 
or object returned by \link{st_graticule}}

\item{col_graticule}{color to used for the graticule (if present)}

\item{n}{integer; number of colors}

\item{xc}{factor or numeric vector, for which colors need to be returned}

\item{cutoff.tails}{numeric, in [0,0.5] start and end values}

\item{alpha}{numeric, in [0,1], transparency}

\item{categorical}{logical; should a categorical color ramp be returned? if \code{x} is a factor, yes.}
}
\description{
Plot sf object

blue-pink-yellow color scale
}
\details{
\code{plot.sf} maximally plots \code{max.plot} maps with colors following from attribute columns, 
one map per attribute. It uses \code{sf.colors} for default colors. For more control over individual maps,
set parameter \code{mfrow} with \code{par} prior to plotting,  and plot single maps one by one.

\code{plot.sfc} plots the geometry, additional parameters can be passed on
to control color, lines or symbols.

\code{plot_sf} sets up the plotting area, axes, graticule, or webmap background; it
is called by all \code{plot} methods before anything is drawn.

The argument \code{setParUsrBB} may be used to pass the logical value \code{TRUE} to functions within \code{plot.Spatial}. When set to \code{TRUE}, par(\dQuote{usr}) will be overwritten with \code{c(xlim, ylim)}, which defaults to the bounding box of the spatial object. This is only needed in the particular context of graphic output to a specified device with given width and height, to be matched to the spatial object, when using par(\dQuote{xaxs}) and par(\dQuote{yaxs}) in addition to \code{par(mar=c(0,0,0,0))}.

The default aspect for map plots is 1; if however data are not
projected (coordinates are long/lat), the aspect is by default set to
1/cos(My * pi)/180) with My the y coordinate of the middle of the map
(the mean of ylim, which defaults to the y range of bounding box). This
implies an \href{https://en.wikipedia.org/wiki/Equirectangular_projection}{Equirectangular projection}.

\code{sf.colors} was taken from \link[sp]{bpy.colors}, with modified \code{cutoff.tails} defaults; for categorical, colors were taken from \code{http://www.colorbrewer2.org/} (if n < 9, Set2, else Set3).
}
\examples{
# plot linestrings:
l1 = st_linestring(matrix(runif(6)-0.5,,2))
l2 = st_linestring(matrix(runif(6)-0.5,,2))
l3 = st_linestring(matrix(runif(6)-0.5,,2))
s = st_sf(a=2:4, b=st_sfc(l1,l2,l3))
plot(s, col = s$a, axes = FALSE)
plot(s, col = s$a)
ll = "+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
st_crs(s) = ll
plot(s, col = s$a, axes = TRUE)
plot(s, col = s$a, lty = s$a, lwd = s$a, pch = s$a, type = 'b')
l4 = st_linestring(matrix(runif(6),,2))
plot(st_sf(a=1,b=st_sfc(l4)), add = TRUE)
# plot multilinestrings:
ml1 = st_multilinestring(list(l1, l2))
ml2 = st_multilinestring(list(l3, l4))
ml = st_sf(a = 2:3, b = st_sfc(ml1, ml2))
plot(ml, col = ml$a, lty = ml$a, lwd = ml$a, pch = ml$a, type = 'b')
# plot points:
p1 = st_point(c(1,2))
p2 = st_point(c(3,3))
p3 = st_point(c(3,0))
p = st_sf(a=2:4, b=st_sfc(p1,p2,p3))
plot(p, col = s$a, axes = TRUE)
plot(p, col = s$a)
plot(p, col = p$a, pch = p$a, cex = p$a, bg = s$a, lwd = 2, lty = 2, type = 'b')
p4 = st_point(c(2,2))
plot(st_sf(a=1, st_sfc(p4)), add = TRUE)
# multipoints:
mp1 = st_multipoint(matrix(1:4,2))
mp2 = st_multipoint(matrix(5:8,2))
mp = st_sf(a = 2:3, b = st_sfc(mp1, mp2))
plot(mp)
plot(mp, col = mp$a, pch = mp$a, cex = mp$a, bg = mp$a, lwd = mp$a, lty = mp$a, type = 'b')
# polygon:
outer = matrix(c(0,0,10,0,10,10,0,10,0,0),ncol=2, byrow=TRUE)
hole1 = matrix(c(1,1,1,2,2,2,2,1,1,1),ncol=2, byrow=TRUE)
hole2 = matrix(c(5,5,5,6,6,6,6,5,5,5),ncol=2, byrow=TRUE)
pl1 = st_polygon(list(outer, hole1, hole2))
pl2 = st_polygon(list(outer+10, hole1+10, hole2+10))
po = st_sf(a = 2:3, st_sfc(pl1,pl2))
plot(po, col = po$a, border = rev(po$a), lwd=3)
# multipolygon
r10 = matrix(rep(c(0,10),each=5),5)
pl1 = list(outer, hole1, hole2)
pl2 = list(outer+10, hole1+10, hole2+10)
pl3 = list(outer+r10, hole1+r10, hole2+r10)
mpo1 = st_multipolygon(list(pl1,pl2))
mpo2 = st_multipolygon(list(pl3))
mpo = st_sf(a=2:3, b=st_sfc(mpo1,mpo2))
plot(mpo, col = mpo$a, border = rev(mpo$a), lwd = 2)
# geometrycollection:
gc1 = st_geometrycollection(list(mpo1, st_point(c(21,21)), l1 * 2 + 21))
gc2 = st_geometrycollection(list(mpo2, l2 - 2, l3 - 2, st_point(c(-1,-1))))
gc = st_sf(a=2:3, b = st_sfc(gc1,gc2))
plot(gc, cex = gc$a, col = gc$a, border = rev(gc$a) + 2, lwd = 2)
sf.colors(10)
}
