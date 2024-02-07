# function to update the reference files in the models subfolder. 
# assumes the working directory is the ss3-test-models repository.
#install.packages("r4ss")
#install.packages("SSutils")
library(r4ss)
library(SSutils)
# inputs to change ----
ss_exe <- "C:/SS/ss_3.30.20.exe" # path to model that is in the computer PATH variable
update_model_string <- "3.30.20" # the model version updating to.

# functions to use ----

#' Update the reference files for one model
#' Updates the ss3.par, ss_summary.sso, and warning.sso files
#' @param new_mod_path where the model files of one model have been written
#' @param ss_examples_folder subfolder containing the model files in the git repository.
#' @returns TRUE if files were all successfully replaced, FALSE if they were not all successfully replaced.
update_ref_files <- function(new_mod_path, ss_examples_folder = file.path(getwd(), "models")) {
  mod_name <- basename(new_mod_path)
  git_mod_path <- file.path(ss_examples_folder, mod_name)
  # list model files that need to be moved
  files_to_move <- c("ss3.par", "ss_summary.sso", "warning.sso")
  # copy model files from new_mod_path folder to the git_mod_path folder,
  results_of_move <- lapply(files_to_move,
                            function(x, new_mod_path, git_mod_path) {
    file.remove(file.path(git_mod_path, x))
    file.copy(from = file.path(new_mod_path, x),
              to = file.path(git_mod_path, x), 
              overwrite = FALSE) 
    #to make sure worked:
    worked <- file.exists(file.path(git_mod_path, x))
  }, new_mod_path = new_mod_path, git_mod_path = git_mod_path)
  if(all(unlist(results_of_move) == TRUE)) {
    files_replaced <- TRUE
  } else {
    files_replaced <- FALSE
  }
  files_replaced
}

# script ----

# first part: update the reference files.
# run models locally first
r4ss::populate_multiple_folders(outerdir.old = "models", 
                                outerdir.new = "new_models",
                                exe.file = NULL, verbose = FALSE)
new_mod_dirs <- list.dirs("new_models", recursive = FALSE)
# use the parallel version to speed up model runs 
SSutils::run_SS_models_parallel(dirvec = new_mod_dirs, 
                                model = ss_exe, exe_in_path = TRUE, 
                                parallel = TRUE)
new_mod_runs_folder <- file.path("new_models")
new_mod_path_list <- list.dirs(new_mod_runs_folder, recursive = FALSE,
                               full.names = TRUE)
run_results <- lapply(new_mod_path_list, update_ref_files)
run_results # check that the run results is TRUE. if not, something went wrong

# check all have been replaced with the correct version of summary files
# want to double check this before committing the files.
git_mods <- list.dirs("models", recursive = FALSE, full.names = TRUE)
first_line <- lapply(git_mods, function (x) {
   ss_sum <- readLines(file.path(x, "ss_summary.sso"))
   version <- grep(update_model_string , ss_sum, fixed = TRUE)
   if (!(1 %in% version)) {
     message(update_model_string, " not found on first line for ", x)
   }
   return(ss_sum[1])
 })
 # see all first lines for the files to verify the correct version of SS3 is being used.
unlist(first_line)

# second part: copy over new input files
# copy the new input files back into the old ones to get new formatting.
# note that using the ss_new files means that the some of the input values in the control file
# may change a bit to be at the MLE estimates.
r4ss::populate_multiple_folders(outerdir.old = "new_models", 
                                outerdir.new = "models", overwrite = TRUE,
                                exe.file = NULL, verbose = FALSE, 
                                use_ss_new = TRUE)
# manually, check that the changed files make sense and commit changes. Then, run clean up.

# cleanup ----
unlink("new_models", recursive = TRUE)
