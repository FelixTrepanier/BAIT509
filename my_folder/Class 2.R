install.packages("tidyverse")
install.packages("ISLR") 
install.packages("knitr")


X_1 <- dnorm(0, mean = 0, sd = 1, log = FALSE)
X_2 <- rnorm(1, mean = 0, sd = 1)
X_2

library(tidyverse)
library(ISLR)
library(knitr)

# class 2
# oracle regression

genreg <- function(n){
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  eps <- rnorm(n)
  y <- 5-x1+2*x2+eps
  tibble(x1=x1, x2=x2, y=y)
}

dat<-genreg(1000)

#5-x1+2*x2+eps

dat<-mutate(dat,
            yhat = 5,
            yhat1 = 5-x1,
            yhat2 = 5+2*x2,
            yhat12 = 5-x1+2*x2)

dat          
              
(mse <- mean((dat$yhat - dat$y)^2))              
(mse1 <- mean((dat$yhat1 - dat$y)^2))               
(mse2 <- mean((dat$yhat2 - dat$y)^2)) 
(mse12 <- mean((dat$yhat12 - dat$y)^2))

# oracle classification

gencla <- function(n) {
  x <- rnorm(n) 
  pB <- 0.8/(1+exp(-x))
  y <- map_chr(pB, function(x) 
    sample(LETTERS[1:3], size=1, replace=TRUE,
           prob=c(0.2, x, 1-0.2-x)))
  tibble(x=x, y=y)
}


#x=1

(pB <- 0.8/(1+exp(-1)))
(pA <- 0.2)
(pC <- 1-pA-pB)
    
#x=-2

(pB <- 0.8/(1+exp(2)))
(pA <- 0.2)
(pC <- 1-pA-pB)

(dat2<-gencla(1000))
dat2<-mutate(dat2,
             yhat = sapply(x,function(x_)
               if (x_<0) "C" else "B"))
1-mean(dat2$yhat==dat2$y)


#irreduceable error























