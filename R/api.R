#' Create a Request for the podcastindex API
#'
#' @return An [httr2::request] object
#' @noRd
req_podcastindex <- function() {
  epoch_time <- create_epoch_time()
  httr2::request("https://api.podcastindex.org/api/1.0") |>
    httr2::req_user_agent(create_user_agent()) |>
    httr2::req_headers(
      `X-Auth-Date` = epoch_time,
      `X-Auth-Key` = get_podcastindex_api_keys()$api_key,
      Authorization = create_hash(epoch_time),
      Accept = "application/json"
    )
}

#' Create data frame from podcastindex API request
#'
#' @param req An [httr2::request] object created by `req_podcastindex`
#' @param slot string indicating which slot of the JSON response
#'   contains the result of interest. Value depends on the endpoint
#'   used in the request.
#'
#' @return tibble with request results
#' @noRd
process_podcastindex_req <- function(req, slot) {
  req_json <- httr2::resp_body_json(req)

  res_list <- req_json |>
    purrr::pluck(slot)

  res_list <- purrr::compact(res_list)

  if (is.null(names(res_list))) {
    res_df <- purrr::map_dfr(res_list, ~{
      x_list <- purrr::compact(.x)
      tibble::as_tibble(purrr::modify_if(x_list, ~length(.x) > 1, list))
    })
  } else {
    res_df <- tibble::as_tibble(purrr::modify_if(res_list, ~length(.x) > 1, list))
  }

  return(res_df)
}
