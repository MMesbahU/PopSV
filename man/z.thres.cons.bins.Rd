% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/z.thres.cons.bins.R
\name{z.thres.cons.bins}
\alias{z.thres.cons.bins}
\title{Z-score thresholding using bin consecutiveness.}
\usage{
z.thres.cons.bins(z.df)
}
\arguments{
\item{z.df}{a data.frame with at least 'chr', 'start', 'end' and 'z' columns.}
}
\value{
a list with:
\item{dup.th}{the threshold for positive Z-scores (duplication signal)}
\item{del.th}{the threshold for negative Z-scores (deletion signal)}
\item{sigma.est.dup}{the estimated null distribution variance for positive Z-scores}
\item{sigma.est.del}{the estimated null distribution variance for negative Z-scores}
}
\description{
Find a threshold on the Z-scores associated with how many consecutive bins are found.
}
\author{
Jean Monlong
}
\keyword{internal}

