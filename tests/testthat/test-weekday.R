library(christmaswrap)
library(testthat)

test_that("Function throws error on bad argument.", {
    expect_error(weekday(return_index = "a"))
})

test_that("Function returns correct datatypes.", {
    expect_type(weekday(), "character")
    Sys.sleep(0.5) # Space out API calls
    expect_type(weekday(return_index = TRUE), "integer")
})

# Testing on Feb. 12, 2022
test_that("Function returns correct values", {
    expect_equal(weekday(), "Sunday")
    Sys.sleep(0.5) # Space out API calls
    expect_equal(weekday(return_index = TRUE), 1)
})
