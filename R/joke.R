#' Get a Christmas joke 
#' 
#' This function requests a random joke from the Christmas Countdown API,
#' then returns the setup and punchline in a list.
#' 
#' @return A list containing both the setup (\code{$question}) and punchline (\code{$answer}).
#' @examples 
#' joke()
#' @export
joke <- function() {
    # Make API request
    url <- "https://api.christmascountdown.live/pine/joke"
    ua <- httr::user_agent("https://github.com/Sean-C-Casey/christmaswrap")
    response <-
        httr::GET(url, ua)
    
    # Catch API/Connection Errors
    if (response$status_code != 200) {
        stop(paste("HTTP Error: ", response$status_code))
    }
    else {
        text <- rjson::fromJSON(rawToChar(response$content))
        return(text)
    }
}

