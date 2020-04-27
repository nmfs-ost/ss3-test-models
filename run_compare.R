source("compare.R")

sum_file <- "run_R/ss_summary.sso"
ref_sum_file <- "run_R/ss_summary_ref.sso"
par_file <- "run_R/ss.par"
ref_par_file <- "run_R/ss_ref.par"
warn_file <- "run_R/warning.sso"
ref_warn_file <- "run_R/warning_ref.sso"
new_file <- "run_R/compare_test.txt"
fail_file <- "run_R/test_failed.txt"

compare_ss_runs(sum_file = sum_file, ref_sum_file = ref_sum_file,
                par_file = par_file, ref_par_file = ref_par_file, 
                warn_file = warn_file, ref_warn_file = ref_warn_file, 
                new_file = new_file, fail_file = fail_file)


