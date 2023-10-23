# Assignment 1:  
library(tweedie) 
library(ggplot2)
library(doParallel)
library(foreach)

simTweedieTest <-  
  function(N){ 
    t.test( 
      rtweedie(N, mu=10000, phi=100, power=1.9), 
      mu=10000 
    )$p.value 
  } 


# Assignment 2:  
MTweedieTests <-  
  function(N,M,sig){ 
    sum(replicate(M,simTweedieTest(N)) < sig)/M 
  } 


# Assignment 3:  
df <-  
  expand.grid( 
    N = c(10,100,1000,5000, 10000), 
    M = 1000, 
    share_reject = NA) 


num_cores <- detectCores()
cl <- makeCluster(num_cores-1)
registerDoParallel(cl)

results <- foreach(i = 1:nrow(df), 
                   .combine = c,
                   .packages = "tweedie") %dopar% {
  MTweedieTests(N = df$N[i],
                M = df$M[i],
                sig = 0.05)
}

df$share_reject <- unlist(results)

stopCluster(cl)


