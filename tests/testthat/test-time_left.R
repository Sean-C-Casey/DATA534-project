library(christmaswrap)
library(testthat)

test_that("Timezone type handling works.", {
  expect_error(time_left(timezone = 1))
})

Sys.sleep(0.5) # space out API calls

test_that("Function returns correct type.", {
	expect_type(time_left(), "list")
})

Sys.sleep(0.5) # space out API calls

test_that("Function returns correct values.", {
	expect_equal(names(time_left()), c("months", "weeks", "sleeps", "days", "hours", "minutes", "seconds"))
})
