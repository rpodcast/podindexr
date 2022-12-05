library(httptest2)

# for contexts where the package needs to be fooled
# (CRAN, forks)
# this is ok because the package will used recorded responses
# so no need for a real secret
if (!nzchar(Sys.getenv("PODCASTINDEX_API_KEY"))) {
  Sys.setenv(PODCASTINDEX_API_KEY = "foobar1")
}

if (!nzchar(Sys.getenv("PODCASTINDEX_API_SECRET"))) {
  Sys.setenv(PODCASTINDEX_API_SECRET = "foobar2")
}
