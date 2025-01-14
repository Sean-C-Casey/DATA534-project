% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/period_left.R
\name{period_left}
\alias{period_left}
\title{Access /timeleft/{period} Endpoint}
\usage{
period_left(period, timezone = NULL)
}
\arguments{
\item{period}{"months", "weeks", "sleeps", "days", "hours", "minutes", or "seconds"}

\item{timezone}{A UTC offset in string form. Defaults to NULL}
}
\value{
An integer corresponding to the amount of periods left until Christmas
}
\description{
This function accesses the /timeleft/{period} endpoint of the Christmas
Countdown API. The specific period is supplied by the user as a function
argument.
}
\examples{
period_left("days", timezone = "UTC-7")
period_left("weeks")

}
\keyword{left}
\keyword{period}
