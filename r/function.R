
# Experis - PKPD Demo -----------------------------------------------------
# Read a mapping file that dictates:
# 1 - which data sets to join,
# 2 - logic used to create new columns with dot notation
# 3 - which columns to keep
# 4 - which columns to rename
# 5 - expected column types


# -------------------------------------------------------------------------
# A test case is provided in the 'function.R' script
# -------------------------------------------------------------------------


# Function Definition -----------------------------------------------------
# Change the function name if you think of a better one!

fx_file_mapping <- function(file_map, join_keys = NULL, data_folder = NULL) {


  # Load Packages -----------------------------------------------------------
  library(dplyr)
  library(purrr)
  library(rlang)
  library(readr)
  library(scales)
  library(stringr)
  library(tidyr)
  library(tibble)


  # Check Input -------------------------------------------------------------
  stopifnot(file_map %>% is_character())

  if (!join_keys %>% is_null()) {
    stopifnot(join_keys %>% is_character())
  }

  # More initial checks here, etc.


  # Load Map File -----------------------------------------------------------
  data_map <- read_csv(file_map)


  # Process Map File --------------------------------------------------------

  # Step 1 - Separate 'data.column' into 'data' and 'column'
  process_separate <-
    data_map %>%
    separate(`Input Variable`, into = c('data', 'col'))

  # Step 2A - Get unique names of 'data'
  process_data_names <-
    process_separate %>%
    distinct(data) %>%
    pull()

  # Step 2B - Get names of columns to keep, and how to rename them
  process_col_names <-
    process_separate %>%
    select(new_name = `Output Variable`,
           old_name = col) %>%
    deframe()

  # Step 3 - Read each unique file, and full-join them using UI specified 'join_keys'
  process_read_join <-
    str_glue("{data_folder}/{process_data_names}.csv") %>%
    map(read_csv) %>%
    reduce(full_join, by = join_keys)

  # Step 4 - Select columns and rename them
  process_select_rename <-
    process_read_join %>%
    select({{process_col_names}})


  # Verify Process ----------------------------------------------------------

  # Create column type lookup table
  type_check <-
    c("Char" = "character",
      "Num"  = "numeric") %>%
    enframe("old_style", "new_style")

  # Compare expected column type with actual column type
  map_check <-
    process_select_rename %>%
    map_chr(class) %>%
    enframe("col", "type_is") %>%
    left_join(data_map %>% select(col = "Output Variable", type_shouldbe = DataType), by = "col") %>%
    left_join(type_check, by = c("type_shouldbe" = "old_style")) %>%
    mutate(type_match = ifelse(type_is == new_style, 1, 0)) %>%
    select(-new_style)

  # Show message with column mismatch
  map_check_message <-
    map_check$type_match %>%
    mean() %>%
    percent() %>%
    str_c("Note:", ., "of columns have matching types.", sep = " ")


  # Function Output ---------------------------------------------------------

  list(output_data = process_select_rename,
       output_check = map_check,
       output_message = map_check_message)

}
