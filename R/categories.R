#' Get podcast categories
#'
#' `podcasts_categories()` obtains all of the possible categories supported
#' by the Podcast Index.
#'
#' @return `tibble` data frame with category id and name
#' @export
#'
#' @examplesIf podindexr::podcastindex_api_isset()
#' # Requires API key and secret
#'
#' podcasts_categories()
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
