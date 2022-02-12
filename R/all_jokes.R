#' Get all possible Christmas joke 
#' 
#' This function requests all of the jokes from the Christmas Countdown API,
#' then returns the setups and punchlines in a long list.
#' 
#' @return A list containing both the setups (\code{$question}) and punchlines (\code{$answer}).
#' @examples 
#' all_jokes()
#' @export
all_jokes <- function() {
    url <- "https://api.christmascountdown.live/pine/jokes"
    response <-
        httr::GET(url)
    
    # Catch Connection Errors
    if (response$status_code != 200) {
        stop(paste("HTTP Error: ", response$status_code))
    }
    else {
        text <- rjson::fromJSON(rawToChar(response$content))
        return(text)
    }
}
