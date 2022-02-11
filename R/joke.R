#' Get a Christmas joke 
#' 
#' This function request a random joke from the Christmas Countdown API,
#' then returns the setup and punchline in a list.
#' 
#' @return A list containing both the setup (\code{$question}) and punchline (\code{$answer}).
#' @examples 
#' joke()
#' @export
joke <- function() {
    url <- "https://api.christmascountdown.live/pine/joke"
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

