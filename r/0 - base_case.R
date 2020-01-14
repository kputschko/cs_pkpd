
# Experis - Roche Demo ----------------------------------------------------

pacman::p_load(tidyverse)


# Load Mapping File -------------------------------------------------------

data_map <-
  read_csv("mapping/mapping1.csv") %>%
  print()


# Process Mapping File ----------------------------------------------------

# Import ae, da datasets
data_1 <- read_csv("data_input/ae.csv") %>% print()
data_2 <- read_csv("data_input/da.csv") %>% print()

# Join data on matching study id and subject id columns
# Retain only specified columns
# Rename columns as specified

data_transform <-
  full_join(data_1, data_2, by = c("STUDYID", "USUBJID", "DOMAIN")) %>%
  select(
    CPROJ = AESPID,
    GINV = AESEQ,
    INV = AEACN,
    GEOC = AESTDTC,
    ID = STUDYID,
    PIPV = VISITNUM,
    VST = DASEQ,
    GEN = USUBJID,
    ORIG = DOMAIN,
    AMT = VISIT
  ) %>%
  print()

# --- Domain is weird here, i'll leave it out for now
# data_transform <-
#   full_join(data_1, data_2, by = c("STUDYID", "USUBJID")) %>%
#   select(
#     CPROJ = AESPID,
#     GINV = AESEQ,
#     INV = AEACN,
#     GEOC = AESTDTC,
#     ID = STUDYID,
#     PIPV = VISITNUM,
#     VST = DASEQ,
#     GEN = USUBJID,
#     # ORIG = DOMAIN,
#     AMT = VISIT
#   ) %>%
#   print()


# --- View the output
data_transform %>% view()


# NOTES:
# - What's up with domain here?  Should it be included before the join?


# Output Data -------------------------------------------------------------

# write_csv('data_output/output.csv')
