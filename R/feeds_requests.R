feeds_recent <- function(max = 40, lang = "en", since = NULL, cat_terms = NULL, notcat_terms = NULL, fulltext = FALSE) {
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
        since = since,
        fulltext = fulltext)
  } else {
    result_query <- result_query |>
      httr2::req_url_query(
        max = max,
        lang = lang,
        since = since,
        cat = cat_terms,
        notcat = notcat_terms,
        fulltext = fulltext)
  }

  result_raw <- httr2::req_perform(result_query)
  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}

feeds_new <- function(max = 60, since = NULL, feedid = NULL, desc = FALSE) {
  # perform checks for key parameters
  max <- check_max(max)
  if (!is.null(since)) {
    since <- check_datetime(since)
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
