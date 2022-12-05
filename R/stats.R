current_stats <- function() {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "stats",
      "current"
    ) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "stats")
  return(res_df)
}
