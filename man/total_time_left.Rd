% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/total_time_left.R
\name{total_time_left}
\alias{total_time_left}
\title{Access /timeleft/total Endpoint}
\usage{
total_time_left(timezone = NULL)
}
\arguments{
\item{timezone}{character vector, matching a time zone abbreviation. The default value, NULL, retrieves results for UTC.}
}
\value{
a named list containing time until Christmas with units days, hours, minutes and seconds.
}
\description{
This function gets the total time left until Christmas.
}
\examples{
total_time_left()
total_time_left(timezone = "PST")

}
