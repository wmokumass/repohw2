library(tidyverse)
library(readxl)
library(testthat)
library(assertthat)
library(devtools)




get_width_ci <- function(est, iso_code, coverage){

  
  if(coverage == 80) { 
    est3 <- est %>%
    filter(iso == iso_code) %>% 
      mutate(width = (U80 - L80)) %>% 
      select(Year, width) %>% 
      rename(year = Year) 
  }
  else{
    est3 <- est %>%
      filter(iso == iso_code) %>% 
      mutate(width = (U95 - L95)) %>% 
      select(Year, width) %>% 
      rename(year = Year)
    
  }
  return(est3) 
}
  
  
  
  
  
  
  

  