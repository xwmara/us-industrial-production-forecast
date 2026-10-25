# Shared setup sourced at the top of every page: core packages and data loading.

suppressPackageStartupMessages({
  library(forecast)
  library(ggplot2)
})

theme_set(theme_minimal())

# Read a two-column CSV (date, value) as a monthly ts starting in January 1990
read_monthly_ts <- function(file) {
  if (!file.exists(file)) {
    stop(file, " not found. Run `Rscript R/get_data.R` from the project root first.")
  }
  d <- read.csv(file)
  stopifnot(d$date[1] == "1990-01-01", !anyNA(d$value))
  ts(d$value, start = c(1990, 1), frequency = 12)
}

ip_ts <- read_monthly_ts("data/ipb50001n.csv")
