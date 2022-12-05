check_max <- function(x, arg_name = "max") {
  if (!rlang::is_scalar_double(x) || is.na(x) || x < 1 || x > 1000) {
    cli::cli_abort("{.arg {arg_name} must be a single value between 1 and 1000") # noling
  }
  x
}

check_boolean <- function(x, arg_name = c("clean", "fulltext", "desc", "similar", "pretty")) {
  arg_name <- rlang::arg_match(arg_name)
  if (!rlang::is_bool(x)) {
    cli::cli_abort("{.arg {arg_name} must be either TRUE or FALSE")
  }
  if (!x) {
    return(NULL)
  } else {
    return("")
  }
}

check_datetime <- function(x, arg_name = "since") {
  if (!is.null(x) && !grepl("^\\d{4}-\\d{2}-\\d{2$", x)) {
    cli::cli_abort("{.arg {arg_name} must be a string with format YYYY-MM-DD")
  }
  create_epoch_time(x)
}
