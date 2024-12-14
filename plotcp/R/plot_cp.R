library(tidyverse)
library(readxl)
library(testthat)
library(assertthat)
library(devtools)

#' This function looks at contraceptive use and a processed version to make a graph with a confidence interval.
#'
#' @param dat A dataframe of estimates of modern contraceptive use (mCPR) among married women
#' @param est A dataframe of processed version of dat
#' @param iso_code A number for a country
#' @param CI 80, 95 or NA
#'
#' @return NA
#'
#'
#' @examples
#' plot_cp(dat, est, iso_code = 4)
#' plot_cp(dat, est, iso_code = 4, CI = NA)
#' plot_cp(dat, est, iso_code = 404, CI = 80)
#'
#'
#'
plot_cp <- function(dat, est, iso_code, CI = 95) {
   assert_that(has_name(dat, "division_numeric_code"))
   assert_that(has_name(dat, "start_date"))
   assert_that(has_name(dat, "end_date"))
   assert_that(has_name(dat, "contraceptive_use_modern"))
   assert_that(is.numeric(dat$contraceptive_use_modern))
   assert_that(has_name(est,"iso"))
   est2 <- est %>%
    filter(iso == iso_code)
   assert_that(not_empty(est2))
  dat2 <- dat %>%
    mutate(Year = (start_date + end_date) / 2, mCPR = contraceptive_use_modern * 100) %>%
    filter(division_numeric_code == iso_code, is_in_union == "Y")
    assert_that(not_empty(dat2))

  if(is.na(CI)) {
    ggplot() +
      geom_line(data = est2, aes(x = Year, y = Median)) +
      geom_point(data = dat2, aes(x = Year, y = mCPR)) +
      labs(x = "Time", y = "Modern use (%)", title = est$`Country or area`[1])
  }
  else if(CI == 80) {
    ggplot() +
      geom_line(data = est2, aes(x = Year, y = Median)) +
      geom_smooth(
        data = est2,
        stat = "identity",
        aes(x = Year, y = Median, ymax = U80, ymin = L80)
      ) +
      geom_point(data = dat2, aes(x = Year, y = mCPR)) +
      labs(x = "Time", y = "Modern use (%)", title = est$`Country or area`[1])
  }
  else if(CI == 95) {
    ggplot() +
      geom_line(data = est2, aes(x = Year, y = Median)) +
      geom_smooth(
        data = est2,
        stat = "identity",
        aes(x = Year, y = Median, ymax = U95, ymin = L95)
      ) +
      geom_point(data = dat2, aes(x = Year, y = mCPR)) +
      labs(x = "Time", y = "Modern use (%)", title = est$`Country or area`[1])
  }
  else {
    stop('hey the CI can only be 80, 95, or NA\n' , ' you have provided: ', CI)
  }


}


