install.packages("readxl")
library(readxl)
install.packages("lpSolve")
library(lpSolve)
# Assuming your Excel file is named 'knapsack_data.xlsx'
file_path <- 'Option2.xlsx'
df <- read_excel(file_path)
# Define the objective function coefficients (maximize LIDAC and GHG, minimize Cost_Benefit)
objective_coefficients <- c(-1, 1, -1)

# Define the constraint matrix (Money_Request should not exceed $200,000,000)
constraint_matrix <- matrix(c(df$CostBenefit, -1), ncol = 2)

# Define the direction of the constraint (less than or equal)
constraint_direction <- c("<=")

# Define the right-hand side of the constraint (maximum Money_Request)
constraint_rhs <- df$MoneyRequest

# Solve the linear programming problem
result <- lp("max", objective_coefficients, constraint_matrix, constraint_direction, constraint_rhs)

# Display the results
cat("Status:", result$status, "\n")
cat("Objective Value:", result$objval, "\n")
cat("Selected Items:", result$solution, "\n")