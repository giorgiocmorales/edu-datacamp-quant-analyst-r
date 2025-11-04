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

# Matrix subset
matrix(c(2,3,4,5), nrow=2, ncol=2, byrow=TRUE)

# subset data frame
subset(cash, company == "A")

# drop unused factor levels
rank_order[c(1,3), drop = TRUE]


# 3 Data Frames and future cash flow ----------

## Cash flow

# Present value of $4000, in 3 years, at 5%
present_value_4k <- 4000 * (1 + 5/100)^(-3)

#
company <- c("A", "A", "A", "B", "B", "B", "B")
cash_flow <- c(1000, 4000, 550, 1500, 1100, 750, 6000)
year <- c(1, 3, 4, 1, 2, 4, 5)

cash <- data.frame(company, cash_flow, year)
cash

cash$present_value <- cash$cash_flow * (1 + 5/100)^(-cash$year)
cash

# Total present value of cash
cash$total_pv <- sum(cash$present_value)
cash

# 4 Factors -------
answers <- c("stock", "bond", "bond", "stock")
investment <- factor(answers)
investment

as.integer(investment)
levels(investment)

# Create a factor

# credit_rating character vector
credit_rating <- c("BB", "AAA", "AA", "CCC", "AA", "AAA", "B", "BB")

# Create a factor from credit_rating
credit_factor <- factor(credit_rating)

# Print out your new factor
credit_factor

# Call str() on credit_rating
str(credit_rating)

# Call str() on credit_factor
str(credit_factor)

# Identify unique levels
levels(credit_factor)

# Rename the levels of credit_factor
levels(credit_factor) <- c("2A", "3A", "1B", "2B", "3C")

# Print credit_factor
credit_factor

# Summarize the character vector, credit_rating
summary(credit_rating)

# Summarize the factor, credit_factor
summary(credit_factor)

# Visualize your factor!
plot(credit_factor)

# Order 
rank <- c("low", "medium", "low", "medium", "high") 
rank_wrong_order <- ordered(rank) 
rank_wrong_order 

rank_order <- factor(rank, ordered = TRUE, 
                     levels = c("low", "medium", "high")) 
rank_order 

summary(rank_order)

# 5 Lists ------------

# List components
name <- "Apple and IBM"
apple <- c(109.49, 109.90, 109.11, 109.95, 111.03)
ibm <- c(159.82, 160.02, 159.84, 160.35, 164.79)
cor_matrix <- cor(cbind(apple, ibm))

# Create a list
portfolio <- list(name, apple, ibm, cor_matrix) 

# View your first list
portfolio

# Add names to your portfolio
names(portfolio) <- c("portfolio_name","apple", "ibm", "correlation")

# Print portfolio
portfolio

# Second and third elements of portfolio
portfolio[c(2,3)]

# Use $ to get the correlation data
portfolio$correlation

# Add weight: 20% Apple, 80% IBM
portfolio$weight <- c(apple = 0.2, ibm = 0.8)

# Print portfolio
portfolio

# Change the weight variable: 30% Apple, 70% IBM
portfolio$weight <- c(apple = 0.3, ibm = 0.7)

# Print portfolio to see the changes
portfolio

## Split-Apply-Combine
debt <- data.frame(name = c("Dan", "Dan", "Dan", "Rob", "Rob", "Rob"),
                   payment = c(100, 200, 150, 50, 75, 100))

debt

grouping <- debt$name
grouping

split_debt <- split(debt, grouping)
split_debt

split_debt$Dan
split_debt$Dan$payment

unsplit(split_debt, grouping)

# Discounts

split_debt <- split(debt, grouping)
grouping <- debt$name

split_debt$Dan$new_payment <- split_debt$Dan$payment*.8
split_debt$Rob$new_payment <- split_debt$Dan$payment*.9

split_debt

unsplit(split_debt, grouping)


# Attributes

# my_matrix and my_factor
my_matrix <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
rownames(my_matrix) <- c("Row1", "Row2")
colnames(my_matrix) <- c("Col1", "Col2", "Col3")

my_factor <- factor(c("A", "A", "B"), ordered = T, levels = c("A", "B"))

# attributes of my_matrix
attributes(my_matrix)

# Just the dim attribute of my_matrix
attr(my_matrix, which = "dim")

# attributes of my_factor
attributes(my_factor)