library(christmaswrap)
library(testthat)

test_that("Timezone type handling works.", {
	expect_error(total_time_left(timezone = 1))
})

Sys.sleep(0.5) # space out API calls

test_that("Function returns correct type.", {
	expect_type(total_time_left(), "list")
})

Sys.sleep(0.5) # space out API calls

test_that("Function returns correct values.", {
	expect_equal(names(total_time_left()), c("days", "hours", "minutes", "seconds"))
})
