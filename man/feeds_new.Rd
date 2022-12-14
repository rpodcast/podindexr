% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/feeds_requests.R
\name{feeds_new}
\alias{feeds_new}
\title{Get new podcast feeds}
\usage{
feeds_new(max = 60, since = NULL, feedid = NULL, desc = FALSE)
}
\arguments{
\item{max}{Maximum number of results to return.
Value must be a single integer between 1 and 1000.}

\item{since}{optional date string in format \code{YYYY-MM-DD} that when specified
will only return podcasts/episodes created since the specified date.}

\item{feedid}{string of the Podcastindex Feed ID to start from
(or go to if \code{desc} is set to TRUE). If \code{since} is specified, \code{feedid}
takes precedence.}

\item{desc}{boolean to display feeds in descending order. Only applicable
when specifying \code{feedid}.}
}
\value{
\code{tibble} data frame with metadata associated with new feeds
}
\description{
feeds_recent()` retrieves the newest podcast feeds added
to the podcastindex over the past 24 hours.
}
\examples{
\dontshow{if (podindexr::podcastindex_api_isset()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Requires API key and secret

feeds_new(max = 20)
\dontshow{\}) # examplesIf}
}
