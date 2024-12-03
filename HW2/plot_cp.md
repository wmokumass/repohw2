# This function looks at contraceptive use and a processed version to make a graph with a confidence interval.

## Description

This function looks at contraceptive use and a processed version to make a graph with a confidence interval.

## Usage

```r
plot_cp(dat, est, iso_code, CI = 95)
```

## Arguments

* `dat`: A dataframe of estimates of modern contraceptive use (mCPR) among married women
* `est`: A dataframe of processed version of dat
* `iso_code`: A number for a country
* `CI`: 80, 95 or NA

## Value

NA

## Examples

```r
plot_cp(dat, est, iso_code = 4)
plot_cp(dat, est, iso_code = 4, CI = NA)
plot_cp(dat, est, iso_code = 404, CI = 80)
```

