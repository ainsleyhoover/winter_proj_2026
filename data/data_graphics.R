library(tidyverse)
library(ggthemes)

data_ny <- read_csv("kept_only_r_d_for_party_id_output.csv")

df <- tibble(data_ny)
df

# Histogram for age of data set

ggplot(
  data = data_ny,
  mapping = aes(x = age) 
) +
  geom_histogram(binwidth = 3)

df_dem <- filter(data_ny, party_id %in% "Democratic")
df_rep <- filter(data_ny, party_id %in% "Republican")

# Forming a histograms for Dem and Rep with respect to age
# Important to note the scale for all of these graphs

ggplot(
  data = df_dem,
  mapping = aes(x = age)
) +
  geom_histogram(binwidth = 3, fill = "blue") +
  labs(
    title = "Age of New York Democrats",
    subtitle = "From 2021 NY State Voter Files",
    x = "Age (years)",
    y = "Numbers of Voters"
  )

ggplot(
  data = df_rep,
  mapping = aes(x = age)
) +
  geom_histogram(binwidth = 3, fill = "red") +
  labs(
    title = "Age of New York Republicans",
    subtitle = "From 2021 NY State Voter Files",
    x = "Age (years)",
    y = "Number of Voters"
  )

# Bar graphs with gender for Rep, Dem, and total
# Important to note the scale of these graphs

ggplot(
  data = df_rep,
  mapping = aes(x = gender)
) +
  geom_bar(fill = "red") +
labs(
  title = "Gender of NY Republicans",
  subtitle = "From 2021 NY State Voter Files",
  x = "Gender (0 for Male, 1 for Female)", y = "Number of Voters"
)

ggplot(
  data = df_dem,
  mapping = aes(x = gender)
) +
  geom_bar(fill = "blue") +
  labs(
    title = "Gender of NY Democrats",
    subtitle = "From 2021 NY State Voter Files",
    x = "Gender (0 for Male, 1 for Female)", y = "Number of Voters"
  )

ggplot(
  data = df,
  mapping = aes(x = gender)
) +
  geom_bar()
  labs(
    title = "Gender of NY Voters",
    subtitle = "From 2021 NY State Voter Files",
    x = "Gender (0 for Male, 1 for Female)", y = "Number of Voters"
  )

# Income summaries and boxplots by party and total

# Making income an integer instead of characters
  
rep_income <- gsub("[$,]", "", df_rep$income) |>
  as.integer(rep_income)
summary(rep_income)

dem_income <- gsub("[$,]", "", df_dem$income) |>
  as.integer(dem_income)
summary(dem_income)

total_income <- gsub("[$,]", "", df$income) |>
  as.integer(total_income)
summary(total_income)

# Boxplots of income for Rep, Dem, and total

boxplot(rep_income, 
  main = "Income of NY Republicans",
  col = "red",
  horizontal = TRUE)

boxplot(dem_income,
  main = "Income of NY Democrats",
  col = "blue",
  horizontal = TRUE)

boxplot(total_income,
  main = "Income of NY Voters",
  horizontal = TRUE)
