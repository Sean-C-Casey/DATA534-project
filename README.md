# christmaswrap

*place badges here? CI, C-RAN status...*

## Overview

christmaswrap is an API wrapper written in R for the [Christmas Countdown API](https://christmascountdown.live/api).  

## Installation - *remove this section if we don't publish*

```{r}
install.packages("christmaswrap")

# alternatively

devtools::install_github("") # not sure how this works...
```

## Usage

```{r}
> library(christmaswrap)
>  
> time_left(timezone = "PST")
$months
[1] 10

$weeks
[1] 44

$sleeps
[1] 313

$days
[1] 312

$hours
[1] 7510

$minutes
[1] 450651

$seconds
[1] 27039087
```

```{r}
> total_time_left(timezone = "PST")
$days
[1] 312

$hours
[1] 22

$minutes
[1] 49

$seconds
[1] 59
```

```{r}
> period_left("weeks", timezone = "PST")
[1] 44
```

```{r}
> weekday(return_index = FALSE)
[1] "Sunday"
```

```{r}
> joke()
$question
[1] "Why has Debenhams been forced to cancel its Christmas nativity play?"

$answer
[1] "No prophet!"
```

```{r}
> all_jokes()
[[1]]
[[1]]$question
[1] "What does Santa suffer from if he gets stuck in a chimney?"

[[1]]$answer
[1] "Claus-trophobia!"

...

[[110]]
[[110]]$question
[1] "Why has Boris Johnson bought mistletoe this year?"

[[110]]$answer
[1] "Because he’s tired of being in the single market!"
```
