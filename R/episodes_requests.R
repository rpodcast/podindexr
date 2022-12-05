episodes_byfeedid <- function(feedid, max = 10, fulltext = FALSE, since = NULL) {
  # perform checks for key parameters
  max <- check_max(max)
  fulltext <- check_boolean(fulltext, "fulltext")
  if (!is.null(since)) {
    since <- check_datetime(since)
  }

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "episodes",
      "byfeedid"
    ) |>
    httr2::req_url_query(
      id = feedid,
      max = max,
      fulltext = fulltext,
      since = since) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "items")
  return(res_df)
}

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

episodes_random <- function(max = 2, lang = "en", cat = NULL, notcat = NULL, fulltext = FALSE) {
  # perform checks for key parameters
  max <- check_max(max)
  fulltext <- check_boolean(fulltext, "fulltext")

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "episodes",
      "random"
    ) |>
    httr2::req_url_query(
      max = max,
      lang = lang,
      cat = cat,
      notcat = notcat,
      fulltext = fulltext) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "episodes")
  return(res_df)
}

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
