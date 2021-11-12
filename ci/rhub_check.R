# From: https://jozef.io/r107-multiplatform-gitlabci-rhub/

# Retrieve passed command line arguments
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1L) {
  stop("Incorrect number of args, needs 1: platform (string)")
}
platform <- args[[1L]]

# Check if passed platform is valid 
if (!is.element(platform, rhub::platforms()[[1L]])) {
  stop(paste(
    "Given platform not in rhub::platforms()[[1L]]:",
    platform
  ))
}

# Run the check on the selected platform
# Use show_status = TRUE to wait for results
cr <- rhub::check(platform = platform, show_status = TRUE)

# Get the statuses from private field status_
statuses <- cr[[".__enclos_env__"]][["private"]][["status_"]]

# Create and print a data frame with results
res <- do.call(rbind, lapply(statuses, function(thisStatus) {
  data.frame(
    plaform  = thisStatus[["platform"]][["name"]],
    errors   = length(thisStatus[["result"]][["errors"]]),
    warnings = length(thisStatus[["result"]][["warnings"]]),
    notes    = length(thisStatus[["result"]][["notes"]]),
    stringsAsFactors = FALSE
  )
}))
print(res)

# Fail if any errors, warnings or notes found
if (any(colSums(res[2L:4L]) > 0)) {
  stop("Some checks had errors, warnings or notes. See above for details.")
}