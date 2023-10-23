library(tictoc)

# File for timing three different solutions

# 1. Timing the solution 1 script as is

tic("Timing solution 1")
source("scripts/hw4_solution.r")
Elasped_time_S1 <- toc()
elapsed1 <- Elasped_time_S1$callback_msg

# Timing for the first solution was approximately 90 seconds

# 2. Timing the solution 2 script (using parallel computing)

tic("Timing solution 2")
source("scripts/hw4_solution2.r")
Elasped_time_S2 <- toc()
elapsed2 <- Elasped_time_S2$callback_msg

# Timing for the second solution was approximately 65 seconds

# 3. Timing the solution 3 script (split the M simulations in more than one core)

tic("Timing solution 3")
source("scripts/hw4_solution3.r")
Elasped_time_S3 <- toc()
elapsed3 <- Elasped_time_S3$callback_msg

# Timing for the third solution was approximately 40 seconds

# Visualizing the three solution run times in a table
times <- data.frame(
  Time = c(elapsed1, elapsed2, elapsed3)
)
cat(times$Time, sep="\n")

# Comment:
# The third solution script was the fastest with roughly 40 seconds, compared
# to the original solution using almost 90 seconds to run the code.
# Solution 3 likely has the lowest running time because it parallelizes the 
# "M" simulations, which might be more computationally intensive and therefore
# yields a higher speedup when parallelized.



