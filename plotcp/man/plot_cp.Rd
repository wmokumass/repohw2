% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_cp.R
\name{plot_cp}
\alias{plot_cp}
\title{This function looks at contraceptive use and a processed version to make a graph with a confidence interval.}
\usage{
plot_cp(dat, est, iso_code, CI = 95)
}
\arguments{
\item{dat}{A dataframe of estimates of modern contraceptive use (mCPR) among married women}

\item{est}{A dataframe of processed version of dat}

\item{iso_code}{A number for a country}

\item{CI}{80, 95 or NA}
}
\value{
NA
}
\description{
This function looks at contraceptive use and a processed version to make a graph with a confidence interval.
}
\examples{
plot_cp(dat, est, iso_code = 4)
plot_cp(dat, est, iso_code = 4, CI = NA)
plot_cp(dat, est, iso_code = 404, CI = 80)



}
