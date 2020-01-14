---
title: "Experis - PKPD Development"
author: "Kevin Putschko"
date: "1/14/2020"
output: 
  html_document: 
    keep_md: yes
---



# Testing the Function

Load the function with the `source()` command, where the string is the path of the `function.R` script.  

```r
source("r/function.R")
```

Then we run a test with the function.


```r
test_output <-
  fx_file_mapping(file_map = "mapping/mapping1.csv",
                  join_keys = c("STUDYID", "USUBJID", "DOMAIN"),
                  data_folder = "data_input")
```

And we access the output like this. 


```r
test_output$output_data %>% head()
```

```
## # A tibble: 6 x 10
##   CPROJ  GINV INV           GEOC      ID      PIPV   VST GEN         ORIG  AMT  
##   <dbl> <dbl> <chr>         <chr>     <chr>  <dbl> <dbl> <chr>       <chr> <chr>
## 1     1     1 DOSE NOT CHA~ 2003-05   CDISC~    NA    NA CDISC01.10~ AE    <NA> 
## 2     2     2 DOSE NOT CHA~ 2003-05-~ CDISC~    NA    NA CDISC01.10~ AE    <NA> 
## 3     3     3 DOSE NOT CHA~ 2003-08-~ CDISC~    NA    NA CDISC01.10~ AE    <NA> 
## 4     1     1 DOSE NOT CHA~ 2004-01-~ CDISC~    NA    NA CDISC01.10~ AE    <NA> 
## 5     2     2 DOSE NOT CHA~ 2004-01-~ CDISC~    NA    NA CDISC01.10~ AE    <NA> 
## 6     3     3 DOSE NOT CHA~ 2004-01-~ CDISC~    NA    NA CDISC01.10~ AE    <NA>
```

```r
test_output$output_check %>% head()
```

```
## # A tibble: 6 x 4
##   col   type_is   type_shouldbe type_match
##   <chr> <chr>     <chr>              <dbl>
## 1 CPROJ numeric   Char                   0
## 2 GINV  numeric   Num                    1
## 3 INV   character Num                    0
## 4 GEOC  character Num                    0
## 5 ID    character Num                    0
## 6 PIPV  numeric   Num                    1
```

```r
test_output$output_message
```

```
## [1] "Note: 40% of columns have matching types."
```

