
library(tidyverse)
library(rvest)
library(skimr) # used to scrape website content

# Check if that data folder exists and creates it if not
dir.create("data", showWarnings = FALSE)

# Read the webpage code
webpage <- read_html("https://www.eatthis.com/iconic-desserts-united-states/")

dessert <- c("Ice cream", "Sour candy")
name <- c("Joshua", "Bailey")
dessert_df <- data.frame(dessert, name)

# Extract the desserts listing
dessert_elements<- html_elements(webpage, "h2")
dessert_listing <- dessert_elements %>% 
  html_text2() %>%             # extracting the text associated with this type of element of the webpage
  as_tibble() %>%              # make it a data frame
  rename(dessert = value) %>%  # better name for the column
  head(.,-3) %>%               # 3 last ones were not desserts 
  rowid_to_column("rank") %>%  # adding a column using the row number as a proxy for the rank
  write_csv("data/iconic_desserts.csv") # save it as cs

dessert_listing <- mutate(tolower(dessert_listing)

library(dplyr)
library(tidyr)

match <- inner_join(dessert_df, dessert_listing, by = "dessert")

hist(dessert_listing)

candy_vec <- c("sour patch", "sour worms", "warheads", "bottle caps", "lemon heads")

