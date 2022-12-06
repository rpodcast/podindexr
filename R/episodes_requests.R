#' Get episodes from podcast feed ID
#'
#' `episodes_byfeedid()` obtains all episodes from the a podcast specified by
#' one or more PodcastIndex feed ID(s)
#'
#' @inheritParams search_byterm
#' @inheritParams feeds_recent
#' @param feedid vector of one or more integers representing PodcastIndex
#'   Feed IDs.
#'
#' @return `tibble` data frame with metadata associated with episodes
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' episodes_byfeedid(feedid = 920666)
episodes_byfeedid <- function(feedid, max = 10, fulltext = FALSE, since = NULL) {
  # perform checks for key parameters
  max <- check_max(max)
  fulltext <- check_boolean(fulltext, "fulltext")

  if (!is.null(since)) {
    since <- check_datetime(since)
  }

  if (length(feedid) > 1) {
    feedid <- glue::glue_collapse(feedid, ",")
  }

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append("episodes", "byfeedid") |>
    httr2::req_url_query(id = feedid) |>
    httr2::req_url(utils::URLdecode(result_query$url)) |>
    httr2::req_url_query(
      max = max,
      fulltext = fulltext,
      since = since) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "items")
  return(res_df)
}

#' Get metadata for a single episode
#'
#' `episodes_byid()` obtains all metadata associated with a single episode
#' specified by ID.
#'
#' @inheritParams search_byterm
#' @param id integer of the PodcastIndex episode ID to search for.
#'
#' @return `tibble` data frame with metadata associated with the episode
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' episodes_byid(id = 75075)
episodes_byid <- function(id, fulltext = FALSE) {
  # perform checks for key parameters
  fulltext <- check_boolean(fulltext, "fulltext")

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "episodes",
      "byid"
    ) |>
    httr2::req_url_query(
      id = id,
      fulltext = fulltext) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "episode")
  return(res_df)
}

#' Get episodes from podcast feed URL
#'
#' `episodes_byfeedid()` obtains all episodes from the a podcast specified by
#' a feed URL
#'
#' @inheritParams episodes_byfeedid
#' @param url character string of podcast feed URL
#'
#' @return `tibble` data frame with metadata associated with episodes
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' episodes_byurl(url = "https://engineered.network/pragmatic/feed/index.xml")
episodes_byurl <- function(url, max = 10, fulltext = FALSE, since = NULL) {
  # perform checks for key parameters
  max <- check_max(max)
  fulltext <- check_boolean(fulltext, "fulltext")
  if (!is.null(since)) {
    since <- check_datetime(since)
  }

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "episodes",
      "byfeedurl"
    ) |>
    httr2::req_url_query(
      url = url,
      max = max,
      fulltext = fulltext,
      since = since) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "items")
  return(res_df)
}

#' Get episodes from podcast guid
#'
#' `episodes_byguid()` obtains metadata for a single episode from a podcast
#' specified by a guid and either a feed ID or URL
#'
#' @inheritParams episodes_byfeedid
#' @param guid character string of guid value for episode to retrieve
#' @param feedurl character string of podcast feed URL
#'
#' @return `tibble` data frame with metadata associated with the episode
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' # using guid and feedid
#'
#' episodes_byguid(guid = "PC2084", feedid = 920666)
#'
#' # using guid and feedurl
#' episodes_byguid(guid = "PC2084", feedurl = "http://mp3s.nashownotes.com/pc20rss.xml")
episodes_byguid <- function(guid, feedurl = NULL, feedid = NULL, fulltext = FALSE) {
  # perform checks for key parameters
  fulltext <- check_boolean(fulltext, "fulltext")
  if (is.null(feedid) & is.null(feedurl)) {
    cli::cli_abort("You must specify either {.arg feedurl} or {.arg feedid} to complete the request.")
  }

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "episodes",
      "byguid"
    ) |>
    httr2::req_url_query(
      guid = guid,
      feedurl = feedurl,
      feedid = feedid,
      fulltext = fulltext) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "episode")
  return(res_df)
}

#' Get live podcast episodes
#'
#' `episodes_live()` obtains metadata for episodes that have the
#' podcast-liveitem tag enabled in the feed, meaning episodes airing
#' live at the time of running this function.
#'
#' @inheritParams feeds_recent
#'
#' @return `tibble` data frame with metadata associated with live episodes
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' episodes_live(max = 20)
episodes_live <- function(max = 10) {
  # perform checks for key parameters
  max <- check_max(max)

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "episodes",
      "live"
    ) |>
    httr2::req_url_query(max = max) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "items")
  return(res_df)
}

#' Random podcast episodes
#'
#' `episodes_random()` obtains a random selection of podcast episodes
#' from the Podcast Index database
#'
#' @inheritParams feeds_recent
#'
#' @return `tibble` data frame with metadata associated with episodes
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' episodes_random(max = 20)
episodes_random <- function(max = 2, lang = "en", cat_terms = NULL, notcat_terms = NULL, fulltext = FALSE) {
  # perform checks for key parameters
  max <- check_max(max)
  fulltext <- check_boolean(fulltext, "fulltext")

  if (!is.null(cat_terms)) {
    cat_terms <- check_cat_terms(cat_terms, "cat_terms")
  }

  if (!is.null(notcat_terms)) {
    notcat_terms <- check_cat_terms(notcat_terms, "notcat_terms")
  }

  result_query <- req_podcastindex() |>
    httr2::req_url_path_append(
      "episodes",
      "random"
    )

  if (!is.null(cat_terms) || !is.null(notcat_terms)) {
    result_query <- result_query |>
      httr2::req_url_query(
        cat = cat_terms,
        notcat = notcat_terms
      ) |>
      httr2::req_url(utils::URLdecode(result_query$url))

    result_query <- result_query |>
      httr2::req_url_query(
        max = max,
        lang = lang,
        fulltext = fulltext)
  } else {
    result_query <- result_query |>
      httr2::req_url_query(
        max = max,
        lang = lang,
        fulltext = fulltext)
  }

  result_raw <- httr2::req_perform(result_query)
  res_df <- process_podcastindex_req(result_raw, "episodes")
  return(res_df)
}

#' Get recent podcast episodes
#'
#' `episodes_recent()` obtains the most recent `max` number of podcast
#' episodes across the entire PodcastIndex database, sorted in reverse
#' chronological order.
#'
#' @inheritParams feeds_recent
#' @param exclude_string character string used to exclude any episodes
#'   with title or URL containing the specified string.
#' @param before episode ID string that when specified will only return
#' episodes created before the specified episode ID, allowing you to walk back
#' through episode history sequentially.
#'
#' @return `tibble` data frame with metadata associated with episodes
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' episodes_recent(max = 20)
episodes_recent <- function(max = 7, exclude_string = NULL, before = NULL, fulltext = FALSE) {
  # perform checks for key parameters
  max <- check_max(max)
  if (!is.null(before)) {
    since <- check_datetime(before)
  }

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "recent",
      "episodes"
    ) |>
    httr2::req_url_query(
      max = max,
      excludeString = exclude_string,
      before = before,
      fulltext = fulltext) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "items")
  return(res_df)
}
