#' Get podcast feed metadata
#'
#' `podcasts_byfeedid()` obtains all available metadata from the Podcast
#' Index database associated with a particular feed ID
#' @param feedid integer representing a Podcast Index feed ID
#'
#' @return `tibble` data frame with metadata associated with feed
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' podcasts_byfeedid(feedid = 920666)
podcasts_byfeedid <- function(feedid) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "podcasts",
      "byfeedid"
    ) |>
    httr2::req_url_query(id = feedid) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feed")
  return(res_df)
}

#' Get podcast feed metadata
#'
#' `podcasts_byfeedurl()` obtains all available metadata from the Podcast
#' Index database associated with a particular feed URL
#'
#' @param url character string of podcast feed URL
#'
#' @return `tibble` data frame with metadata associated with feed
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' podcasts_byfeedurl(url = "https://feeds.theincomparable.com/batmanuniversity")
podcasts_byfeedurl <- function(url) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "podcasts",
      "byfeedurl"
    ) |>
    httr2::req_url_query(url = url) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feed")
  return(res_df)
}

#' Get podcast feed metadata
#'
#' `podcasts_byitunesid()` obtains all available metadata from the Podcast
#' Index database associated with a particular iTunes ID
#' @param itunesid integer representing a Podcast Index iTunes feed ID
#'
#' @return `tibble` data frame with metadata associated with feed
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' podcasts_byitunesid(itunesid = 1441923632)
podcasts_byitunesid <- function(itunesid) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "podcasts",
      "byitunesid"
    ) |>
    httr2::req_url_query(itunesid = itunesid) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feed")
  return(res_df)
}

#' Get podcast feed metadata
#'
#' `podcasts_byfeedguid()` obtains all available metadata from the Podcast
#' Index database associated with a particular feed GUID
#' @param feedid string representing a Podcast Index feed GUID
#'
#' @return `tibble` data frame with metadata associated with feed
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' podcasts_byfeedguid(guid = "9b024349-ccf0-5f69-a609-6b82873eab3c")
podcasts_byguid <- function(guid) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "podcasts",
      "byguid"
    ) |>
    httr2::req_url_query(guid = guid) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feed")
  return(res_df)
}
