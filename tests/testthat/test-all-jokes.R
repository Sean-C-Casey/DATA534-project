library(christmaswrap)
library(testthat)

# To space out API calls?
Sys.sleep(1)

test_jokes <- all_jokes()

test_that("all_jokes() returns list of lists.", {
    expect_equal(typeof(test_jokes), "list")
    expect_equal(typeof(test_jokes[1]), "list")
})

test_that("all_jokes() returns a long list, not just a pair.", {
    expect_true(length(test_jokes) > 2)  
})

test_that("all_jokes() returns setups and punchlines", {
    expect_equal(names(test_jokes[[1]])[1], "question")
    expect_equal(names(test_jokes[[1]])[2], "answer")
})
