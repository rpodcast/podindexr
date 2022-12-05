feeds_recent <- function(max = 40, lang = "en", since = NULL, cat = NULL, notcat = NULL, fulltext = FALSE) {
  # perform checks for key parameters
  max <- check_max(max)
  if (!is.null(since)) {
    since <- check_datetime(since)
  }

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "recent",
      "feeds"
    ) |>
    httr2::req_url_query(
      max = max,
      lang = lang,
      since = since,
      cat = cat,
      notcat = notcat,
      fulltext = fulltext) |>
    httr2::req_perform()

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
