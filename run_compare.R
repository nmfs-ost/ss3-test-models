source("compare.R")

# get model folder names
mod_names <- list.dirs("run_R/models", full.names = FALSE, recursive = FALSE)
# remove 2 models b/c the results often shift and the models are likely 
# overparameterized
to_rm_mod_names <- c("CanaryRf_2015", "CanaryRf_2015_recrdist")
to_rm <- which(mod_names %in% to_rm_mod_names)
mod_names <- mod_names[-to_rm]
message("Will compare ref runs to new results for these models:")
print(mod_names)

compare_list <- vector(mode = "list", length = length(mod_names))
for(i in mod_names) {
  pos <- which(mod_names == i)
  sum_file <- file.path("run_R", "models", i, "ss_summary.sso")
  ref_sum_file <- file.path("ss_example_files", "models", i, "ss_summary_ref.sso")
  
  par_file <- file.path("run_R", "models", i, "ss.par")
  ref_par_file <- file.path("ss_example_files", "models", i, "ss_ref.par")
  
  warn_file <- file.path("run_R", "models", i, "warning.sso")
  ref_warn_file <- file.path("ss_example_files", "models", i, "warning_ref.sso")
  
  fail_file <- file.path("run_R", "test_failed.txt")
  
  compare_list[[pos]] <- compare_ss_runs(mod_name = i, 
                  sum_file = sum_file, ref_sum_file = ref_sum_file,
                  par_file = par_file, ref_par_file = ref_par_file, 
                  warn_file = warn_file, ref_warn_file = ref_warn_file, 
                  new_file = NULL, fail_file = fail_file)
}
# write out all model results
compare_df <- do.call("rbind", compare_list)
compare_df_print <- format(compare_df, digits = 6, nsmall = 3,
                           justify = "left")
message("see saved artifact compare_test.txt for values and their differences.")
write.table(compare_df_print, "run_R/compare_test.txt", row.names = FALSE)
