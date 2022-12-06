#' Get recent podcast feeds
#'
#' @description `feeds_recent()` retrieves the most recent podcast feeds added
#'   to the podcastindex.
#'
#' @param max Maximum number of results to return.
#'   Value must be a single integer between 1 and 1000.
#' @param lang optional two-letter language code that when specified will
#'   only return podcasts/episodes having that specific language.
#' @param since optional date string in format `YYYY-MM-DD` that when specified
#'   will only return podcasts/episodes created since the specified date.
#' @param cat_terms optional character vector of one or more categories that
#'   when specified will only return podcasts/episodes under those categories.
#' @param notcat_terms optional character vector of one or more categories that
#'   when specified will only return podcasts/episodes not under those
#'   categories.
#'
#' @return `tibble` data frame with metadata associated with recent feeds
#'   in chronological order
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' feeds_recent()
#'
#' feeds_recent(max = 100, since = "2021-01-01", cat_terms = c("News", "Finance"))
#'
feeds_recent <- function(max = 40, lang = "en", since = NULL, cat_terms = NULL, notcat_terms = NULL) {
  # perform checks for key parameters
  max <- check_max(max)
  if (!is.null(since)) {
    since <- check_datetime(since)
  }

  if (!is.null(cat_terms)) {
    cat_terms <- check_cat_terms(cat_terms, "cat_terms")
  }

  if (!is.null(notcat_terms)) {
    notcat_terms <- check_cat_terms(notcat_terms, "notcat_terms")
  }

  result_query <- req_podcastindex() |>
    httr2::req_url_path_append(
      "recent",
      "feeds"
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
        since = since)
  } else {
    result_query <- result_query |>
      httr2::req_url_query(
        max = max,
        lang = lang,
        since = since,
        cat = cat_terms,
        notcat = notcat_terms)
  }

  result_raw <- httr2::req_perform(result_query)
  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}

#' Get new podcast feeds
#'
#' @description feeds_recent()` retrieves the newest podcast feeds added
#'   to the podcastindex over the past 24 hours.
#' @inheritParams feeds_recent
#' @param feedid string of the Podcastindex Feed ID to start from
#'   (or go to if `desc` is set to TRUE). If `since` is specified, `feedid`
#'   takes precedence.
#' @param desc boolean to display feeds in descending order. Only applicable
#'   when specifying `feedid`.
#'
#' @return `tibble` data frame with metadata associated with new feeds
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' feeds_new(max = 20)
feeds_new <- function(max = 60, since = NULL, feedid = NULL, desc = FALSE) {
  # perform checks for key parameters
  max <- check_max(max)
  if (!is.null(since)) {
    since <- check_datetime(since)
  }

  if (desc) {
    if (is.null(feedid)) {
      cli::cli_abort("You must specify a {.arg feedid} when utilizing {.arg desc}.")
    }
  }

  desc <- check_boolean(desc, "desc")

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "recent",
      "newfeeds"
    ) |>
    httr2::req_url_query(
      max = max,
      since = since,
      feedid = feedid,
      desc = desc) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}
