% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_requests.R
\name{search_byperson}
\alias{search_byperson}
\title{Search podcast episodes by person}
\usage{
search_byperson(q, fulltext = FALSE)
}
\arguments{
\item{q}{character string of the person to search for}

\item{fulltext}{boolean to return the full text value of any text fields
within the result data. If set to FALSE, all text fields are truncated
to 100 words.}
}
\value{
\code{tibble} data frame with metadata associated with episodes
that mention the person specified in the search query.
}
\description{
\code{search_byperson()} performs a search of podcast episodes where the
specified person is mentioned.
}
\examples{
\dontshow{if (podindexr::podcastindex_api_isset()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Requires API key and secret

search_byperson(q = "Adam Curry")
\dontshow{\}) # examplesIf}
}
