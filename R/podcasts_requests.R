podcasts_byfeedid <- function(id) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "podcasts",
      "byfeedid"
    ) |>
    httr2::req_url_query(id = id) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feed")
  return(res_df)
}

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

podcasts_bytag <- function(tag) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "podcasts",
      "bytag"
    ) |>
    httr2::req_url_query(tag = tag) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feed")
  return(res_df)
}

podcasts_trending <- function(max = 10, since = NULL, cat = NULL, notcat = NULL) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "podcasts",
      "trending"
    ) |>
    httr2::req_url_query(
      max = max,
      since = since,
      cat = cat,
      notcat = notcat
    ) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}
