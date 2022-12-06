env_var_present <- function(env_var) {
  x <- Sys.getenv(env_var, unset = NA_character_)
  if (is.na(x)) {
    return(FALSE)
  } else {
    return(x != '')
  }
}


#' Detect if podcastindex API key/secret pair is defined
#'
#' @return boolean, TRUE if both `PODCASTINDEX_API_KEY` and
#'   `PODCASTINDEX_API_SECRET` environment variables are defined
#'   in the current R session.
#' @export
podcastindex_api_isset <- function() {
  all(
    env_var_present("PODCASTINDEX_API_KEY"),
    env_var_present("PODCASTINDEX_API_SECRET")
  )
}

is_testing <- function() {
  identical(Sys.getenv("TESTTHAT"), "true")
}

create_user_agent <- function() {
  "podindexr (https://rpodcast.github.io/podindexr)"
}

create_epoch_time <- function(x = NULL) {
  if (is.null(x)) x <- Sys.time()
  as.numeric(as.POSIXlt(x, "GMT"))
}

create_base_url <- function(apple = FALSE) {
  root_url <- "https://api.podcastindex.org"
  if (!apple) {
    root_url <- paste0(root_url, "/api/1.0")
  }
  return(root_url)
}
