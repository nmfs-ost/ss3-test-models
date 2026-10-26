source(".github/r_scripts/compare.R")

# ---- comparison controls ----
near_zero_tol <- 1e-10
# quantities to always ignore in failure logic
always_ignore <- c("maxgrad")
# add regex-style ignores here if needed
ignore_patterns <- c("_se$")

is_near_zero_pair <- function(x, y, tol = near_zero_tol) {
  is.finite(x) && is.finite(y) && abs(x) < tol && abs(y) < tol
}

is_ignored_quantity <- function(q, exact = always_ignore, patterns = ignore_patterns) {
  if (is.na(q) || !nzchar(q)) return(FALSE)
  if (q %in% exact) return(TRUE)
  any(vapply(patterns, function(p) grepl(p, q), logical(1)))
}

# get model folder names
mod_names <- list.dirs("model_runs", full.names = FALSE, recursive = FALSE)
message("Will compare ref runs to new results for these models:")
print(mod_names)
message("Notable changes in total likelihood, max gradients, and number of warnings:")

compare_list <- vector(mode = "list", length = length(mod_names))

for (i in mod_names) {
  pos <- which(mod_names == i)
  sum_file <- file.path("model_runs", i, "ss_summary.sso")
  ref_sum_file <- file.path("model_runs", i, "ss_summary_ref.sso")

  par_file <- file.path("model_runs", i, "ss3.par")
  ref_par_file <- file.path("model_runs", i, "ss3_ref.par")

  warn_file <- file.path("model_runs", i, "warning.sso")
  ref_warn_file <- file.path("model_runs", i, "warning_ref.sso")

  # IMPORTANT: do not let compare_ss_runs write failures yet
  compare_list[[pos]] <- compare_ss_runs(
    mod_name = i,
    sum_file = sum_file, ref_sum_file = ref_sum_file,
    par_file = par_file, ref_par_file = ref_par_file,
    warn_file = warn_file, ref_warn_file = ref_warn_file,
    hessian = FALSE,
    new_file = NULL,
    fail_file = file.path("run_R", "test_failed.csv")
  )
}

# write out all model results
compare_df <- do.call("rbind", compare_list)
compare_df_print <- format(compare_df, digits = 6, nsmall = 3, justify = "left")
message("see saved artifact all_results.csv for values and their differences.")
write.csv(compare_df_print, "run_R/all_results.csv", row.names = FALSE)

# ---- build failure table with exclusions + near-zero floor ----
# keep rows with a computed diff
fail_df <- compare_df[!is.na(compare_df$diff), , drop = FALSE]

# normalize quantity to character for matching
fail_df$quantity <- as.character(fail_df$quantity)

# 1) remove expected quantities (_se and maxgrad)
ignore_idx <- vapply(fail_df$quantity, is_ignored_quantity, logical(1))
if (any(ignore_idx)) {
  message("Ignoring quantities in failure logic: ",
          paste(unique(fail_df$quantity[ignore_idx]), collapse = ", "))
}
fail_df <- fail_df[!ignore_idx, , drop = FALSE]

# 2) remove near-zero pairs (both value and ref_value effectively zero)
near_zero_idx <- mapply(
  is_near_zero_pair,
  as.numeric(fail_df$value),
  as.numeric(fail_df$ref_value)
)
if (any(near_zero_idx, na.rm = TRUE)) {
  message("Ignoring near-zero pairs using tol = ", near_zero_tol, ": ",
          sum(near_zero_idx, na.rm = TRUE), " row(s)")
}
fail_df <- fail_df[!near_zero_idx, , drop = FALSE]

# save filtered change table for artifact/review
filtered_df_print <- format(fail_df, digits = 6, nsmall = 3, justify = "left")
write.csv(filtered_df_print, "run_R/all_changes.csv", row.names = FALSE)

# write failure file used by workflow gating
# if empty, write header-only CSV
fail_file <- file.path("run_R", "test_failed.csv")
if (nrow(fail_df) > 0) {
  write.csv(fail_df, fail_file, row.names = FALSE)
  message("Wrote ", nrow(fail_df), " failing row(s) to ", fail_file)
} else {
  write.csv(fail_df, fail_file, row.names = FALSE)
  message("No failing rows after exclusions/tolerance. Wrote empty ", fail_file)
}
