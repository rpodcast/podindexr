#' Search podcasts
#'
#' `search_byterm()` performs a search of the `title`, `author`, or `owner`
#' of podcasts feeds within the PodcastIndex.
#'
#' @param q character string of the term(s) to search for
#' @param val string indicating which value block type to filter
#'   search results. Valid entries are `any`, `lightning`, `hive`,
#'   or `webmonetization`.
#' @param aponly boolean to only return feeds with an itunesId present
#' @param clean boolean to only return non-explicit podcast feeds. Meaning
#'   feeds where the `itunes:explicit` flag is set to false.
#' @param fulltext boolean to return the full text value of any text fields
#'   within the result data. If set to FALSE, all text fields are truncated
#'   to 100 words.
#'
#' @return `tibble` data frame with metadata associated with feeds
#'   that match the search terms in the `title`, `author`, or `owner`
#'   fields.
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' search_byterm(q = "batman university")
search_byterm <- function(q, val = NULL, aponly = TRUE, clean = TRUE, fulltext = FALSE) {
  # perform checks for key parameters
  if (!is.null(val)) {
    if (!val %in% c("any", "lightning", "hive", "webmonetization")) {
      cli::cli_abort("{.arg val} must be one of 'any', 'lightning', 'hive', 'webmonetization'")
    }
  }

  clean <- check_boolean(clean, "clean")
  fulltext <- check_boolean(fulltext, "fulltext")

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "search",
      "byterm"
    ) |>
    httr2::req_url_query(
      q = q,
      val = val,
      aponly = aponly,
      clean = clean,
      fulltext = fulltext) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}

#' Search podcasts by title
#'
#' `search_byterm()` performs a search of the `title` field of podcasts
#' feeds within the PodcastIndex.
#' @inheritParams search_byterm
#' @param similar boolean to include similar matches in search response
#'
#' @return `tibble` data frame with metadata associated with feeds
#'   that match (or similar to) the search terms in the `title` fields.
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' search_bytitle(q = "batman university")
search_bytitle <- function(q, val = NULL, clean = TRUE, fulltext = FALSE, similar = FALSE) {
  # perform checks for key parameters
  if (!is.null(val)) {
    if (!val %in% c("any", "lightning", "hive", "webmonetization")) {
      cli::cli_abort("{.arg val} must be one of 'any', 'lightning', 'hive', 'webmonetization'")
    }
  }

  clean <- check_boolean(clean, "clean")
  fulltext <- check_boolean(fulltext, "fulltext")
  similar <- check_boolean(similar, "similar")

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "search",
      "bytitle"
    ) |>
    httr2::req_url_query(
      q = q,
      val = val,
      clean = clean,
      fulltext = fulltext,
      similar = similar) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}

#' Search podcast episodes by person
#'
#' `search_byperson()` performs a search of podcast episodes where the
#' specified person is mentioned.
#'
#' @inheritParams search_byterm
#' @param q character string of the person to search for
#'
#' @return `tibble` data frame with metadata associated with episodes
#'   that mention the person specified in the search query.
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' search_byperson(q = "Adam Curry")
search_byperson <- function(q, fulltext = FALSE) {
  # perform checks for key parameters
  fulltext <- check_boolean(fulltext, "fulltext")

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "search",
      "byperson"
    ) |>
    httr2::req_url_query(
      q = q,
      fulltext = fulltext) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "items")
  return(res_df)
}

#' Search music podcasts
#'
#' `search_music()` performs a search of the `title`, `author`, or `owner`
#' of podcast feeds within the PodcastIndex where the medium is music.
#'
#' @inheritParams search_byterm
#'
#' @return `tibble` data frame with metadata associated with feeds
#'   that match the search terms in the `title`, `author`, or `owner`
#'   fields.
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' search_music(q = "metal")
search_music <- function(q, val = NULL, aponly = TRUE, clean = TRUE, fulltext = FALSE) {
  # perform checks for key parameters
  if (!is.null(val)) {
    if (!val %in% c("any", "lightning", "hive", "webmonetization")) {
      cli::cli_abort("{.arg val} must be one of 'any', 'lightning', 'hive', 'webmonetization'")
    }
  }

  clean <- check_boolean(clean, "clean")
  fulltext <- check_boolean(fulltext, "fulltext")

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "search",
      "music",
      "byterm"
    ) |>
    httr2::req_url_query(
      q = q,
      val = val,
      aponly = aponly,
      clean = clean,
      fulltext = fulltext) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}

#' Search podcasts with Apple-like API
#'
#' `search_apple_byterm()` replaces the Apple search API but
#' uses the Podcast Index database instead.
#'
#' @param term character string of the term to search for
#'
#' @return `tibble` data frame with metadata associated with podcasts
#'   that match the search term
#' @export
#'
#' @examples
#'
#' search_apple_byterm("metal")
search_apple_byterm <- function(term) {
  result_raw <- req_podcastindex(auth = FALSE, apple = TRUE) |>
    httr2::req_url_path_append("search") |>
    httr2::req_url_query(term = term) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "results")
  return(res_df)
}

#' Lookup podcasts with Apple-like API
#'
#' `search_apple_lookup()` replaces the Apple podcast lookup api
#' but uses the Podcast Index database instead.
#'
#' @param feedid integer of the iTunes feed ID to search for.
#'
#' @return `tibble` data frame with metadata associated with podcasts
#'   that match the feed ID
#' @export
#'
#' @examples
#'
#' search_apple_lookup(feedid = 1441923632)
search_apple_lookup <- function(feedid) {
  result_raw <- req_podcastindex(auth = FALSE, apple = TRUE) |>
    httr2::req_url_path_append("lookup") |>
    httr2::req_url_query(id = feedid) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "results")
  return(res_df)
}
