% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crs.R
\docType{data}
\name{st_crs}
\alias{st_crs}
\alias{st_crs}
\alias{st_crs.sf}
\alias{st_crs}
\alias{st_crs.numeric}
\alias{st_crs}
\alias{st_crs.character}
\alias{st_crs}
\alias{st_crs.sfc}
\alias{st_crs}
\alias{st_crs.bbox}
\alias{st_crs}
\alias{st_crs.crs}
\alias{st_crs}
\alias{st_crs<-}
\alias{st_crs}
\alias{st_crs<-.sf}
\alias{st_crs}
\alias{st_crs<-.sfc}
\alias{st_crs}
\alias{st_set_crs}
\alias{st_crs}
\alias{NA_crs_}
\alias{st_crs}
\alias{is.na.crs}
\alias{st_crs}
\alias{$.crs}
\title{Retrieve coordinate reference system from object}
\format{An object of class \code{crs} of length 2.}
\usage{
st_crs(x, ...)

\method{st_crs}{sf}(x, ...)

\method{st_crs}{numeric}(x, ...)

\method{st_crs}{character}(x, ..., wkt)

\method{st_crs}{sfc}(x, ...)

\method{st_crs}{bbox}(x, ...)

\method{st_crs}{crs}(x, ...)

st_crs(x) <- value

\method{st_crs}{sf}(x) <- value

\method{st_crs}{sfc}(x) <- value

st_set_crs(x, value)

NA_crs_

\method{is.na}{crs}(x)

\method{$}{crs}(x, name)
}
\arguments{
\item{x}{numeric, character, or object of class \link{sf} or \link{sfc}}

\item{...}{ignored}

\item{wkt}{character well-known-text representation of the crs}

\item{value}{one of (i) character: a valid proj4string (ii) integer, a valid epsg value (numeric), or (iii) a list containing named elements proj4string (character) and/or epsg (integer) with (i) and (ii).}

\item{name}{element name; code{epsg} or \code{proj4string}, or one of \code{proj4strings} named components without the \code{+}; see examples}
}
\value{
if \code{x} is numeric, return \code{crs} object for SRID \code{x}; if \code{x} is character, return \code{crs} object for proj4string \code{x}; if \code{wkt} is given, return \code{crs} object for well-known-text representation \code{wkt}; if \code{x} is of class \code{sf} or \code{sfc}, return its \code{crs} object.

object of class \code{crs}, which is a list with elements epsg (length-1 integer) and
proj4string (length-1 character).
}
\description{
Retrieve coordinate reference system from sf or sfc object

Set or replace retrieve coordinate reference system from object
}
\details{
the *crs functions create, get, set or replace the \code{crs} attribute of a simple feature geometry
list-column. This attribute is of class \code{crs}, and is a list consisting of epsg (integer epsg
code) and proj4string (character).
Two objects of class \code{crs} are semantically identical when: (1) they are completely identical, or
(2) they have identical proj4string but one of them has a missing epsg ID. As a consequence, equivalent
but different proj4strings, e.g. \code{ "+proj=longlat +datum=WGS84" } and \code{ "+datum=WGS84 +proj=longlat" },
are considered different.
The operators \code{==} and \code{!=} are overloaded for \code{crs} objects to establish semantical identity.

in case a coordinate reference system is replaced, no transformation takes
place and a warning is raised to stress this. epsg values are either read from proj4strings
that contain \code{+init=epsg:...} or set to 4326 in case the proj4string contains +proj=longlat
and +datum=WGS84, literally

If both epsg and proj4string are provided, they are assumed to be consistent. In processing them, the epsg code, if not missing valued, is used and the proj4string is derived from it by a call to GDAL (which in turn will call PROJ.4). Warnings are raised when epsg is not consistent with a proj4string that is already present.

\code{NA_crs_} is the \code{crs} object with missing values for epsg and proj4string.
}
\examples{
sfc = st_sfc(st_point(c(0,0)), st_point(c(1,1)))
sf = st_sf(a = 1:2, geom = sfc)
st_crs(sf) = 4326
st_geometry(sf)
sfc = st_sfc(st_point(c(0,0)), st_point(c(1,1)))
st_crs(sfc) = 4326
sfc
sfc = st_sfc(st_point(c(0,0)), st_point(c(1,1)))
library(dplyr)
x = sfc \%>\% st_set_crs(4326) \%>\% st_transform(3857)
x
st_crs("+init=epsg:3857")$epsg
st_crs("+init=epsg:3857")$proj4string
st_crs("+init=epsg:3857 +units=km")$b     # numeric
st_crs("+init=epsg:3857 +units=km")$units # character
}
\keyword{datasets}
