# QA1 Introduction to R for Finance

# 1 Basics Financial Returns ---------------

## Single period

# Variables for starting_cash and 5% return during January
starting_cash <- 200
jan_ret <- 5
jan_mult <- 1 + (jan_ret / 100)

# How much money do you have at the end of January?
post_jan_cash <- starting_cash*jan_mult

# Print post_jan_cash
post_jan_cash

# January 10% return multiplier
jan_ret_10 <- 10
jan_mult_10 <- 1 + (jan_ret_10/100)

# How much money do you have at the end of January now?
post_jan_cash_10 <- starting_cash*jan_mult_10

# Print post_jan_cash_10
post_jan_cash_10

## Multiple periods

# Starting cash and returns 
starting_cash <- 200
jan_ret <- 4
feb_ret <- 5

# Multipliers
jan_mult <- 1.04
feb_mult <- 1.05

# Total cash at the end of the two months
total_cash <- starting_cash*jan_mult*feb_mult

# Print total_cash
total_cash

# 2 Vectors and matrix manipulation --------------

## Vectors

# Weights, returns, and company names
ret <- c(7, 9)
weight <- c(.2, .8)
companies <- c("Microsoft", "Sony")

# Assign company names to your vectors
names(ret) <- companies
names(weight) <- companies

# Multiply the returns and weights together 
ret_X_weight <- ret*weight

# Print ret_X_weight
ret_X_weight

# Sum to get the total portfolio return
portf_ret <- sum(ret_X_weight)

# Print portf_ret
portf_ret

## Matrix and correlation

micr <- c(59.20, 59.25, 60.22, 59.95) 
ebay <- c(17.44, 18.32, 19.11, 18.22)

cor(micr, ebay)

micr_ebay_matrix <- cbind(micr, ebay)
micr_ebay_matrix

cor(micr_ebay_matrix)

plot(micr_ebay_matrix)

# 3 Data Frames and future cahs flow

## Cash flow

# Present value of $4000, in 3 years, at 5%
present_value_4k <- 4000 * (1 + 5/100)^(-3)

#
company <- c("A", "A", "A", "B", "B", "B", "B")
cash_flwo <- c(1000, 4000, 550, 1500, 1100, 750, 6000)

