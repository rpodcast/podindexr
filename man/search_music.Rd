% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_requests.R
\name{search_music}
\alias{search_music}
\title{Search music podcasts}
\usage{
search_music(q, val = NULL, aponly = TRUE, clean = TRUE, fulltext = FALSE)
}
\arguments{
\item{q}{character string of the term(s) to search for}

\item{val}{string indicating which value block type to filter
search results. Valid entries are \code{any}, \code{lightning}, \code{hive},
or \code{webmonetization}.}

\item{aponly}{boolean to only return feeds with an itunesId present}

\item{clean}{boolean to only return non-explicit podcast feeds. Meaning
feeds where the \code{itunes:explicit} flag is set to false.}

\item{fulltext}{boolean to return the full text value of any text fields
within the result data. If set to FALSE, all text fields are truncated
to 100 words.}
}
\value{
\code{tibble} data frame with metadata associated with feeds
that match the search terms in the \code{title}, \code{author}, or \code{owner}
fields.
}
\description{
\code{search_music()} performs a search of the \code{title}, \code{author}, or \code{owner}
of podcast feeds within the PodcastIndex where the medium is music.
}
\examples{
\dontshow{if (podindexr::podcastindex_api_isset()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Requires API key and secret

search_music(q = "metal")
\dontshow{\}) # examplesIf}
}
