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

search_apple_byterm <- function(term) {
  result_raw <- req_podcastindex(auth = FALSE, apple = TRUE) |>
    httr2::req_url_path_append("search") |>
    httr2::req_url_query(term = term) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "results")
  return(res_df)
}

search_apple_lookup <- function(feedid) {
  result_raw <- req_podcastindex(auth = FALSE, apple = TRUE) |>
    httr2::req_url_path_append("lookup") |>
    httr2::req_url_query(id = feedid) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "results")
  return(res_df)
}
