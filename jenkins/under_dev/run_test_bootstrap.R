source("test_bootstrap.R")
new_datfile <- file.path("test_bootstrap", "Simple_results", "data.ss_new")
results <- check_expected_vals (new_datfile)
