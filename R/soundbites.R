soundbites_recent <- function(max = 20) {
  # perform checks for key parameters
  max <- check_max(max)

  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "recent",
      "soundbites"
    ) |>
    httr2::req_url_query(max = max) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "items")
  return(res_df)
}
