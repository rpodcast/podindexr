value_byfeedid <- function(feedid) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "value",
      "byfeedid"
    ) |>
    httr2::req_url_query(id = feedid) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "value")
  return(res_df)
}

value_byfeedurl <- function(url) {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "value",
      "byfeedurl"
    ) |>
    httr2::req_url_query(url = url) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "value")
  return(res_df)
}
