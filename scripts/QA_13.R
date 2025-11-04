# QA 13 Credit Risk Modelling in R

# Load packages

library(gmodels)

# Chapter 1

# Load loan data
loan_data <- readRDS("data/raw/loan_data_ch1.rds")

# View the structure of loan_data
str(loan_data)

# Call CrossTable() on loan_status
CrossTable(loan_data$loan_status)

# Call CrossTable() on grade and loan_status
CrossTable(x = loan_data$grade, y = loan_data$loan_status, prop.r = TRUE, prop.c = FALSE, prop.t = FALSE, prop.chisq = FALSE)

# Chapter 2

# Chapter 3

# Chapter 4

# Chapter 5
