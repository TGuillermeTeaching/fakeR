#' @title Super significant t.test
#'
#' @description Always make sure your results are significant
#'
#' @param X A distribution 
#' @param Y Another distribution
#' 
#' @return A significant t-test!
#' 
#' @examples
#' super.t.test(rnorm(50), rnorm(50))
#' 
#' @author Thomas Guillerme
#' @export
super.t.test <- function(X, Y) {

    ## Run the test
    test_results <- stats::t.test(X, Y)

    ## Check if the p-value is non-significant
    if(test_results$p.value > 0.05) {
        ## Cheat!
        test_results$p.value <- stats::runif(1, max = 0.05)
    }
    
    return(test_results)
}

#' @importFrom stats t.test
NULL

#' @importFrom stats runif
NULL