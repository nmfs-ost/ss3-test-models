source(".github/r_scripts/compare.R")

# get model folder names
mod_names <- list.dirs("run_R/model_runs", full.names = FALSE, recursive = FALSE)
ref_file_folder <- file.path("ss_example_files", "models")
mod_run_folder <- file.path("run_R", "model_runs")
# remove 2 models b/c the results often shift and the models are likely 
# overparameterized
to_rm_mod_names <- c("Bocaccio_2015", "CanaryRf_2015", "CanaryRf_2015_recrdist", "Petrale2015")
to_rm <- which(mod_names %in% to_rm_mod_names)
mod_names <- mod_names[-to_rm]
message("Will compare ref runs to new results for these models:")
print(mod_names)
message("Notable changes in total likelihood, max gradients, ",
        " and number of warnings:")
compare_list <- vector(mode = "list", length = length(mod_names))
for(i in mod_names) {
  pos <- which(mod_names == i)
  sum_file <- file.path(mod_run_folder, i, "ss_summary.sso")
  ref_sum_file <- file.path(ref_file_folder, i, "ss_summary_ref.sso")
  
  par_file <- file.path(mod_run_folder, i, "ss3.par")
  ref_par_file <- file.path(ref_file_folder, i, "ss3_ref.par")
  
  warn_file <- file.path(mod_run_folder, i, "warning.sso")
  ref_warn_file <- file.path(ref_file_folder, i, "warning_ref.sso")
  
  fail_file <- file.path("run_R", "test_failed.csv")
  
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
message("see saved artifact all_results.csv for values and their differences.")
write.csv(compare_df_print, "run_R/all_results.csv", row.names = FALSE)
filtered_df <- compare_df[abs(compare_df$diff) != 0 & !is.na(compare_df$diff), ]
filtered_df <- format(filtered_df, digits = 6, nsmall = 3,
                                   justify = "left")
write.csv(filtered_df, "run_R/all_changes.csv", row.names = FALSE)
