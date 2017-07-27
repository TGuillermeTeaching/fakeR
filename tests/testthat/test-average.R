## Describing the context (so it prints on screen what it is testing)
context("average")

## Testing the behaviour
test_that("average works fine", {
    ## If the input is not numeric it should print an error
    expect_error(average(c("a", "b", "c")))
    ## If the input is numeric the output should be of class numeric as well
    expect_is(average(c(1,2,3)), "numeric")
    ## And this should be a single value
    expect_equal(length(average(c(1,2,3))), 1)
    ## That is equal to 2
    expect_equal(average(c(1,2,3)), 2)
})