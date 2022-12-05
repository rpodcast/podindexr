podcasts_categories <- function() {
  result_raw <- req_podcastindex() |>
    httr2::req_url_path_append(
      "categories",
      "list"
    ) |>
    httr2::req_perform()

  res_df <- process_podcastindex_req(result_raw, "feeds")
  return(res_df)
}
