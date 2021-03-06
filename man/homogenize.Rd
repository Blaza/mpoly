% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/homogenize.R
\name{homogenize}
\alias{homogenize}
\alias{dehomogenize}
\alias{is.homogeneous}
\alias{homogeneous_components}
\title{Homogenize a polynomial}
\usage{
homogenize(x, var = "t")

dehomogenize(x, var = "t")

is.homogeneous(x)

homogeneous_components(x)
}
\arguments{
\item{x}{an \code{\link{mpoly}} object}

\item{var}{name of homogenization}
}
\value{
a (de/homogenized) mpoly or an mpolyList
}
\description{
Homogenize a polynomial.
}
\examples{

x <- mp("x^4 + y + 2 x y^2 - 3 z")
is.homogeneous(x)
(xh <- homogenize(x))
is.homogeneous(xh)

homogeneous_components(x)

homogenize(x, "o")

xh <- homogenize(x)
dehomogenize(xh) # assumes var = "t"
plug(xh, "t", 1) # same effect, but dehomogenize is faster



# the functions are vectorized
(ps <- mp(c("x + y^2", "x + y^3")))
(psh <- homogenize(ps))
dehomogenize(psh)


# demonstrating a leading property of homogeneous polynomials
library(magrittr)
p  <- mp("x^2 + 2 x + 3")
(ph <- homogenize(p, "y"))
lambda <- 3
(d <- totaldeg(p))
ph \%>\% 
  plug("x", lambda*mp("x")) \%>\% 
  plug("y", lambda*mp("y"))
lambda^d * ph 

}
