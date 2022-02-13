#' Access /weekday endpoint
#'
#' This function accesses the /weekday endpoint of the Christmas Countdown API.
#' The API returns an integer corresponding to the weekday that Christmas falls
#' on. By default, this function returns a string representing the weekday, but
#' an argument can be passed to specify returning the 1-based index integer
#' instead.
#' @param return_index Whether to return the day as a 1-based index integer.
#' Defaults to FALSE
#' @returns A string or an integer corresponding to the weekday that CHristmas
#' falls on
#' @keywords weekday week day
#' @examples
#' weekday()
#' weekday(return_index = TRUE)
#'
#' @export
weekday <- function(return_index = FALSE) {
    # Validate argument
    if (! is.logical(return_index))
        stop("TypeError: 'return_index' must be logical")

    # Build URL and perform HTTP GET request and process results
    url <- "https://api.christmascountdown.live/pine/weekday"
    response <- httr::GET(url, httr::add_headers(accept = "application/json"))

    # Extract result and return
    if (response$status_code != 200)
        return(sprintf("HTTP Error: %d", response$status_code))
    weekdays <- c(
        "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
    )
    index <- as.integer(rawToChar(response$content))
    # API returns zero-based index, so convert to R's 1-based system
    index <- index + 1
    if (return_index)
        return(as.integer(index))
    return(weekdays[index])
}
