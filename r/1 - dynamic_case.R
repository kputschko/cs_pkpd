# Experis - Roche Demo ----------------------------------------------------
# Read a mapping file that dictates:
# 1 - which data sets to join,
# 2 - logic used to create new columns with dot notation
# 3 - which columns to keep
# 4 - which columns to rename
# 5 - expected column types


# UI Parameters -----------------------------------------------------------

file_map <- "mapping1.csv"
join_key <- c("STUDYID", "USUBJID", "DOMAIN")


# Packages ----------------------------------------------------------------

library(dplyr)
library(purrr)
library(rlang)
library(readr)
library(scales)
library(stringr)
library(tidyr)
library(tibble)


# Load Mapping File -------------------------------------------------------

data_map <-
  str_glue("mapping/{file_map}") %>%
  read_csv() %>%
  print()


# Process Map -------------------------------------------------------------

# Step 1 - Separate 'data.column' into 'data' and 'column'
process_separate <-
  data_map %>%
  separate(`Input Variable`, into = c('data', 'col')) %>%
  print()

# Step 2A - Get unique names of 'data'
process_data_names <-
  process_separate %>%
  distinct(data) %>%
  pull() %>%
  print()

# Step 2B - Get names of columns to keep, and how to rename them
process_col_names <-
  process_separate %>%
  select(new_name = `Output Variable`,
         old_name = col) %>%
  deframe() %>%
  print()

# Step 3 - Read each unique file, and full-join them using UI specified 'join_key'
process_read_join <-
  str_glue("data_input/{process_data_names}.csv") %>%
  map(read_csv) %>%
  reduce(full_join, by = join_key) %>%
  print()

# Step 4 - Select columns and rename them
process_select_rename <-
  process_read_join %>%
  select({{process_col_names}}) %>%
  print()


# Check Map ---------------------------------------------------------------

# Create column type lookup table
type_check <-
  c("Char" = "character",
    "Num"  = "numeric") %>%
  enframe("old_style", "new_style") %>%
  print()

# Compare expected column type with actual column type
map_check <-
  process_select_rename %>%
  map_chr(class) %>%
  enframe("col", "type_is") %>%
  left_join(data_map %>% select(col = "Output Variable", type_shouldbe = DataType)) %>%
  left_join(type_check, by = c("type_shouldbe" = "old_style")) %>%
  mutate(type_match = ifelse(type_is == new_style, 1, 0)) %>%
  select(-new_style) %>%
  print()

# Show message with column mismatch
map_check$type_match %>%
  mean() %>%
  percent() %>%
  str_c("Note:", ., "of columns have matching types.", sep = " ") %>%
  message()


# Testing -----------------------------------------------------------------

# Select
# test_cols <- c("new1" = "am", "mpg")
# mtcars %>% select({{test_cols}})


# Mutate Tests ------------------------------------------------------------

transformation_table <-
  tribble(~colname, ~logic,
          "new_1",  "mpg * am",
          "new_2",  "ifelse(am == 1, 'one', 'zero')",
          "new_3",  "None",
          "new_4",  "NA",
          "new_5",  "null") %>%
  print()


transformation_process <-
  transformation_table %>%
  filter(!str_to_upper(logic) %in% c("NONE", "NA", "NULL")) %>%
  deframe() %>%
  map(parse_quo, caller_env()) %>%
  print()

mtcars %>% mutate(!!!transformation_process) %>% as_tibble()


# Mutate Map Tests --------------------------------------------------------

pacman::p_load(nycflights13)

nycflights13::airlines
nycflights13::airports
nycflights13::planes
nycflights13::weather

nycflights13::flights

df_a <- flights %>% sample_n(100) %>% print()
df_b <- planes %>% print()

trans_table_2 <-
  tribble(~new_col, ~old_cols, ~logic,
          "year", NA, NA,
          "month", NA, NA,
          "day", NA, NA,
          "carrier_model", c("df_a.carrier", "df_b.model"), 'str_c(carrier, model, sep = ": ")') %>%
  print()

# this works!?
mutate(mtcars, newd = mtcars$mpg * mtcars$cyl)

df_a %>%
  left_join(df_b) %>%
  mutate(cm = )
