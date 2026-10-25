# Download the data used in the analysis.
#
# Both series come from ALFRED, the archive of past FRED data vintages. Asking
# for a fixed vintage date returns exactly the numbers the analysis was run on,
# even after the source revises the series.
#
# - IPB50001N -> data/ipb50001n.csv (tracked in git; public domain, citation requested)
# - UMCSENT   -> data/umcsent.csv   (NOT tracked in git; copyrighted by the
#                                    University of Michigan)
#
# Run once from the project root before rendering the site:
#   Rscript R/get_data.R

vintage_date <- "2025-12-17"
start_date   <- "1990-01-01"
end_date     <- "2025-04-01"

download_vintage <- function(series_id, file) {
  url <- sprintf(
    "https://alfred.stlouisfed.org/graph/alfredgraph.csv?id=%s&vintage_date=%s&cosd=%s&coed=%s",
    series_id, vintage_date, start_date, end_date
  )
  raw <- read.csv(url)
  out <- data.frame(
    date  = as.Date(raw[[1]]),
    value = as.numeric(raw[[2]])
  )

  # Monthly data from 1990-01 to 2025-04 must give 424 complete rows
  stopifnot(nrow(out) == 424, !anyNA(out$value))

  write.csv(out, file, row.names = FALSE)
  message("Saved ", series_id, " (vintage ", vintage_date, ") to ", file)
}

dir.create("data", showWarnings = FALSE)
download_vintage("IPB50001N", "data/ipb50001n.csv")
download_vintage("UMCSENT", "data/umcsent.csv")
