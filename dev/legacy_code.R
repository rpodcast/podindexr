#' Create a Request for the podcastindex API
#'
#' @param type string for API request operation
#' @param resource string for endpoint associated with the specified `type`
#' @param ... optional named query parameters for the `resource`
#'
#' @return An [httr2::request] object
#' @noRd
req_podcastindex_legacy <- function(
    type = c("podcasts", "episodes", "recent", "value", "stats", "categories", "search"),
    resource,
    ...) {
  params <- list(...)
  epoch_time <- create_epoch_time()

  resp <- httr2::request("https://api.podcastindex.org/api/1.0") |>
    httr2::req_url_path_append(type, resource) |>
    httr2::req_url_query(!!!params) |>
    httr2::req_user_agent(create_user_agent()) |>
    httr2::req_headers(
      `X-Auth-Date` = epoch_time,
      `X-Auth-Key` = get_podcastindex_api_keys()$api_key,
      Authorization = create_hash(epoch_time),
      Accept = "application/json"
    ) |>
    httr2::req_perform()

  return(resp)
}
