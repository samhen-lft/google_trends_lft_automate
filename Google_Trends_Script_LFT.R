##this script fatches google trends data on different topics at the first day of the month
##the data is then saved in a csv-file


# trends_script.R
library(gtrendsR)
library(readr)
library(lubridate)

# --- Pull Google Trends for "tourism" last 12 months ---
res <- gtrends(keyword = "tourism", geo = "US", time = "today 12-m")
df <- res$interest_over_time

# --- Generate a dynamic filename with date+time ---
timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
file_name <- sprintf("tourism_trends_%s.csv", timestamp)

# --- Ensure 'data/' folder exists ---
dir.create("data", showWarnings = FALSE)

# --- Save CSV in 'data/' folder ---
write_csv(df, file.path("data", file_name))

cat("Saved CSV as:", file.path("data", file_name), "\n")