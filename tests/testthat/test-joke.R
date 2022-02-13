library(christmaswrap)
library(testthat)

# To space out API calls?
Sys.sleep(1)

test_joke <- joke()

test_that("Joke returns list.", {
  expect_equal(typeof(test_joke), "list")
})

test_that("Joke returns setup and Punchline.", {
    expect_equal(names(test_joke)[1], "question")
    expect_equal(names(test_joke)[2], "answer")
})
