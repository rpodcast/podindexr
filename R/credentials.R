#' Obtain podcastindex API key and secret pair
#'
#' Obtain the podcastindex API key and secret values from a `.Renviron`
#' file, either stored in the current directory or the user's home directory.
#' @return list with API key and API secret values
#' @export
get_podcastindex_api_keys <- function() {
  if (!podcastindex_api_isset()) {
    cli::cli_abort("Unable to find PodcastIndex API key and secret pair. Please create a developer account at {.url https://api.podcastindex.org/developer_home} and set {.envvar PODCASTINDEX_API_KEY} & {.envvar PODCASTINDEX_API_SECRET} environment variables inside your {.file ~/.Renviron} file.")
  } else {
    return(
      list(
        api_key = Sys.getenv("PODCASTINDEX_API_KEY"),
        api_secret =Sys.getenv("PODCASTINDEX_API_SECRET")
      )
    )
  }
}

#' Create podcastindex authentication token
#'
#' Create a custom authentication token required by the podcastindex api
#' utilizing the podcastindex API key and secret pair
#'
#' @param epoch_time string of time in UTC unix format. If NULL, the current
#'   system time will be used.
#'
#' @return string representing hash (sha1) of API key, secret and epoch time
#'   created with the `digest` package
#' @export
create_hash <- function(epoch_time = NULL) {
  if (is.null(epoch_time)) epoch_time <- create_epoch_time()
  hash_input <- paste0(
    get_podcastindex_api_keys()$api_key,
    get_podcastindex_api_keys()$api_secret,
    epoch_time
  )

  digest::digest(hash_input, algo = "sha1", serialize = FALSE)
}
