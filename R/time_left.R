#' Access /timeleft Endpoint
#' 
#' This function gets the time left until Christmas in a variety of different time units.
#' @param timezone character vector, matching a time zone abbreviation. The default value, NULL, retrieves results for UTC.
#' @return a named list containing time until Christmas in months, weeks, sleeps, days, hours, minutes and seconds.
#' @examples
#' time_left()
#' time_left(timezone = "PST")
#' 
#' @export
time_left <- function(timezone = NULL) {
	# Validate arguments
	if (!is.null(timezone) && !is.character(timezone))
		stop("TypeError: 'timezone' must be a string")
	
	# Execute GET request
	URL <- sprintf("https://api.christmascountdown.live/pine/timeleft")
	response <- httr:GET(url = URL, query = list(timezone = timezone))
	
	# Check if request executed successfully
	if (response$status_code != 200)
		stop(sprintf("HTTP Error: error code - %d", response$status_code))
	
	# Process response and return
	result <- rjson::fromJSON(rawToChar(r$content))
	return(result)
}