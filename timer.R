library(tictoc)

# The three libraries below are used in the other files, and they will have 
# an impact on the elapsed running time. There they are loaded here in case
# the solution files are not run in advance
library(foreach) 
library(iterators)
library(parallel)

# File for timing three different solutions

# Clearing timing log

tic.clearlog()

# 1. Timing the solution 1 script as is

tic("Timing solution 1")
source("scripts/hw4_solution.r")
toc(log = TRUE)

# 2. Timing the solution 2 script (using parallel computing)

tic("Timing solution 2")
source("scripts/hw4_solution2.r")
toc(log = TRUE)

# 3. Timing the solution 3 script (split the M simulations in more than one core)

tic("Timing solution 3")
source("scripts/hw4_solution3.r")
toc(log = TRUE)

printTicTocLog <- 
  function() {
    tic.log() %>% 
      unlist %>% 
      tibble(logvals = .) %>% 
      separate(logvals, 
               sep = ":", 
               into = c("Solutions", "log")) %>% 
      mutate(log = str_trim(log)) %>% 
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }

# Printing the results

printTicTocLog() %>% 
  knitr::kable()

# Comment:
# The third solution script was the fastest with roughly 23 seconds, compared
# to the original solution using almost 43 seconds to run the code.
# Solution 3 likely has the lowest running time because it parallelizes the 
# "M" simulations, which might be more computationally intensive and therefore
# yields a higher speedup when parallelized.



