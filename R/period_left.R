#' Access /timeleft/{period} Endpoint
#'
#' This function accesses the /timeleft/{period} endpoint of the Christmas
#' Countdown API. The specific period is supplied by the user as a function
#' argument.
#' @param period "months", "weeks", "sleeps", "days", "hours", "minutes", or "seconds"
#' @param timezone A UTC offset in string form. Defaults to NULL
#' @return An integer corresponding to the amount of periods left until Christmas
#' @keywords period left
#' @examples
#' period_left("days", timezone = "UTC-7")
#' period_left("weeks")
#'
#' @export
period_left <- function(period, timezone = NULL) {
    # Validate arguments
    if (!is.character(period))
        stop("TypeError: 'period' must be string")
    if (!is.null(timezone) && !is.character(timezone))
        stop("TypeError: 'timezone' must be a string")

    acceptable_periods <- c(
        "months", "weeks", "sleeps", "days", "hours", "minutes", "seconds"
    )
    period <- stringr::str_to_lower(period)
    if (! (period %in% acceptable_periods) )
        stop("ValueError: Unrecognized 'period' argument")

    # Build URL and perform HTTP GET request and process results
    url <- sprintf("https://api.christmascountdown.live/pine/timeleft/%s", period)
    ua <- httr::user_agent("https://github.com/Sean-C-Casey/christmaswrap")
    
    if (is.null(timezone))
        response <- httr::GET(url, httr::add_headers(accept = "application/json"), ua)
    else
        response <- httr::GET(
            url,
            httr::add_headers(accept = "application/json"),
            query = list(timezone = timezone),
            ua
        )

    # Extract result and return
    if (response$status_code != 200)
        stop(sprintf("HTTP Error: %d", response$status_code))
    result <- rawToChar(response$content)
    return(as.integer(result))
}
