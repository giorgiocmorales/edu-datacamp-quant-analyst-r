# QA15 Time Series Analysis in R

# Load packages
library(tidyverse)
library(ggplot2)
library(zoo)
library(xts)
library(lubridate)

# CHAPTER 1 ------

# Load maunaloa dataset

maunaloa <- readRDS("data/raw/maunaloa.Rds")

# Explore dataset
str(maunaloa)

# Transform into zoo object
maunaloa <- maunaloa %>% as.zoo()

# Check structure
str(maunaloa)

# Autoplot
autoplot(maunaloa) +
  theme_minimal()

# Determine summary statistics
base::summary(maunaloa)

# Manipulating date formats

#Date-time conversions
?strptime

# 
dates <- c("2019-01-01", "2019-01-02", "2019-01-03", "2019-01-04", "2019-01-05", "2019-01-06", "2019-01-07", "2019-01-08", "2019-01-09", "2019-01-10")
class(dates)

dates_converted <- lubridate::as_date(dates)
class(dates_converted)

dates_order <- c("2019-01-01", "2019-01-02", "01/03/2019", "2019-01-04", "2019-01-05", "2019-01-06", "01/07/2019", "2019-01-08", "2019-01-09", "2019-01-10")

# Enter all the date formats from dates_order
parse_date_time(dates_order,
                orders = c("%Y-%m-%d", "%m/%d/%Y" ))


# CHAPTER 2 ------


# Save the start point of maunaloa: maunaloa_start
maunaloa_start <- start(maunaloa)
print(maunaloa_start)

# Assign the formatted date to start_iso
start_iso <- date_decimal(maunaloa_start)
print(start_iso)

# Convert to Date class
as_date(start_iso)

maunaloa_end <- end(maunaloa)

maunaloa_end - maunaloa_start

# Save the start point of maunaloa: maunaloa_start
maunaloa_start <- start(maunaloa)
print(maunaloa_start)

# Assign the formatted date to start_iso
start_iso <- date_decimal(maunaloa_start)
print(start_iso)

# Convert to Date class
as_date(start_iso)

# Cards vectors
set.seed(123)

cards_price <- rnorm(730, mean = 5, sd = 0.10)
cards_price[cards_price < 4.66] <- 4.66
cards_price[cards_price > 5.32] <- 5.32

cards_index <- seq.Date(
  from = as.Date("2013-01-01"),
  to   = as.Date("2014-12-31"),
  by   = "day"
)

# Return the head of cards_index
head(cards_index)

# Return the head of cards_price
head(cards_price)

# Create a zoo object: cards_zoo
cards_zoo <- zoo(x = cards_price, order.by = cards_index)

# Autoplot cards_zoo
autoplot(cards_zoo)

# Enter the x and y axis mapping aesthetics
ggplot(cards_zoo, aes(x = Index, y = cards_zoo)) + 
  
  scale_y_continuous() + 
  # Plot the data with a red-colored line
  geom_line(color = "red") + 
  
  # Use the light theme
  theme_light() + 
  
  # Enter the appropriate axis labels and title
  labs( 
    x = "Index",
    y = "Price (EUR)",
    title = "Daily Card Prices for Trading Card Game")

# CHAPTER 3 ------

# CHAPTER 4 ------