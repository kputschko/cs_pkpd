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

And we access the output like this.  Note that the `rmarkdown::paged_table()` is only for display purposes in HTML format.


```r
test_output$output_data %>% rmarkdown::paged_table()
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["CPROJ"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["GINV"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["INV"],"name":[3],"type":["chr"],"align":["left"]},{"label":["GEOC"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ID"],"name":[5],"type":["chr"],"align":["left"]},{"label":["PIPV"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["VST"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["GEN"],"name":[8],"type":["chr"],"align":["left"]},{"label":["ORIG"],"name":[9],"type":["chr"],"align":["left"]},{"label":["AMT"],"name":[10],"type":["chr"],"align":["left"]}],"data":[{"1":"1","2":"1","3":"DOSE NOT CHANGED","4":"2003-05","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100008","9":"AE","10":"NA"},{"1":"2","2":"2","3":"DOSE NOT CHANGED","4":"2003-05-13","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100008","9":"AE","10":"NA"},{"1":"3","2":"3","3":"DOSE NOT CHANGED","4":"2003-08-19","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100008","9":"AE","10":"NA"},{"1":"1","2":"1","3":"DOSE NOT CHANGED","4":"2004-01-06","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100014","9":"AE","10":"NA"},{"1":"2","2":"2","3":"DOSE NOT CHANGED","4":"2004-01-06","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100014","9":"AE","10":"NA"},{"1":"3","2":"3","3":"DOSE NOT CHANGED","4":"2004-01-27","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100014","9":"AE","10":"NA"},{"1":"4","2":"4","3":"DRUG INTERRUPTED","4":"2004-02-03","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100014","9":"AE","10":"NA"},{"1":"5","2":"5","3":"DRUG INTERRUPTED","4":"2004-02-04","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.100014","9":"AE","10":"NA"},{"1":"1","2":"1","3":"DOSE NOT CHANGED","4":"2003-10-16","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200001","9":"AE","10":"NA"},{"1":"5","2":"2","3":"DRUG WITHDRAWN","4":"2004-02-02","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200001","9":"AE","10":"NA"},{"1":"3","2":"3","3":"DOSE NOT CHANGED","4":"2003-12-25","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200001","9":"AE","10":"NA"},{"1":"4","2":"4","3":"DOSE NOT CHANGED","4":"2003-12-25","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200001","9":"AE","10":"NA"},{"1":"2","2":"5","3":"DOSE NOT CHANGED","4":"2003-10-16","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200001","9":"AE","10":"NA"},{"1":"3","2":"1","3":"DOSE NOT CHANGED","4":"2004-02-26","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200002","9":"AE","10":"NA"},{"1":"1","2":"2","3":"DOSE NOT CHANGED","4":"2004-01-05","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200002","9":"AE","10":"NA"},{"1":"2","2":"3","3":"DOSE NOT CHANGED","4":"2004-01-05","5":"CDISC01","6":"NA","7":"NA","8":"CDISC01.200002","9":"AE","10":"NA"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"2","7":"1","8":"CDISC01.100008","9":"DA","10":"BASELINE"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"2","8":"CDISC01.100008","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"3","8":"CDISC01.100008","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"10","7":"4","8":"CDISC01.100008","9":"DA","10":"WEEK 24"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"2","7":"1","8":"CDISC01.100014","9":"DA","10":"BASELINE"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"2","8":"CDISC01.100014","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"3","8":"CDISC01.100014","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"10","7":"4","8":"CDISC01.100014","9":"DA","10":"WEEK 24"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"2","7":"1","8":"CDISC01.200001","9":"DA","10":"BASELINE"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"2","8":"CDISC01.200001","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"3","8":"CDISC01.200001","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"10","7":"4","8":"CDISC01.200001","9":"DA","10":"WEEK 24"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"2","7":"1","8":"CDISC01.200002","9":"DA","10":"BASELINE"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"2","8":"CDISC01.200002","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"3","7":"3","8":"CDISC01.200002","9":"DA","10":"WEEK 2"},{"1":"NA","2":"NA","3":"NA","4":"NA","5":"CDISC01","6":"10","7":"4","8":"CDISC01.200002","9":"DA","10":"WEEK 24"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
test_output$output_check %>% rmarkdown::paged_table()
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["col"],"name":[1],"type":["chr"],"align":["left"]},{"label":["type_is"],"name":[2],"type":["chr"],"align":["left"]},{"label":["type_shouldbe"],"name":[3],"type":["chr"],"align":["left"]},{"label":["type_match"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"CPROJ","2":"numeric","3":"Char","4":"0"},{"1":"GINV","2":"numeric","3":"Num","4":"1"},{"1":"INV","2":"character","3":"Num","4":"0"},{"1":"GEOC","2":"character","3":"Num","4":"0"},{"1":"ID","2":"character","3":"Num","4":"0"},{"1":"PIPV","2":"numeric","3":"Num","4":"1"},{"1":"VST","2":"numeric","3":"Num","4":"1"},{"1":"GEN","2":"character","3":"Char","4":"1"},{"1":"ORIG","2":"character","3":"Num","4":"0"},{"1":"AMT","2":"character","3":"Num","4":"0"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
test_output$output_message
```

```
## [1] "Note: 40% of columns have matching types."
```

