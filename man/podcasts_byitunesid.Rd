% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/podcasts_requests.R
\name{podcasts_byitunesid}
\alias{podcasts_byitunesid}
\title{Get podcast feed metadata}
\usage{
podcasts_byitunesid(itunesid)
}
\arguments{
\item{itunesid}{integer representing a Podcast Index iTunes feed ID}
}
\value{
\code{tibble} data frame with metadata associated with feed
}
\description{
\code{podcasts_byitunesid()} obtains all available metadata from the Podcast
Index database associated with a particular iTunes ID
}
\examples{
\dontshow{if (podindexr::podcastindex_api_isset()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Requires API key and secret

podcasts_byitunesid(itunesid = 1441923632)
\dontshow{\}) # examplesIf}
}
