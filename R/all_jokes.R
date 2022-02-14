#' Get all possible Christmas joke 
#' 
#' This function requests all of the jokes from the Christmas Countdown API,
#' then returns the setups and punchlines in a long list.
#' 
#' @return A long list of 2-item-lists containing both the setups (\code{$question}) and punchlines (\code{$answer}).
#' @examples 
#' all_jokes()
#' @export
all_jokes <- function() {
    # Request from API
    url <- "https://api.christmascountdown.live/pine/jokes"
    ua <- httr::user_agent("https://github.com/Sean-C-Casey/christmaswrap")
    response <-
        httr::GET(url, ua)
    
    # Raise Errors if API or connection error occurs.
    if (response$status_code != 200) {
        stop(paste("HTTP Error: ", response$status_code))
    }
    else {
        text <- rjson::fromJSON(rawToChar(response$content))
        return(text)
    }
}