% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_requests.R
\name{search_apple_byterm}
\alias{search_apple_byterm}
\title{Search podcasts with Apple-like API}
\usage{
search_apple_byterm(term)
}
\arguments{
\item{term}{character string of the term to search for}
}
\value{
\code{tibble} data frame with metadata associated with podcasts
that match the search term
}
\description{
\code{search_apple_byterm()} replaces the Apple search API but
uses the Podcast Index database instead.
}
\examples{

search_apple_byterm("metal")
}
