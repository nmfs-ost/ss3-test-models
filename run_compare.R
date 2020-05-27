source("compare.R")

# get model folder names
mod_names <- list.dirs("run_R", full.names = FALSE)
print(mod_names)

compare_list <- vector(mode = "list", length = length(mod_names))
for(i in mod_names) {
  pos <- which(mod_names == i)
  sum_file <- file.path("run_R", i, "ss_summary.sso")
  ref_sum_file <- file.path("ss_example_files", i, "ss_summary_ref.sso")
  
  par_file <- file.path("run_R", i, "ss.par")
  ref_par_file <- file.path("ss_example_files", i, "ss_ref.par")
  
  warn_file <- file.path("run_R", i, "warning.sso")
  ref_warn_file <- file.path("ss_example_files", i, "warning_ref.sso")
  
  new_file <- file.path("run_R", paste0("compare_test_", i, ".txt"))
  fail_file <- file.path("run_R", "test_failed.txt")
  
  compare_list[[pos]] <- compare_ss_runs(mod_name = i, 
                  sum_file = sum_file, ref_sum_file = ref_sum_file,
                  par_file = par_file, ref_par_file = ref_par_file, 
                  warn_file = warn_file, ref_warn_file = ref_warn_file, 
                  new_file = new_file, fail_file = fail_file)
}
# write out all model results
compare_df <- do.call("rbind", compare_list)
write.table(compare_df, "run_R/compare_test.txt", row.names = FALSE)
