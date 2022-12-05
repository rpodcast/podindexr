env_var_present <- function(env_var) {
  x <- Sys.getenv(env_var, unset = NA_character_)
  if (is.na(x)) {
    return(FALSE)
  } else {
    return(x != '')
  }
}

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
