with_mock_dir("podcastindex_categories", {
  test_that("podcasts_categories() works", {
    testthat::expect_s3_class(podcasts_categories(), "tbl_df")
  })
})
