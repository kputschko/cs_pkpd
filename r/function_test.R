# Test Function -----------------------------------------------------------

# Load the function
source("r/function.R")

# Use this if data is in a folder like 'data_input'
test_output <-
  fx_file_mapping(file_map = "mapping/mapping1.csv",
                  join_keys = c("STUDYID", "USUBJID"),
                  data_folder = "data_input")


# Use this if data is in working directory `getwd()`
test_output <-
  fx_file_mapping(file_map = "mapping/mapping1.csv",
                  join_keys = c("STUDYID", "USUBJID"),
                  data_folder = NULL)


# Access output like this
test_output$output_data
test_output$output_check
test_output$output_message


# Errors
#fx_file_mapping(file_map = map)
#fx_file_mapping(file_map = 123)

#fx_file_mapping(file_map = "fake_name", join_key = abc)
#fx_file_mapping(file_map = "fake_name", join_key = 123)
