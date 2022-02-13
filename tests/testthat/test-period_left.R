# test_that("multiplication works", {
#   expect_equal(2 * 2, 4)
# })
library(christmaswrap)
library(testthat)

# Testing this on Feb. 12, 2022
test_that("Function returns integer.", {
    expect_type(period_left("weeks"), "integer")
})

Sys.sleep(0.5) # Space out API calls

test_that("Function returns correct value.", {
    expect_equal(period_left("months"), 10)
    Sys.sleep(0.5) # Space out API calls
    expect_equal(period_left("weeks"), 44)
})

test_that("Function throws error on bad arguments", {
    expect_error(period_left("abc"))
    expect_error(period_left("days", timezone = -8))
})
