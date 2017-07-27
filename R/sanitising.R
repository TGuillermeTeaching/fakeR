## Check if an argument is a numeric vector
check.vector <- function(vector) {
    if(class(vector) != "numeric") {
        stop("Your vector is not numeric!")
    }
}