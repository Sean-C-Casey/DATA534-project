#' Access /timeleft/total Endpoint
#' 
#' This function gets the total time left until Christmas.
#' @param timezone character vector, matching a time zone abbreviation. The default value, NULL, retrieves results for UTC.
#' @return a named list containing time until Christmas with units days, hours, minutes and seconds.
#' @examples
#' total_time_left()
#' total_time_left(timezone = "PST")
#' 
#' @export
total_time_left <- function(timezone = NULL) {
	# Validate arguments
	if (!is.null(timezone) && !is.character(timezone))
		stop("TypeError: 'timezone' must be a string")
	
	# Execute GET request
	URL <- "https://api.christmascountdown.live/pine/timeleft/total"
	response <- httr::GET(url = URL, query = list(timezone = timezone))
	
	# Check if request executed successfully
	if (response$status_code != 200)
		stop(sprintf("HTTP Error: error code - %d", response$status_code))
	
	# Process response and return
	result <- rjson::fromJSON(rawToChar(response$content))
	return(result)
}